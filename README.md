### README


# 概要  
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発

# 案件の背景  
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

# 通販について  
- 通販では注文に応じて製作する受注生産型としている。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
- 送料は1配送につき全国一律800円。
- 本来は軽減税率により宅配物は税率8%ですが、今回は10%で統一します。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
- 支払方法はクレジットカード、銀行振込から選択できる。

# 実装した機能
## [会員側実装機能]  
- 顧客は会員登録、ログイン・ログアウト、退会ができる
- 会員のログインはメールアドレスとパスワードで行う
- 会員がログインしている状態かどうか判断できるように、ページのヘッダーにユーザ名が表示される
- サイトの閲覧はログインなしで行える
- 商品をカートに入れ、1度に複数種類、複数商品の購入ができること。また、カート内の商品は個数変更・削除ができる
- カートへの商品追加はログインなしでは行えない
- 会員はマイページから下記が行える
  - ユーザ情報の閲覧・編集
  - 注文履歴の閲覧
  - 配送先の閲覧・編集
- 注文履歴一覧には下記の情報が表示される
  - 注文日
  - 配送先
  - 支払金額（商品合計＋送料）
- 注文履歴詳細には下記の情報が表示される
  - 注文日
  - 配送先
  - 支払方法
  - 商品の注文内容詳細（商品名、単価、個数、小計）
  - 請求情報（商品合計、送料、支払金額）
- 会員登録時、下記の情報をユーザ情報として入力できる
  - 名前（姓・名）
  - 名前（カナ姓・カナ名）
  - 郵便番号
  - 住所
  - 電話番号
  - メールアドレス
  - パスワード

## [管理者側(店側)実装機能]
- 管理者用メールアドレスとパスワードでログインできる（管理者用メールアドレスとパスワードは事前にSeed等でデータベースへ登録できていれば良い）  
- 商品について、下記が行える  
  - 新規追加、編集、閲覧  
  - 販売停止（売切表示）  
-商品情報は下記のものを持つ  
  - 商品名  
  - 商品説明文  
  - 税抜価格  
  - 商品画像  
- 会員登録されているユーザ情報の閲覧、編集、退会処理が行える  
- ユーザの注文履歴が一覧・詳細表示でき、下記の情報が表示される  
  ### 【注文履歴一覧】  
  - 購入日時  
  - 購入者  
  - 注文個数  
  ### 【注文履歴詳細】  
  - 購入者  
  - 注文日  
  - 配送先  
  - 支払方法  
  - 料金（商品合計、送料、請求金額合計）  


