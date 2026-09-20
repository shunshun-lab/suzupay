<!--
  mirrored from Google Drive (external SoT)
  id: 1wMPpsn5TtFGe3iaMemcS_jmuxj3WEAuEqBaxIfsqNLw
  name: ACT — 大阪 × SuzuPay × Portal Factory（内側）
  modified: 2026-09-20T08:02:43.629Z
  exported: 2026-09-20 17:10:33 JST
  source: https://docs.google.com/document/d/1wMPpsn5TtFGe3iaMemcS_jmuxj3WEAuEqBaxIfsqNLw/edit?usp=drivesdk
  format: text/plain export (formatting may be lossy)
-->

ACT — 大阪 × SuzuPay × Portal Factory
Audience: 内側のみ（Alstroemeria / 開発 / 対外前の意思決定）
Format: Amazon Working Backwards 風 ACT（未来の発表 → FAQ → 何を決めるか）
Date: 2026-09-20
Status: DRAFT · 対外未公開
Owner: right（オーケストレーション）→ 実装は portal-factory / OpenClaw lists
________________


0. この文書の使い方
* スライドではない。読んで決めるための1本。
* 対外用ではない。長官席の台本は別紙（後述の「対外1枚」に落とす）。
* 数字・加盟店名は FACT 以外を断定しない。空欄と UNKNOWN を残す。
________________


1. Working Backwards — 未来の発表文（内側用・仮）
2027年春（仮）— 大阪の観光・地域循環の「見える化＋決済」が、同じポータル型で動き始めた。
大阪の関係者は、公共・緑化・循環・受入の候補を地図と表で共有できる。
探索中（scouted）と確定（registered）が色で分かれ、確定情報だけが対外に出る。
決済の入口は SuzuPay。Portal Factory は発見と信頼の器、SuzuPay は決済と証跡のレール。
加盟店名は人手確認前に載せない。全国の自治体サーチは裏方で回り、表に出すのはパイロット面（まず大阪）だけである。
この発表が嘘にならないために、今決めることが本 ACT の本体。
________________


2. 一言（内側の北）
観光の現場（公共・循環・地域）を地図で見える化し、SuzuPay で決済まで閉じるポータルを、すでに動く型として持ち、大阪を最初のショーケース面にする。
件数自慢（自治体クエリ数千）は 工場の能力証明であって、長官デモの主役ではない。
________________


3. 顧客は誰か（内側の定義）
層
	誰
	何が欲しいか
	我々が渡すもの
	A. 決裁・政策
	大阪観光・地域側の上位（持ち込み想定）
	「動いている共通基盤」の証拠
	/osaka 1枚デモ＋信頼ルール
	B. 実務
	地域・DMO・事業者窓口
	候補の整理、登録導線
	scouted→人手→registered
	C. レール
	SuzuPay
	決済だけの話にならない器
	Portal＝発見/信頼、Pay＝決済
	D. 自分たち
	Alstroemeria
	横展開可能な型
	Portal Factory 二面＋調査工場
	対外の「長官」呼称は肩書未確認のことがある。持ち込み先の正式名称は対外前に確定する（UNKNOWNのまま持ちこまない）。
________________


4. 課題（なぜ今）
1. 見えない — インバウンド／地域は候補が多いが、「どこが本気で循環・受入できるか」が共有できない。
2. 決済がバラバラ — 見える化と決済が別物だと、パイロットが「資料」で終わる。
3. 信頼が壊れやすい — 未確認の店名やKPIを載せた瞬間に、政策・観光の席では終わり。
________________


5. 解決の型（何を売る／見せるか）
5.1 製品の分解
部品
	役割
	今の状態（内側）
	Portal Factory /value
	価値の源泉＝探索・出典付き構造化
	同型ポータルとして存在
	Portal Factory /inbound
	インバウンド×地域、SuzuPay 入口
	同型ポータルとして存在
	/about + PITCH 文書
	説明の正本
	2026-09-20 に密度引き上げ済
	OpenClaw lists / LocalManus
	県→自治体の戦略サーチ工場
	稼働中（進捗は /status 系で自動）
	戦略5本
	花き緑化（日比谷花壇型）・剪定バイオマス・建設副産物・堆肥・公共調達循環
	サーチ軸として定義済
	SuzuPay
	決済レール
	入口として物語に接続（名簿は空が正しい）
	/osaka ショーケース
	長官デモの1枚目
	未実装 → 本 ACT の主 Ask
	5.2 信頼ルール（非交渉）
