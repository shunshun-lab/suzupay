#!/bin/bash
# Drive → ローカルリポ取り込み（対外正本のミラー）
set -euo pipefail

REPO_ROOT="${SUZUPAY_ROOT:-/Users/shuta/suzupay}"
MANIFEST="${REPO_ROOT}/scripts/drive-mirror-manifest.json"
DRY_RUN=0
STRICT=0

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --strict) STRICT=1 ;;
  esac
done

if [ "${SUZUPAY_SKIP_DRIVE:-0}" = "1" ]; then
  echo "SUZUPAY_SKIP_DRIVE=1; skip drive pull"
  exit 0
fi

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
cd "$REPO_ROOT"

if [ ! -f "$MANIFEST" ]; then
  echo "missing manifest: $MANIFEST" >&2
  exit 1
fi

if ! command -v gcloud >/dev/null 2>&1; then
  echo "gcloud not found" >&2
  [ "$STRICT" = "1" ] && exit 1 || exit 0
fi

TOKEN="$(gcloud auth application-default print-access-token 2>/dev/null || true)"
if [ -z "$TOKEN" ]; then
  TOKEN="$(gcloud auth print-access-token 2>/dev/null || true)"
fi
if [ -z "$TOKEN" ]; then
  echo "no Google access token" >&2
  [ "$STRICT" = "1" ] && exit 1 || exit 0
fi

echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') drive-to-repo-pull start dry_run=${DRY_RUN} ===="

set +e
python3 - "$REPO_ROOT" "$MANIFEST" "$TOKEN" "$DRY_RUN" <<'PY'
import json, pathlib, sys, urllib.parse, urllib.request, datetime

repo, manifest_path, token, dry = sys.argv[1:5]
dry = dry == "1"
manifest = json.loads(pathlib.Path(manifest_path).read_text())
out_dir = pathlib.Path(repo) / manifest["out_dir"]
folder = manifest["folder_id"]
out_dir.mkdir(parents=True, exist_ok=True)

def api_get(url: str) -> bytes:
    req = urllib.request.Request(url, headers={"Authorization": f"Bearer {token}"})
    with urllib.request.urlopen(req, timeout=90) as r:
        return r.read()

q = urllib.parse.quote(f"'{folder}' in parents and trashed=false")
listing = json.loads(api_get(
    f"https://www.googleapis.com/drive/v3/files?q={q}&fields=files(id,name,mimeType)&pageSize=100"
))
known = {d["id"] for d in manifest["docs"]}
extra = [f for f in listing.get("files", []) if f["id"] not in known and not (f["name"].startswith("ZZ_") or "旧INDEX" in f["name"] or "旧 INDEX" in f["name"])]
if extra:
    print("unmapped Drive files (add to manifest if needed):")
    for f in extra:
        print(f"  - {f['id']}  {f['name']}")
else:
    print("folder listing: all non-ZZ docs are in manifest")

def strip_exported(t: str) -> str:
    return "".join(line for line in t.splitlines(True) if not line.strip().startswith("exported:"))

changed_n = 0
failed = 0
exported_at = datetime.datetime.now().astimezone().strftime("%Y-%m-%d %H:%M:%S %Z")

for doc in manifest["docs"]:
    doc_id = doc["id"]
    dest = out_dir / doc["file"]
    try:
        meta = json.loads(api_get(
            f"https://www.googleapis.com/drive/v3/files/{doc_id}?fields=id,name,modifiedTime,webViewLink"
        ))
        raw = api_get(
            f"https://www.googleapis.com/drive/v3/files/{doc_id}/export?mimeType=text/plain"
        )
    except Exception as e:
        print(f"FAIL {doc['file']}: {e}")
        failed += 1
        continue
    if raw.startswith(b"\xef\xbb\xbf"):
        raw = raw[3:]
    body = raw.decode("utf-8", errors="replace").strip() + "\n"
    link = meta.get("webViewLink") or f"https://docs.google.com/document/d/{doc_id}/edit"
    header = (
        "<!--\n"
        "  mirrored from Google Drive (external SoT)\n"
        f"  id: {doc_id}\n"
        f"  name: {meta.get('name', doc.get('title',''))}\n"
        f"  modified: {meta.get('modifiedTime','')}\n"
        f"  exported: {exported_at}\n"
        f"  source: {link}\n"
        "  format: text/plain export (formatting may be lossy)\n"
        "-->\n\n"
    )
    out = header + body
    old = dest.read_text(encoding="utf-8") if dest.exists() else None
    changed = old is None or strip_exported(old) != strip_exported(out)
    print(f"{'CHANGE' if changed else 'same  '} {dest.name}  modified={meta.get('modifiedTime','')}")
    if changed:
        changed_n += 1
        if not dry:
            dest.write_text(out, encoding="utf-8")

readme = out_dir / "README.md"
readme_body = """# from-drive/

Google Drive 戦略フォルダからの **自動ミラー**（text/plain export）。

- 対外・共同編集の正本は Drive
- このディレクトリは `scripts/drive-to-repo-pull.sh` が上書きする
- 手編集ミラー（例: `../osaka-suzupay-portal-ACT.md`）とは分離

```bash
scripts/drive-to-repo-pull.sh
scripts/nightly-github-sync.sh --force
```
"""
if not dry:
    readme.write_text(readme_body, encoding="utf-8")

print(f"done changed={changed_n} failed={failed} dry_run={dry}")
sys.exit(1 if failed else 0)
PY
ec=$?
set -e

echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') drive-to-repo-pull end ec=${ec} ===="
if [ "$STRICT" = "1" ] && [ "$ec" != "0" ]; then
  exit "$ec"
fi
exit 0
