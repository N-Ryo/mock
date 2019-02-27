# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Mock",
             email: "ryo.joy.joy@gmail.com",
             password:              "higashikou2437",
             password_confirmation: "higashikou2437",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

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

roles = ["MachineLearning","テスト","Deeplearning","IoT","SSH","api","Blockchain","セキュリティ","自然言語処理","正規表現","ネットワーク",
        "SSL","画像処理","環境構築","スクレイピング","開発効率化","高速化"

        ]
roles.each {|role| Role.create!(name: role) }