# :musical_note: Music Quest
![](https://i.gyazo.com/9586dd65523f6a6294bc1ce2cb045f4e.jpg)
[![Screenshot from Gyazo](https://gyazo.com/1004ab98396366e553ec14c2ef46c49b/raw)](https://gyazo.com/1004ab98396366e553ec14c2ef46c49b)

# :musical_note: このアプリは?
音楽情報共有サービス&音楽探求アプリです。
気分に合わせた曲、季節に合わせた曲、動画編集やプレゼンの演出に使いたい曲、それぞれシチュエーションに合わせた曲を探し、様々な要望に応えて曲をアウトプットするアプリです。

タイトルは「Music Quest」(ミュージック・クエスト)
その名の通り、音楽を探求するの意味です。
タイトル名を聞いて、「ドラクエ?」かと思った方はいらっしゃるかと思いますが。

シチュエーションに合わせた曲などを探し、音楽好きの人がそれらしい曲をアウトプットして曲を共有するサービスです。

何人もいれば何通りの曲の好みがあるはず...

## こんな人にオススメ
- 音楽を聴くのが趣味の方
- シチュエーションを合わせた曲を探している方
- 曲をアウトプットして自分の音楽センスを磨きたい方

## 使い方
- 曲を探すにはトップページの「曲を探す」から投稿。
- 「夏が来た！ってなる曲教えて！」でもいいし、「90年代,女性歌手,J-POP,夏系の曲を探してます」と細かい要望など、自分で工夫して探すのもアリです。

- 曲を教えるには、ツイート詳細画面の「曲を教える」から、その要望に対してBGM付きの動画を提供してください。対応動画サイトはyoutube,niconicoです。
- そのレビューには、自分がこの曲と出会ってから今までの思い出を語るなど、ちょっと軽い感じでレビューしてもOKです!

# :musical_note: アプリの成分
- 言語: Haml,Scss,Ruby
- フレームワーク: Ruby on Rails
- DB: MySQL
- リポジトリ管理: GitHub

## DB
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null:false, unique :true|
|password|string|null: false|
### Association
- has_many :tweets
- has_many :outputs

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string||
|text|string||
|user_id|integer||
- belongs_to :user
- has_many :outputs

## outputsテーブル
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|youtube_url|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
- belongs_to :user
- belongs_to :tweet

### ERD
![](https://www.lucidchart.com/publicSegments/view/86374a22-487f-4d64-909c-212e1a6fc88a/image.jpeg)
使用ソフトウェア:Lucidchart

# 制作背景
## 製作理由
私がこのアプリを作成した理由は、音楽をより楽しくしたいからです。


## 工夫したこと
- 操作性
ボタンの配置や色、ユーザーが見やすさとリンクへの導きやすさを考慮し、常にユーザー視点で考えながら実装しました。

- 

### 今後実装したい機能
- いいね・返信機能

## 苦労したこと
### 動画の投稿
曲を投稿をする際にBGM付きのyoutubeのurlを貼り付けて投稿する際に、ツイート詳細画面にどうやって表示するか苦戦をしました。
再生するには埋め込み用のyoutubeのurlと、urlの下11桁を指定のurlに挿入すると動画が再生される仕組みとなっている。
コントローラーで設定しようと試みるもうまくいかないため、ビューのファイルで下11桁を取得できるようにコードを打ち込んだところ見事再生することができた。

## 今後学習したいこと
今後はcanvasを用いた2Dゲームを開発するため、HTML/CSSはもちろん、JavaScript,jQuery,canvasを勉強しています。