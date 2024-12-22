# Azure Basics 
## Concepts
- Azure Active Directory
- Management Group
- Subscription
- Resource Group
- Resource
# 1. Azure Active Directory (Azure AD)
- Microsoft's  **Cloud-Based Identity and Access Management Service**
- It helps users to sign in and access resources.
- **External Resource**
        - Microsoft 365, Azure portal, and thousands of other SaaS applications.
- **Internal Resource**
        - You can use Azure directly to create apps that can be used within your corporate network and intranet, along with any cloud apps developed by your own organization.
# 1.1 Tenant
- A tenant is an `Instance` of an **Active Directory**
- Two kinds of tenant
    - **Azure Active Directory**
         - It use, if you want to add users or create groups for a particular organization or for a particular business,or school or college.
    - **Azure Active Directory(B2C)**
          - It's business to consumer , if you want to create an application that you want to expose to the public at large, then you would use the Azure active B2C.
## 1.2 Create a Tenant Account
- Azure create free account [Link](https://azure.microsoft.com/en-in/pricing/purchase-options/azure-account?msockid=2c32100c31c467461a6800da30bb6655)
- Try with free account and sign in with your gmail account
- Create password and then enter the verify email code send to mail id
- Fill the appropriate details and click `Next`
- Identidy by card
- Use **VISA or mastero** card for creating account
-  fill the details and click `sign up`
-  sign up [link](https://azure.microsoft.com/en-in/get-started/azure-portal)
## 1.3 Default Directory and Create users
- Once you have create your account, default directory gets automatically created, so the domain that is provided for your default directory is based on the email that you give while creating.
#### Example
   ```
     email : name.surname@abc.com
     Domain: namesurnameabc.onmicrosoft.com
   ```
- Goto Our Console page and you can see dashboard in that search "Active Directory"
- Search Azure active directory in **three ways**,
- For Microsoft Entra ID, it will display as Azure Active Directory (B2C)
     - Use search bar, Azure active directory
     - By clicking the “All services” in the right-side menu
     - In right side menu, Azure Active Directory
  ![Screenshot (949)](https://github.com/user-attachments/assets/b6349417-1386-4c07-9f43-2b038cfb46f2)
## 1.4 Create new Users
- Search `users` in search box,click user or 
- In Default Directory page , the right side menu bar shows 'manage'.
- In that we can see 'users'.By clicking that we can create new user.
- Fill the details,Domain name will be taken from default directory created above and auto set password had given for that new user
- copy the password in notepad and click create.
- User name wil be added in 'All users'.

![Screenshot (952)](https://github.com/user-attachments/assets/3053ea84-b3bc-4622-9a98-9dbccfd3d7df)
## 1.4.1 Login in new created user
- I have created a user name swathi with the domain name swathi@swathidharshini01gmail.onmicrosoft.com
- Now, I logged into my domain
- Copy the doamin name and password
- Click sign with different account
- Use another account
- Paste domain name as "mail id" and password
- Change the new password from auto set password
- Log in to new account
![image](https://github.com/user-attachments/assets/83012534-6df4-4dce-b08d-35e82bfc10ad)

## 1.4.2 Create a Guest user
- Click Invite external user in New user
![image](https://github.com/user-attachments/assets/5fa010bf-4469-4541-af60-a48dd3afbc46)
![image](https://github.com/user-attachments/assets/86bb5293-1354-4837-84fb-30865eae21e4)
- Invitation send to the mail id
  ![image](https://github.com/user-attachments/assets/04e88c04-6109-49ba-9a19-f3db6e233128)
- Click on accept invitation
- Sign into new account
## 1.5 Create Tenant
- Search Azure active directory
- Click Manage tenant
![image](https://github.com/user-attachments/assets/8d9660f5-dade-47e8-9861-89c3745cec62)

