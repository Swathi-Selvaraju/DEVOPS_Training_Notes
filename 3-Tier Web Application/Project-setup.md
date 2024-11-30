
# 3-Tier Web Application
This is a 3-tier application for managing employee data, built with React for the frontend, Spring Boot for the backend, and MySQL for data storage.

## Project Setup


[Download zip file](https://github.com/Ranjitha75388/Tomcat/blob/main/3-tier-application-task/ems-ops-phase-0.zip) 

```
unzip ems-ops-phase-0.zip
```


## Installation
 #### Tools
    * Java 17 
    * Maven 3.8.8
    * NodeJs 14.x
    * MySQL 8.x


##### Install  Java 17

```bash
  sudo apt update
  sudo apt install openjdk-17-jdk openjdk-17-jre
  java -version
```
![image](https://github.com/user-attachments/assets/2553b52f-b3a8-464f-a382-2ea45b05d749)
![image](https://github.com/user-attachments/assets/63fdba16-d344-48fe-b957-f32c88a769ee)

Install  Maven

```bash 
  sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
  tar -xvf apache-maven-3.8.8-bin.tar.gz
```
![image](https://github.com/user-attachments/assets/b7b7c463-a33e-47b0-9677-7c2eba742e3b)

 * Maven M2_HOME Setup
      * Open the profile file `vim ~/.profile`  of the user and the following and save the file
      ```
          M2_HOME='/opt/apache-maven-3.8.8'
          PATH="$M2_HOME/bin:$PATH"
          export PATH
      ```
      * Verify the version of maven, it should be 3.8.8
      ```
          mvn -version    
      ```
![image](https://github.com/user-attachments/assets/0ad51649-ad16-44ec-89d4-280eb4559db0)

  * NodeJs
    ```
        sudo apt update
        curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
        sudo apt -y install nodejs && npm
        node  -v && npm -v
    ```
      ![Screenshot 2024-11-26 180459](https://github.com/user-attachments/assets/8f396518-3c6f-418f-9933-f456e847b5af)
  ![Screenshot (850)](https://github.com/user-attachments/assets/5c992663-cff9-4e97-852d-4ce1c2f50128)

  * MySQL
    * Install MySQL Server
    ```
        sudo apt update
        sudo apt install mysql-server
    ```
    * Update `root` user password
    ```
        sudo mysql
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
        exit
    ```
    * Configure User 
    ```
        sudo mysql -u root -p
        CREATE USER 'username'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
        GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' WITH GRANT OPTION;
        FLUSH PRIVILEGES;
        exit
    ```
    * Create Database
    ```
        sudo mysql -u username -p
        CREATE DATABASE databasename;
    ```
    ![Screenshot (852)](https://github.com/user-attachments/assets/36061645-5d99-497d-92cf-4456f5579be4)
