# from-drive/

Google Drive 戦略フォルダからの **自動ミラー**（text/plain export）。

- 対外・共同編集の正本は Drive
- このディレクトリは `scripts/drive-to-repo-pull.sh` が上書きする
- 手編集ミラー（例: `../osaka-suzupay-portal-ACT.md`）とは分離

```bash
scripts/drive-to-repo-pull.sh
scripts/nightly-github-sync.sh --force
```
