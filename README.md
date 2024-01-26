# update ip address of wsl automaticly     
WSL ip was dynamic changed on it start. this script can check ip addr and update to hosts file if changed, then you can visit wsl service with domain `wsl`


# usage       
1. place the script update_wsl_ip.sh into your linux system under wsl
   you can clone it with git
   
   ```shell    
   git clone https://github.com/yorelog/update_wsl_ip.git       
   ```
   
2. create a crontab task to run the script
   suppose your script is under the home direcory of root
   ```shell    
   ls /root/update_wsl_ip/update_wsl_ip.sh
   ```
   you can create a crontab task with `crontab -e`,then append an line
   ```
   * * * * * /root/update_wsl_ip/update_wsl_ip.sh
   ```
   it will check the ip for every minute, you can change the frequency if it checks too often.
3. visit the address with http(s)://wsl        
