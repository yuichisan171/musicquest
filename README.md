# :musical_note: Music Quest
[![Screenshot from Gyazo](https://gyazo.com/5e4cd789892092c861ba5c2943988597/raw)](https://gyazo.com/5e4cd789892092c861ba5c2943988597)

## DEMO
[![Screenshot from Gyazo](https://gyazo.com/2869dfe205711fbd7e0ddea759074dcb/raw)](https://gyazo.com/2869dfe205711fbd7e0ddea759074dcb)

# :musical_note: このアプリは?
音楽情報共有サービス&音楽探求アプリです。
気分に合わせた曲、季節に合わせた曲、動画編集やプレゼンの演出に使いたい曲など、それぞれのシチュエーションに合わせた曲を探し、様々な要望に応えて曲をアウトプットするアプリです。

タイトルは「Music Quest」(ミュージック・クエスト)
タイトル名を聞いて、「ドラクエ?」かと思った方はいらっしゃるかと思いますが、その名の通り「音楽を探求する」の意味です。

## こんな人にオススメ
- 音楽を聴くのが趣味の方
- 様々なシチュエーションに合わせた曲を探している方
- 曲をアウトプットして自分の音楽センスと選曲センスを磨きたい方

## 使い方

### 曲を探す側
- 曲を探すにはトップページのヘッダー「曲を探す」へクリック。
- すると入力フォームが表示されます。ここで自分が探している曲の特徴を入力します。例えば「夏が来た！ってなる曲教えて！」「90年代,女性歌手,J-POP,夏系の曲を探してます」と、自分で工夫して探すのもアリです。

### 曲を教える側
- 曲を教えるには、ツイート詳細画面の「曲を教える」へクリック
- その要望に対してBGM付きの動画を提供してください。対応動画サイトはyoutubeです。
- そのレビューには、自分がこの曲と出会ってから今までの思い出を語るなど、ちょっと軽い感じでレビューしてもOKです!

## インストール
```
$ cd ~/hoge
$ git clone https://github.com/yuichisan171/musicquest.git
$ cd musicquest
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

# :musical_note: 制作背景
## 製作理由
私がこのアプリを作成した理由は、環境とリンクした音楽鑑賞アプリを作りたいからです。
そのきっかけは、曲を聴くと様々な感情や出来事を思い出すのが面白いと感じたことです。例えば夏がくればこの曲、天気が晴れている時はこの曲、落ち込んだ時はこの曲など周囲の環境に合わせて曲を聴くのが趣味になり始めたからです。良い曲に出会えたらもっといろんな人に知ってもらいたいと思い、曲を探している人に自分のお気に入りの曲をアウトプットする。曲を探す人、曲を教える人とで音楽を通したコミュニケーションを実現したいという想いを込めて、このアプリを作りました。

## 個人アプリ開発を通して得たこと
自分が思いついたアイデアを自分でアプリを作ることはとても良い経験で、「アプリを作りたい」という夢を実現することができたのはこの上なく嬉しいです。
装飾やメッセージを工夫し、ユーザーが自然と操作しやすいように実装したことからユーザーの視点を常に持っていく必要があることを新たな知見を得ました。今後もユーザービリティを意識し、向上にむけて努力したいと思っております。

## 工夫したこと
- 操作性
ボタンの配置や色、ユーザーが見やすさとリンクへの導きやすさを考慮し、常にユーザー視点で考えながら実装しました。

## 今後の課題
- いいね機能の追加。
- Youtubeとniconicoのいずれかを投稿した際に、一方を非表示にする機能が必要になる。

## 苦労したこと
### 動画の投稿
youtubeのurlをフォームに貼り付けて投稿した際に、ツイート詳細画面にどうやって表示するかを苦戦しました。
再生するには埋め込み用のyoutubeのurlと、urlの下11桁を指定のurlに挿入すると動画が再生される仕組みとなっていますが、
はじめはコントローラーで設定を試みるもうまくいかず、ビューのファイルで下11桁を取得できるように直接コードを打ち込んだところ見事再生することができました。

## 今後の学習
今後はcanvasを用いた2Dゲームを開発するため、HTML/CSS,JavaScript,jQueryを勉強しています。

# :musical_note: 使用した技術
- 言語: Haml,Scss,Ruby
- フレームワーク: Ruby on Rails
- DB: MySQL
- リポジトリ管理: GitHub

## DB
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
#### Association
- has_many :tweets
- has_many :outputs

### tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :user
- has_many :outputs

### outputsテーブル
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|youtube_url|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :tweet

### ERD
![MusicQuest_ERD](https://user-images.githubusercontent.com/58941860/79848640-50ded700-83fc-11ea-9a6e-ce93b3021dd8.jpeg)

使用ソフトウェア:Lucidchart

# ライセンス
©2020 MusicQuest