1. 主張に FACT / PLANNED / PROPOSED / UNKNOWN。
2. 加盟店名・KPIは捏造しない。 merchants 空欄が正しい。
3. 自動反映は scouted まで。registered / pilot は人手。
4. 対外冒頭に全国 ops ノイズを出さない。大阪面が先。
5.3 持ち込みの3段（対外台本の骨格）
1. 課題 — 候補は多いが見えない。決済もバラバラ。
2. 証拠 — 戦略別サーチ→地図→表が一気通貫。捏造なし。
3. 提案 — 大阪をパイロット面に。見える化＝Portal Factory、決済＝SuzuPay。
________________


6. デモ設計（8–10分）— 「大阪1枚」
順
	面
	見せる一言
	1
	/osaka（新）
	「大阪でこう見える」
	2
	地図
	橙＝偵察、青＝試験、緑＝確定。「緑だけ対外確定」
	3
	戦略1つ（花き/緑化）
	「観光×資源循環の切り口」
	4
	SuzuPay 帯
	「決済はSuzuPay。ポータルは発見と信頼」
	5
	/status（任意・30秒）
	「裏で調査工場が回っている」
	やらない: 未確認店名、冒頭の全国 ops、件数自慢をメインにすること。
________________


7. FAQ（Working Backwards）
Q. なぜ福岡 POC リポなのに大阪？
A. 型の横展開が製品そのもの。福岡は文脈とレール、大阪は政策・観光デモの面。FACTは「同型で増やす設計」、大阪本番接続は PLANNED。
Q. 自治体8695クエリは対外で言う？
A. 聞かれたら「裏方の探索能力」とだけ。デモの主役にしない。
Q. SuzuPay はもう大阪で使えるのか？
A. レールとしての物語接続はする。地域・加盟の確定状況は UNKNOWN/PLANNED を混ぜない。空欄を見せる。
Q. Portal Factory と ops 地図ポータルは同じ？
A. 内側では系統が分かれている時期がある。対外では「Portal Factory＝説明と地域面」「調査工場＝OpenClaw」と分けて説明し、統合は実装 Ask に含める。
Q. 成功とは？
A. （内側KPI案）
* /osaka がデモ可能な状態
* 大阪フィルタの scouted が地図に載る（店名捏造なし）
* 持ち込み後の次アクション（協議・データ・窓口）が1つ取れる
Q. やらないことは？
A. コールドでの断定的加盟店リスト、未確認肩書での対外送付、全国 ops を冒頭に出すこと。
________________


8. 今四半期の ACT（何をするか）
Must（これがないと未来の発表文が嘘）
1. /osaka ショーケース骨格 — 地図（大阪）＋戦略タブ＋SuzuPay帯＋ストーリー文（FACTのみ）。
2. 長官向け1枚モード — ops 詳細を畳む。
3. 説明正本の固定 — /about + 本 ACT + 対外1枚（別紙）の三角。
4. 信頼ルールの UI 明示 — scouted / registered の凡例を大阪面でも必ず出す。
Should
5. 大阪の戦略別ピンが、サーチ進捗に応じて増える（自動は scouted のみ）。
6. 持ち込み用「対外1枚」（本 ACT から FACT だけ抽出）。
7. ポータル系統（説明用 portal-factory と ops 地図）の導線を内側で一本化。
Could
8. 他都市テンプレ（/{region}）。
9. 政策用語の大阪ローカライズ（窓口名・事業名は出典付きのみ）。
Won't（今はやらない）
* 未確認加盟店の掲載
* 対外への件数自慢メインの資料
* 決済本番の約束をポータル文言に書くこと
________________


9. 決定を求める Ask（この文書のゴール）
内側で次を Yes/No する。
#
	Ask
	提案
	A1
	持ち込みの北は「大阪1枚デモ＋SuzuPayレール」でよいか
	Yes
	A2
	次の実装優先は /osaka ショーケースか
	Yes（Must #1）
	A3
	対外1枚は本 ACT 承認後に切るか
	Yes
	A4
	全国自治体サーチは裏方継続でよいか
	Yes（デモ主役にしない）
	________________


10. リスク
リスク
	緩和
	店名・KPI捏造
	ルール＋空 merchants＋レビュー
	肩書・組織名の誤り
	対外前に正式名称を FACT 化
	二つのポータルで説明が割れる
	/about を正本、ops は「工場」
	探索が遅くデモが空
	大阪を優先シード／手動で FACT な公開ソースのみ補充可
	________________


11. 付記 — 関連正本
* apps/portal-factory/docs/PORTAL-FACTORY-PITCH.md — 口頭60秒/3分
* apps/portal-factory /about — プロダクト上の説明正本
* OpenClaw data/strategies.json — 戦略5本
* 進捗は portal /status（Grok定常不要）
________________


End of ACT
