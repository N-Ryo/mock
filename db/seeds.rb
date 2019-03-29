# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(name:  "Mock",
             email: "mock@movehack.com",
             password:              "mock2018",
             password_confirmation: "mock2018",
             admin: false,
             activated: true,
             proficiency: 5,
             activated_at: Time.zone.now).save

User.new(name:  "ryo",
             email: "nishimura@movehack.com",
             password:              "mock2019",
             password_confirmation: "mock2019",
             admin: false,
             activated: true,
             proficiency: 2,
             activated_at: Time.zone.now).save
             
categories = ["C","C++","C#","Ruby","RubyOnRails","Python","java","Python","Go","R","Elixir","GAS",
              "Django","Objective-C","golang","scala","TypeScript","Haskell","Arduino","Perl","AngularJS","Keras","Redux",
              "cocos2d-x","Anaconda",
              "HTML","HTML","CSS","PHP","laravel","wordpress","Android Studio","Firebase","Markdown","Jupyter","CakePHP",
              "Rust","Pandas","gem","CoffeeScript","gulp.js","spring","Bluemix","NumPy","matplotlib",".NET","bootstrap",
              "iOS","android","Kotlin","Swift","Unity","iPhone","SmartPhone","Chrome","PowerShell","Gradle","C++ Builder",
              "Javascript","JQuery","Heroku","AWS","EC2","docker","apache","kubernetes","MongoDB","Fluentd",
              "TensorFlow","Lambda","Azure","OpenCV","Z Shell","GCP","Chef","Puppet","IntelliJ",
              "RSpec","minitest","VBA","Nuxt.js",
              "Selenium","Electoron","Redis","LateX",
              "Vue.js","Node.js","Git","GitHub","Gitlab","MySQL","Bash","React","Nginx","ShellScript","PostgreSQL","Ansible",
              "SQL","Express","CircleCI","Jenkins","Node-RED","rbenv",
              "WebGL",
              "Linux","Windows","Mac","CentOS","Debian","Ubuntu","RaspberryPi","Raspbian","Emacs","Vagrant","VMware","UNIX",
              "Redmine","Salesforce",
              "Vim","Sublime Text","EmEditor","Atom","VSCode","サクラエディタ","Notepad++","Xcode",
              "TeraPad","秀丸エディタ","NoEditor","Mery","K2Editor","Eclipse","CotEditor","mi","Brackets","Liveweave","mou",
              "Slack","Excel","homebrew","JSON",
              "VisualBox",
              "Ethereum",
              "Linuxコマンド","Terminal","ComandPronpt",
              "オブジェクト指向","プログラミング基礎"
              ]
              #Qiita3ページ目途中
categories.each {|category| Category.create!(name: category) }

roles = ["フォーム","MachineLearning","テスト","Deeplearning","IoT","SSH","api","Blockchain","セキュリティ","自然言語処理","正規表現","ネットワーク",
        "SSL","画像処理","環境構築","スクレイピング","開発効率化","高速化","リファクタリング","デバッグ","デプロイ","バリデーション","オンラインストレージ","検索",
        "記法"
        ]
roles.each {|role| Role.create!(name: role) }
Hack.create!(category_id: 5, role_id: 1, tag_list: "form_with", overview: "URL、スコープ、モデルの組み合わせを元にformタグを作成します。")
99.times do |i|
  cid = 1 + (i % 15)
  rid = 1 + (i % 10)
  overview = "ダミーデータ"
  tag = "ダミー,タグ"
  Hack.create!(category_id: cid, role_id: rid, overview: overview, tag_list: tag)
end

Comment.create!(feeling: 0, content: "Rails 5.2以降から推奨になったform_withは、モデルにインスタンス変数を指定するだけで、空ならcreate,値をモデルから呼び出しているならupdateメソッドを呼び出してくれる",
                user_id: 1, hack_id: 1)
Comment.create!(feeling: 5, content: "Rails 5.2以降から推奨になったform_withは、デフォルトで「remote: true」になっているため、リクエストを送る際にレンダリングを必要とする場合は「local: true」を付加捨必要がある",
                user_id: 1, hack_id: 1)
300.times do
  f = rand(6)
  c ="ダミーコメンタリー"
  uid = rand(1..2)
  hid = rand(1..100)
  Comment.create!(feeling: f, content: c, user_id: uid, hack_id: hid, point: 0)
end


s1 = Time.current - 1.month
s2 = Time.current
300.times do |i|
  s = Random.rand(s1 .. s2)
  e = rand(1..5)
  uid = 1
  cid = i + 1
  Reaction.create!(evaluation: e, user_id: uid, comment_id: cid, created_at: s, updated_at: s)
  point = User.first.proficiency * e
  c = Comment.find(cid)
  c.point += point
  c.save
  h = c.hack
  h.point += point
  h.save
end

300.times do |i|
  s = Random.rand(s1 .. s2)
  e = rand(1..5)
  uid = 2
  cid = i + 1
  Reaction.create!(evaluation: e, user_id: uid, comment_id: cid, created_at: s, updated_at: s)
  point = User.second.proficiency * e
  c = Comment.find(cid)
  c.point += point
  c.save
  h = c.hack
  h.point += point
  h.save
end

Discussion.create!(content: "テスト", user_id: 1, comment_id: 1)
Discussion.create!(content: "テストテスト", user_id: 1, comment_id: 2)
Discussion.create!(content: "テストテスト", user_id: 2, comment_id: 1, discussion_id: 1)
Discussion.create!(content: "テストテストテスト", user_id: 1, comment_id: 2)
Discussion.create!(content: "テストテストテストテストテスト", user_id: 1, comment_id: 1, discussion_id: 1)
Discussion.create!(content: "テストテストテストテスト", user_id: 2, comment_id: 1, discussion_id: 1)
