#!/bin/bash
# SuzuPay: ローカル作業ツリーを GitHub (shunshun-lab/suzupay) へ日次反映
# launchd: com.shuta.suzupay-github-sync（想定 03:00 JST + 取りこぼし catch-up）
set -euo pipefail

REPO_ROOT="${SUZUPAY_ROOT:-/Users/shuta/suzupay}"
LOG_DIR="${REPO_ROOT}/.cache/logs"
STAMP_FILE="${REPO_ROOT}/.cache/nightly-github-sync.stamp"
REMOTE="${SUZUPAY_REMOTE:-origin}"
BRANCH="${SUZUPAY_BRANCH:-main}"
GH_USER="${SUZUPAY_GH_USER:-shunshun-lab}"
DRY_RUN=0

mkdir -p "$LOG_DIR"
LOG_FILE="${LOG_DIR}/nightly-github-sync-$(date +%Y%m%d).log"
exec >>"$LOG_FILE" 2>&1

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --force) FORCE=1 ;;
  esac
done
FORCE="${FORCE:-0}"

echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') suzupay-github-sync start dry_run=${DRY_RUN} force=${FORCE} ===="

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

TODAY="$(date +%Y-%m-%d)"
if [ "$FORCE" != "1" ] && [ -f "$STAMP_FILE" ] && [ "$(cat "$STAMP_FILE")" = "$TODAY" ]; then
  echo "already synced today (${TODAY}); exit"
  exit 0
fi

# 深夜3時想定。それより前の RunAtLoad / StartInterval は翌日扱い（stamp で抑止）
HOUR="$(date +%H)"
HOUR=$((10#$HOUR))
if [ "$FORCE" != "1" ] && [ "$HOUR" -lt 3 ]; then
  echo "before 03:00 local; skip until window"
  exit 0
fi

cd "$REPO_ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "not a git repo: $REPO_ROOT"
  exit 1
fi

# 認証: アクティブアカウントを変えずに push 用トークンだけ使う
if ! command -v gh >/dev/null 2>&1; then
  echo "gh not found"
  exit 1
fi
TOKEN="$(gh auth token --user "$GH_USER" 2>/dev/null || true)"
if [ -z "$TOKEN" ]; then
  echo "cannot get gh token for user=${GH_USER}"
  exit 1
fi

git fetch "$REMOTE" "$BRANCH"

# リモートが進んでいれば先に取り込む（衝突時は止める）
LOCAL="$(git rev-parse HEAD)"
REMOTE_SHA="$(git rev-parse "${REMOTE}/${BRANCH}")"
if [ "$LOCAL" != "$REMOTE_SHA" ]; then
  if git merge-base --is-ancestor HEAD "${REMOTE}/${BRANCH}"; then
    echo "fast-forward to ${REMOTE}/${BRANCH}"
    if [ "$DRY_RUN" = "1" ]; then
      echo "[dry-run] would: git merge --ff-only ${REMOTE}/${BRANCH}"
    else
      git merge --ff-only "${REMOTE}/${BRANCH}"
    fi
  elif git merge-base --is-ancestor "${REMOTE}/${BRANCH}" HEAD; then
    echo "local is ahead of remote; will push after commit"
  else
    echo "diverged from ${REMOTE}/${BRANCH}; manual resolve required"
    exit 1
  fi
fi

# 機密っぽいものは絶対に載せない
git add -A
git reset HEAD -- .env .env.* '*.pem' .cache 2>/dev/null || true

if git diff --cached --quiet && git diff --quiet; then
  # ステージもワーキングもきれい
  if [ -z "$(git status --porcelain)" ]; then
    echo "clean working tree"
    if [ "$DRY_RUN" != "1" ]; then
      echo "$TODAY" >"$STAMP_FILE"
    fi
    # ローカル先行コミットだけ残っている場合は push
    AHEAD="$(git rev-list --count "${REMOTE}/${BRANCH}..HEAD" 2>/dev/null || echo 0)"
    if [ "$AHEAD" != "0" ]; then
      echo "ahead by ${AHEAD}; pushing"
      if [ "$DRY_RUN" = "1" ]; then
        echo "[dry-run] would push"
      else
        git push "https://x-access-token:${TOKEN}@github.com/shunshun-lab/suzupay.git" "HEAD:${BRANCH}"
        echo "$TODAY" >"$STAMP_FILE"
      fi
    fi
    echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') end (noop) ===="
    exit 0
  fi
fi

# 未追跡のみ / 変更あり
git add -A
git reset HEAD -- .env .env.* '*.pem' .cache 2>/dev/null || true

if git diff --cached --quiet; then
  echo "nothing staged after secret filter"
  if [ "$DRY_RUN" != "1" ]; then
    echo "$TODAY" >"$STAMP_FILE"
  fi
  echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') end (noop) ===="
  exit 0
fi

MSG="chore: nightly sync $(date '+%Y-%m-%d %H:%M %Z')"
echo "commit: $MSG"
git diff --cached --stat

if [ "$DRY_RUN" = "1" ]; then
  echo "[dry-run] would commit and push; unstaging"
  git reset HEAD >/dev/null
  echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') end (dry-run) ===="
  exit 0
fi

git commit -m "$MSG"
git push "https://x-access-token:${TOKEN}@github.com/shunshun-lab/suzupay.git" "HEAD:${BRANCH}"
echo "$TODAY" >"$STAMP_FILE"
echo "==== $(date '+%Y-%m-%d %H:%M:%S %Z') end ok ===="
