# Phase : 1 Frontend Setup
Before build application Pre-requisites Installation Step follows[Phase 0](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Project-setup.md)
 ### Steps - Unzip the file

- Unzip file was given by team. 'ems-ops-phase-0.zip'
- Use the cd command to change to the Downloads directory (or wherever your ZIP file is located)
    ```
        cd ~/Downloads
    ```
- Use the unzip command followed by the name of your ZIP file to extract it.
     ```
        sudo apt install unzip
        unzip filename.zip -d /path/to/destination/
    ```
-  After extract the zip file
    ```
        cd/ems-ops-phase-0/
    ```
-  After extracting, you might want to move into the project directory a subdirectory created during extraction.
    ```
        cd /home/swathi/Downloads/ems-ops-phase-0/react-hooks-frontend
    ``` 
    

### Run the Application
1. Move to the Frontend Directory
Navigate to the frontend directory where the React code is located:

```bash
   cd /ems-ops-phase-0/react-hooks-frontend
```
2. Install Dependencies
Install all the required packages for the frontend application by the following command:
```bash
   npm install
   ```
3. The dependencies will be stored in the `node_modules` folder within the project directory.

## Run the Application
* Start the React application by running:
```bash
   npm start
   ```
* By default, the frontend will be accessible at port `3000`

###  Accessing the Application in the Browser
##### URL to Access the Application
Once the application is running, open your browser and navigate to the following URL:

``` bash

http://localhost:3000/employees
```
### ScreenShot
homepage-list of employee
![Screenshot 2024-11-26 210011](https://github.com/user-attachments/assets/df29a3d0-aa54-4071-ab07-5793833fe005)
add employee
![image](https://github.com/user-attachments/assets/b4fd9924-f0b2-43d2-bb71-d9cb2d02b3bb)





### Common Error and Fixes
#### Error: npm start Error
If you encounter the following error while running `npm start`:

![Screenshot 2024-11-26 195635](https://github.com/user-attachments/assets/86e7aa76-d7fe-49ef-8c70-198cf79aa6b0)

### Solution:1 
Run the following commands 
```bash 
export NODE_OPTIONS=--openssl-legacy-provider
npm start
```
### Solution:2 
Navigate to package.json file

~/ems-ops-phase-0/react-hooks-frontend$
```bash
 sudo nano package.json
 ```
 Update `scripts` in the  `start`line
 ```bash
  "scripts": {
    "start": "react-scripts --openssl-legacy-provider start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
```
```bash
   npm start
   ```

#### Why Include --openssl-legacy-provider?

If you're using Node.js version 17 or newer, you may encounter issues related to cryptographic libraries in your React project. For example, libraries relying on older cryptography might cause the development server to fail with errors like "ERR_OSSL_EVP_UNSUPPORTED".

By adding this flag:

* It ensures that your app runs smoothly by bypassing the OpenSSL 3.0 restrictions.
* You don't have to downgrade Node.js or modify your environment drastically

#### How to Check Your Node.js Version?
Run the following command in your terminal:
``` bash
node -v
``` 
If the version is 17 or higher, the --openssl-legacy-provider flag might still be necessary. 

Next Step : [Phase 2](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Backend-setup.md)
