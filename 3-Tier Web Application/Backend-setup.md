Previous  Step - [phase 1](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Frontend-setup.md)
# Phase 2 : Backend Setup

####  Move to `backend directory`
```bash
 cd /ems-ops-phase-0/springboot-backend
```
### Update `application.properties` 
1. Open the application.properties file located at:
```bash
sudo nano /src/main/resources/application.properties
```
2. Update the following properties with your database credentials
Here you have to update the database name, username and password that we have created above project setup
```bash
spring.datasource.url=jdbc:mysql://localhost:3306/ems?useSSL=false
spring.datasource.username=username
spring.datasource.password=password
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQLDialect
spring.jpa.hibernate.ddl-auto = update
```
#### Maven Pacakage Initialization

##### Navigate to `springboot-backend` folder

```bash 
    cd ~/ems-ops-phase-0/springboot-backend
```
* The pom.xml file in this directory defines all the required packages and dependencies for the project.
* Run the following command to clean the project and prepare it for dependency installation:

``` bash
    mvn clean
```

### Build the Backend Application
1. Run the following command to build the backend application:
```bash
mvn install
```
- `mvn install` is the command to build and package the application . This will generate a `target` folder under `springboot-backend`  and `*.jar` file will be generated
![image](https://github.com/user-attachments/assets/5f342229-1acd-47d5-b8f6-75f8c7ad8b03)

2. After the build completes successfully:
* A `target/` folder will be created in the `springboot-backend `directory.

* Inside the `target/` folder, a .jar file will be generated.
![image](https://github.com/user-attachments/assets/e583e036-9372-4c69-8b67-69e31319e39d)


3. The `.jar` file is the packaged backend application, which can be executed using the `java -jar` command.

``` bash
java -jar springboot-backend-0.0.1-SNAPSHOT.jar
```
![image](https://github.com/user-attachments/assets/791c341d-1bf4-4c07-9d46-943319615b23)

Next Step - [Phase 3](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Daemonize.md)

