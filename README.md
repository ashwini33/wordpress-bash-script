# wordpress-bash-script
## Wordpress automated installation script for Cent OS /  RedHat
One can put the content of the wordpress.sh file under the "User Data" section while launching the Redhat Linux on  AWS. <br>
This script can also be downloaded and be executed alone to install wordpress.

# Database crendentails after installation is :-
Database - wordpress <br>
Username - admin <br>
Password- admin123 <br>

For get things done fast just do :- <br>
```bash
sudo yum install wget -y
wget https://raw.githubusercontent.com/ashwini33/wordpress-bash-script/master/wordpress.sh
sudo bash wordpress.sh
```
Note: If you have any files allready in the working directory then the downloaded file will will saved with name "wordpress.sh.1" ,in this case run 
```bash
sudo bash wordpress.sh.1
```
  
