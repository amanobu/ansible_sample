# Apache<->Tomcat環境構築 Ansibleサンプル
Apache+Tomcatの環境をよく使うのでAnsibleのお試しで作ってみた

##環境
以下の環境が出来上がります
* Apache
* OpenJDK 1.7
* Tomcat 8

##準備
cloneしてansible配下で

ansible-playbook -i hosts play.yml

をするとlocal環境に出来ます

##設定される状況
* /opt/配下にtomcatの実体が展開
* /usr/share/tomcatがtomcatの実体にSLINK
* /usr/share/appsをCATALINA_BASEとする
* /usr/share/apps/webapps/配下にtomcat付属のmanager,examples等にslinkされます
* /usr/share/apps/conf配下にtomcatの起動に必要なファイルが実体からコピーされます。sever.xml,tomcat-users.xmlだけはこのansibleのテンプレートからコピーされます
* yumでApacheが入ります
* yumでOpenJDKが入ります
* mod_proxy_ajp.confのサンプルが設定されます
* tomcat,apacheを立ち上げます

##動作確認
* curl http://localhost/examples/
  で動作確認出来るかと。tomcat付属のexample Webappのレスポンスが帰ってくればＯＫかと

##その他
* Vagrantも使える様にする為の定義も入れています。環境があれば「vagrant up」だけで上記環境が出来るはず
* もし、JDKやtomcatのバージョンを上げるなら「 ansible_sample/ansible/roles/tomcat/tasks/main.yml」のファイルを変更してください
* CentOSとか様に/etc/init.d/に置く起動スクリプトも入ってます変更したい場合は「ansible_sample/ansible/roles/tomcat/files/tomcat-initscript.sh」を修正して
* apacheの自動起動設定は入って無いです

