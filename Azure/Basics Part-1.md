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
    - Azure Active Directory
         - It use, if you want to add users or create groups for a particular organization or for a particular business,or school or college.
    - Azure Active Directory(B2C)
          - It's business to consumer , if you want to create an application that you want to expose to the public at large, then you would use the Azure active B2C.
## 1.2 Create a Tenant Account
- Azure create free account [Link](https://azure.microsoft.com/en-in/pricing/purchase-options/azure-account?msockid=2c32100c31c467461a6800da30bb6655)
- Try with free account and sign in with your gmail account
- Create password and then enter the verify email code send to mail id
- Fill the appropriate details and click `Next`
- Identidy by card
- Use **VISA or mastero** card for creating account
-  fill the details and click `sign up`
## 1.3 Default Directory and Create users
- Once you have create your account, default directory gets automatically created, so the domain that is provided for your default directory is based on the email that you give while creating.
#### Example
   ```
     email : name.surname@abc.com
     Domain: namesurnameabc.onmicrosoft.com
   ```
- Goto Our Console page and you can see dashboard in that search "Active Directory"

