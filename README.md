# Apache<->Tomcat環境構築 Ansibleサンプル
Apache+Tomcatの環境をよく使うのでAnsibleのお試しで作ってみた

##環境
OpenJDK 1.7
Tomcat 8

##準備
cloneしてansible配下で
ansible-playbook -i hosts play.yml
をするとlocal環境に出来ます

##設定される状況
* /opt/配下にtomcatの実体が展開
* /usr/share/tomcatがtomcatの実体にSLINK
* /usr/share/appsをCATALINA_BASEとする
* /usr/share/apps/webapps/配下にtomcat付属のmanager,examples等にslinkされます
* /usr/share/apps/conf配下にtomcatの起動に必要なファイルが実体からコピーされます。sever.xml,tomcat-users.xmlだけはansibleのテンプレートからコピーされます
* yumでApacheが入ります
* mod_proxy_ajp.confのサンプルが設定されます
* tomcat,apacheを立ち上げます

##動作確認
* curl http://localhost/examples/
  で動作確認出来るかと

##その他
Vagrantも使える様にする為の定義も入れています。
環境があれば
vagrant up
だけで上記環境が出来るはず
