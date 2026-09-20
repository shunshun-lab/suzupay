# Suzupay / LocalManus

SuzuPay は、インバウンド旅行者・地域店舗・地域運営者をつなぐ地域経済インフラ / regional operating layer を目指すプロジェクトです。

原点はステーブルコイン × QR 決済ですが、現在は **地域発見 → 回遊 → 参加 → 決済 → データ → 再訪** までを一体化する方向へ拡張しています。

## Start here

- [Master Strategy](docs/strategy/MASTER_STRATEGY.md) — 事業・プロダクト・地域展開・行政/補助金・AI・ポータル・決済・データ戦略の統合版
- [Drive 正本索引](docs/strategy/DRIVE.md) — 対外共有は Google Drive
- [2026-09-19 MTG](docs/meetings/2026-09-19-suzupay-mtg.md) — 最新会議メモ
- [先進事例 vs 令和8採択](docs/strategy/overtourism-cases.md) — 観光庁案件の切り分け
- [Portal thesis](docs/strategy/portal-thesis.md) — LocalManus × Tourism Portal × Suzupay の三層
- [Inbound portal prototype](portal/index.html) — 来訪者向け見せ方（EN first）
- [大阪 ACT（内側）](docs/strategy/osaka-suzupay-portal-ACT.md) — Working Backwards · Drive ミラー
- [大阪打診草案（観光局向け・DRAFT）](docs/strategy/outreach/osaka-tourism-bureau-pitch-DRAFT.md)
- [対外・打診の必須構成](docs/strategy/outreach/README.md) — 前提／プロダクト／ビジョン／着地（O1–O9）
- [Osaka showcase skeleton](portal/osaka.html) — 長官デモ1枚の静的骨格（加盟店名なし）

## GitHub 日次反映

対応リポ: [shunshun-lab/suzupay](https://github.com/shunshun-lab/suzupay)

Mac ローカルの変更を **毎日 03:00（JST）** に commit & push（睡眠で飛ばした場合は起床後に当日1回 catch-up）。

- スクリプト: `scripts/nightly-github-sync.sh`
- LaunchAgent: `~/Library/LaunchAgents/com.shuta.suzupay-github-sync.plist`
- 手動: `scripts/nightly-github-sync.sh --force`
- ログ: `.cache/logs/nightly-github-sync-*.log`

Drive → リポ: `scripts/drive-to-repo-pull.sh` が戦略フォルダを `docs/strategy/from-drive/` に text export（夜間 sync の前段）。Drive が対外正本、リポは作業ミラー。

## 二層の見せ分け

| 置き場 | 中身 | 向け先 |
|--------|------|--------|
| `docs/strategy/` | 事例・補助金・統合戦略 | 内部・官公庁・地域側 |
| `portal/` | 別の時間・場所・体験への誘導 ＋ 現地決済 | インバウンド来訪者 |

来訪者UIに補助金・DMO・事例集の話は出さない。

## Repository structure

```text
docs/
  strategy/    # 統合戦略・事例・仮説
  meetings/    # 会議メモ
portal/        # インバウンド向けプロトタイプ（EN）
```

## Current focus

- コアプロダクト / フロントエンド完成
- 福岡 PoC
- LINE 連携
- 観光庁・DMO・自治体向け展開
- オーバーツーリズム対策（宮島型行動誘導 × 小樽型人流 × 京都型住民ポータル）
- インバウンド / デジタルノマド向け地域ポータル
- AI（LocalManus）による地域情報リサーチ・更新・サイト運営自動化
- SuzuPay 決済と地域発見 / 回遊の統合

詳細は Master Strategy を参照してください。

## 参照リンク

- [令和8年度 特設サイト](https://ot-kankoseibi.go.jp/)
- [過年度取組事例集（45地域）](https://www.mlit.go.jp/kankocho/jirei_shien/overtourism.html)
