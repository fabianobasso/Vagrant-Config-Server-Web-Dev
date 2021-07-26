# Web server with vagrant

System: **Ubuntu 20.04**;

Web Server: **configured with apache 2 and ph8**;

Installed: **composer**


### How to use

create a folder, to store the files on the sites, change the Vagrantfile and include the name of the folder created in this line.
```
config.vm.synced_folder "<Folder create>/", "/home/vagrant/<Folder create>".
```


configure the network interface according to your local network in Vagrantfile:
```
config.vm.network "public_network", bridge: "<interface>", ip: "<ip>", hostname: true.
```


change the file **configServer/scripts/apache/site.conf** and **configServer/scripts/apache/site-ssl.conf**

**site.conf:** change where to place **'Folder Create here'** the folder that was created to store the sites
```
<VirtualHost *:80>
        DocumentRoot /home/vagrant/'Folder Create here'
        ServerName locolhost
	    ServerAlias localhost
        ErrorLog /var/log/apache2/erro-app.log
        <Directory /home/vagrant/'Folder Create here' >
                Options -Indexes +FollowSymlinks
                AllowOverride All
                Require all granted
        </Directory>    
</VirtualHost>

```

**site-ssl:** change where to place **'Folder Create here'** the folder that was created to store the sites
```
<IfModule mod_ssl.c>
	<VirtualHost *:443>
        	DocumentRoot /home/vagrant/'Folder Create here'
        ServerName locolhost
	    ServerAlias localhost
        ErrorLog /var/log/apache2/erro-fabianoblog.log
        <Directory /home/vagrant/app>
                Options -Indexes +FollowSymlinks
                AllowOverride All
                Require all granted
        </Directory> 
		SSLEngine on
		SSLCertificateFile /etc/ssl/certs/apache.crt
		SSLCertificateKeyFile /etc/ssl/private/apache.key
		
		<FilesMatch "\.(cgi|shtml|phtml|php)$">
                                SSLOptions +StdEnvVars
                </FilesMatch>
                <Directory /usr/lib/cgi-bin>
                                SSLOptions +StdEnvVars
                </Directory>
	</VirtualHost>
</IfModule>
```

change the file **configServer/scripts/apache/apache.conf** change where to place **'Folder Create here'**

```
<Directory /home/vagrant/'Folder Create here'/>
	Options Indexes FollowSymLinks
	AllowOverride All
	Require all granted
</Directory>

```


### To to provision virtual machine
```bash
vagrant up
```


[![GitHub](https://img.shields.io/github/license/fabianobasso/Jogo_De_Xadrez)](https://github.com/fabianobasso/Vagrant-Config-Server-Web-Dev/blob/master/LICENSE) 

# Autor

Fabiano Basso

I also work as a **FULL STACK DEVELOPER** freelancer, if you have a project, this is the right time to get it off the ground, we can talk, and I'll present the best solution for you.

#### My contacts:
**online curriculum:** https://fabianobasso.github.io/
<br>
**Linkedin:** https://www.linkedin.com/in/fabiano-basso
<br>
**Whatsapp:** [Enviar Mensagem](https://api.whatsapp.com/send?phone=5519999979098)
