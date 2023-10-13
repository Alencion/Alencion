## proxy sql 계정 생성 
echo "create user"
USER_NAME=$1

echo $USER_NAME
mysql -h127.0.0.1 --port 3306 -uroot -p123456 -e "create user '$USER_NAME'@'%' identified with mysql_native_password" --ssl-mode=disabled
mysql -h127.0.0.1 --port 33060 -uroot -p123456 -e "alter user '$USER_NAME'@'%' identified by '$USER_NAME'" --ssl-mode=disabled
mysql -h127.0.0.1 --port 33060 -uroot -p123456 -e "grant ALL PRIVILEGES on *.* to '$USER_NAME'@'%'" --ssl-mode=disabled
mysql -h127.0.0.1 --port 33060 -uroot -p123456 -e "flush privileges" --ssl-mode=disabled