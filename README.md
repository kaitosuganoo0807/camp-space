# このアプリについて

## :grey_question: CAMP-SPACEとは
キャンプ用品のレンタル、現地宅配サービスです。

## 概要
アプリ名：CAMP-SPACE

使用言語：Ruby on Rails、JavaScript

主な機能：payjpによる購入機能、商品を選ぶ際のカート機能、管理者のみの管理ページ、ユーザーログイン機能

作業人数：２人

作業日数：６日間

## このアプリを作ろうと思ったきっかけ
TECH::EXPERTの全カリキュラムが終了し、実際に今までの学習内容を生かして実際にサービスが成り立つアプリを作成したいと思い取り掛かりました。
その中でも私の知人が「もっとマイナーな場所でキャンプをしたい」と言っており、同じ様に「メジャーなキャンプ場以外でキャンプをしたい！」や「キャンプはしたいけど用品が高くて買えない」と思っている人は多いのではと思い、登山場所とキャンプ用品のレンタルサービスを思い立ちました。
コンセプトはいつものキャンプ場では味わえないレジャー体験と都内から電車で行ける手軽さです。

## アプリ紹介

・キャンプ用品のレンタル、現地宅配サービスアプリです<br>
・キャンプ用品をセットでレンタルできるため初心者でも気軽にレンタルできます

## 🌐URL
### http://52.193.251.163/

<img width="1191" alt="campspace" src="https://user-images.githubusercontent.com/57335336/71817355-f037c280-30c8-11ea-82ec-74db87b5cac5.png">

:one: 会員登録をし、好みのキャンプセットを選びカートに入れます

<img width="1275" alt="item_show" src="https://user-images.githubusercontent.com/57335336/71829951-05244e00-30e9-11ea-8e93-23f805bf8100.png">

:two: 配送先の登山場所を指定します

![image](https://user-images.githubusercontent.com/57335336/71890122-f7250a80-3186-11ea-9375-662ee54634e1.png)

:white_check_mark: カートに入れた商品を確認できます(削除も可)

<img width="1280" alt="cart" src="https://user-images.githubusercontent.com/57335336/71833989-77009580-30f1-11ea-836f-2e3bacb88417.png">

:three: クレジットカードを登録し購入画面に進みます

![image](https://user-images.githubusercontent.com/57335336/71834288-3a816980-30f2-11ea-949b-2f69c3456b02.png)

:four: 購入完了です！

![image](https://user-images.githubusercontent.com/57335336/71834412-83d1b900-30f2-11ea-87cf-f68de51ed8f2.png)

:policeman: 管理者アカウントを作成し、注文の情報、レンタル状況を確認できます<br>

- 管理者情報<br>
:email: katan-0507@i.softbank.jp<br>
:lock: kanta0507

<img width="1279" alt="payjptest" src="https://user-images.githubusercontent.com/57335336/71835201-4d953900-30f4-11ea-8be6-c4b9798ff05e.png">

<img width="1273" alt="payjptest" src="https://user-images.githubusercontent.com/57335336/71835354-a238b400-30f4-11ea-8dbd-e9195de2b733.png">

## :atom: 工夫した点

・sessionを使わずにカート機能を実装した事です。<br>カートに入れ数日後にも保管されているサービスが多かったので同じ様DBで扱う様にしました。<br>
以下の様に購入時にカート内のデーターを削除する様にしております。
```
if @master.save
    @carts.each do |cart| #購入時にカートテーブルの削除
    cart.destroy
 end
 ```
 ・areとitemの２種類の商品を扱っているため1度の購入作業でカートテーブルに２つのレコードが生成されます。<br>
 その二つのレコードを購入時にmasterテーブルに１レコードにまとめました。<br>
 以下が条件分岐のコードです。
 ```
 = form_for(@master, url: masters_path,method:'POST' ) do |f|
    - @carts.each do |cart| 
      - if cart.item_id 
        .user-box
          .user-box_title
 ```
 ```
 - if cart.area_id
        .area-box
          .area-box_title
            キャンプ場
 ```
 
 ## :memo: ER図

 <img width="1036" alt="Camp-Space" src="https://user-images.githubusercontent.com/57335336/71887830-3bfa7280-3182-11ea-9556-0923a6607b7c.png">
