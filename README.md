# ECサイト
商品販売サイトです。
管理者は商品登録、ユーザーは商品購入(仮想)ができます
レスポンシブ対応しているのでスマホからもご確認いただけます。

<img width="1440" alt="スクリーンショット 2021-04-23 11 29 44" src="https://user-images.githubusercontent.com/63798354/115809643-76475c00-a427-11eb-8d3c-9a1027bc6537.png">

<img width="1440" alt="スクリーンショット 2021-04-23 11 30 49" src="https://user-images.githubusercontent.com/63798354/115809894-ece45980-a427-11eb-9657-938f6850d4e0.png">

# URL
https://lit-oasis-34166.herokuapp.com/ 

アカウント登録しなくてもショッピングをお楽しみ頂けます。
お気に入りや購入履歴は、アカウント登録の拡張機能です。

# 使用技術　

- ruby 2.6.3
- ails 6.0.3
- mysql  Ver 14.14
- puma
- AWS

# 機能一覧
- ユーザー登録、ログイン機能(has_secure_password)
  - アカウントの有効化(メイラー)
  - パスワード再設定(メイラー)
- 商品作成
  - 商品画像の登録(Active Storage)
  - スライドショー
- ショッピングカート機能
  - アカウントとの紐付け
  - アカウントがなくてもセッションで作成
- お気に入り機能(ログインユーザーのみ)
- 商品購入(仮想)
- 閲覧履歴
- 購入履歴
- 問い合わせ
- ページネーション(kaminari)
- 検索機能

# 今後の課題
- 決済機能の追加
- 商品詳細ページで画像表示の動作が不安定(スマホのみ)
 - 現在はスマホのみJavasplictでページリロードさせている
