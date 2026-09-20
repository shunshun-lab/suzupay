# SuzuPay Strategy — Drive 正本

対外共有・共同編集は **Google Drive**。リポの `docs/strategy/` は作業用ミラー。

**フォルダ:** https://drive.google.com/drive/folders/1btxrPWU9CJFKdH7ITv2mq0NQR_r1hLFa

**INDEX（2026-09-20）:** https://docs.google.com/document/d/1DnS2WxqWWwwexTDFWxp64XzC38aBjkb4MoDl0AKueG8/edit  
**旧INDEX（残置）:** https://docs.google.com/document/d/1VxKqp5if9eDIyxn-dZhPnPlxl1RwqDH1OnICvT6axdY/edit

| 用途 | 状態 | Drive URL |
|------|------|-----------|
| 補助金Gusto | Drive上（owner Kosuke・共有） | https://docs.google.com/document/d/1CmS4a8y4mdntuM29b0r24MiELiZMgIsgz9lcI97FFEY/edit |
| 福岡パック | Drive上 | https://docs.google.com/document/d/10R8mzLzf_ZXxv5LTMUUCq_9-yjK70YC_Jmrb_l3kwsE/edit |
| 大阪ACT | Drive上 + リポミラー | https://docs.google.com/document/d/1wMPpsn5TtFGe3iaMemcS_jmuxj3WEAuEqBaxIfsqNLw/edit · [`osaka-suzupay-portal-ACT.md`](osaka-suzupay-portal-ACT.md) |
| 大阪打診草案 v3（着地A+D+E） | Drive上 + リポ | https://docs.google.com/document/d/1oQ724Rb7i31bnYWTc1o5vltb_lKbqdKsE0PEqSQ6DGI/edit · [`outreach/osaka-tourism-bureau-pitch-DRAFT.md`](outreach/osaka-tourism-bureau-pitch-DRAFT.md) |
| 全体構想 | Drive上（種） | https://docs.google.com/document/d/1ZiaMnTVJ2AZQ-GGoQ_a4G6Rev_13LvrosFhl9cU5wvc/edit |
| MTG 9/19 | Drive上（整理版） | https://docs.google.com/document/d/1rF7YUgzm-K-WqcOW0EEaiLJg_IAWXL_ZoYwRLn5eb3o/edit |
| MASTER_STRATEGY | Drive上 + リポ | https://docs.google.com/document/d/1z5Q3yslX3CqpkuheERqFafpEzuDZXIHoVefLX_PzDOE/edit · [`MASTER_STRATEGY.md`](MASTER_STRATEGY.md) |
| 定量OPEN | Driveスタブ（Kosuke） | https://docs.google.com/document/d/1fuXblcbZIAp4BwYnEj3x1xy07sM805yWznGDGVYKmns/edit |
| 営業リスト | Sheet | https://docs.google.com/spreadsheets/d/1CalKvZN5eTUBK2Dm6k7w6QKKMfA26LGadVvKSBlc5CQ/edit |
| portal-thesis | リポのみ | `docs/strategy/portal-thesis.md` |
| overtourism-cases | リポのみ | `docs/strategy/overtourism-cases.md` |
| 大阪デモ骨格 | リポ | [`portal/osaka.html`](../../portal/osaka.html) |

## まだ足りない

- Next.js `/osaka`（portal-factory 本番）— ACT Must · 別リポ（Claude 週次上限で待機可）
- Drive → リポ取り込み — `scripts/drive-to-repo-pull.sh` → [`from-drive/`](from-drive/)（夜間 sync 前段・soft-fail）。手編集ミラーとは分離
- **地域経済効果・域外購買力の定量** — OPEN / Kosuke / 依頼 2026-09-19 / 期限 TBD  
  スタブ: https://docs.google.com/document/d/1fuXblcbZIAp4BwYnEj3x1xy07sM805yWznGDGVYKmns/edit

## FACT ≠ ASSUMPTION

数字・制度・実装は FACT（出典）と ASSUMPTION（仮説）を混ぜない。CURRENT / PROPOSED / HISTORICAL を崩さない。

参考: Gemini生メモ https://docs.google.com/document/d/1TFqPi811y2_YDUnr1KUZimiO9t9ksSfPkkbiOrpFVKw/edit

更新: 2026-09-20

## from-drive/

Drive からの text/plain 自動ミラー。手編集の `MASTER_STRATEGY.md` / `osaka-suzupay-portal-ACT.md` 等は上書きしない。

## 対外docs 必須

前提整理 / プロダクト説明 / ビジョン説明 / 着地（詳細は [`outreach/README.md`](outreach/README.md)）
