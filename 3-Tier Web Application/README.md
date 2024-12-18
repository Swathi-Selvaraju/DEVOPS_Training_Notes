# 3-Tier Web Application - Employee Management System

This guide outlines how to set up and deploy a 3-tier web application consisting of a ReactJS frontend, Java Spring Boot backend, and MySQL database. Follow these steps to configure, build, and run the application on an Ubuntu-based system.Below are the steps, architecture diagrams, and workflows for the system's development.


## Application Architecture Overview
The application is structured into three tiers:

* Frontend: ReactJS
* Backend: Java Spring Boot
* Database: MySQL RDBMS

### Implementation Plan
####  Plan Overview
* Design Architecture ,Flow Diagram
* Prerequisites Installation for Project -[Phase 0](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Project-setup.md)
* Build , Setup and Manual deploy the 3-tier Application - [Phase 1](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Frontend-setup.md),[phase 2](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Backend-setup.md)
* Daemonizing the Service - [Phase 3](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Daemonize.md)
* Dockerization and Deployment -[Phase 4](https://github.com/Swathi-Selvaraju/DEVOPS_Training_Notes/blob/main/3-Tier%20Web%20Application/Dockerized.md)
* Run the Application
  

### System Architecture
#### Architecture Diagram
                         +-----------------------+
                         |     User Interface    |
                         |    Browser or App     |
                         +----------+------------+
                                    |
                                    |
                     +--------------v--------------+
                     |           Frontend          |
                     | ReactJS Application         |
                     |                             |
                     | - Displays UI Components    |
                     | - Handles User Interaction  |
                     | - Makes API Calls           |
                     +--------------+--------------+
                                    |
                                    |
                     +--------------v--------------+
                     |           Backend           |
                     | Spring Boot RESTful APIs    |
                     |                             |
                     | - Handles HTTP Requests     |
                     | - Implements Business Logic |
                     | - Validates User Input      |
                     | - Manages Security          |
                     +--------------+--------------+
                                    |
                                    |
         +--------------------------v--------------------------+
         |                       Database                      |
         |                     MySQL DB                        |
         |                                                    |
         | - Stores Employee Data                             |
         | - Handles Queries for CRUD Operations              |
         | - Ensures Data Consistency and Integrity           |
         +----------------------------------------------------+

### This diagram illustrates the architecture of a three-tier application:

1. **User Interface:** The browser or app serves as the entry point, where users interact with the system through a graphical interface.

2. **Frontend (React):** The ReactJS application manages the user interface, handling interactions, rendering UI components, and making API calls to the backend.

3. **Backend (Spring Boot):** The Spring Boot service processes API requests, implements business logic, validates user input, and ensures security.

4. **Database (MySQL):** The MySQL database stores employee data, processes CRUD operations, and maintains data integrity and consistency.

Each layer communicates sequentially, creating a robust, modular system.

### Flow Diagram

        +---------------------------------------+
        |           Presentation Tier           |
        |       (React Frontend Application)    |
        +---------------------------------------+
                        |
        User Actions:   |                      Responses:
    - View Employees    |  HTTP Requests        - Employee Data
    - Add/Edit/Delete   |   (API Calls)        - Operation Status
                        v
        +---------------------------------------+
        |              Logic Tier               |
        |      (Spring Boot Backend APIs)       |
        | - Handles Business Logic              |
        | - Validates User Input                |
        | - Processes CRUD Operations           |
        +---------------------------------------+
                        |
        CRUD Operations:|                      Responses:
    - Read/Write Data    |  Database Queries    - Data Retrieval
    - Add/Delete Data    |                      - Update Confirmation
                        v
        +---------------------------------------+
        |               Data Tier               |
        |           (MySQL Database)            |
        | - Stores Employee Records             |
        | - Contains Tables: Employees Details  |
        | - Ensures Data Integrity              |
        +---------------------------------------+
### Workflow of the Diagram:
1. **Presentation Tier (React Frontend Application):**

- **User Actions:** Users interact with the frontend by performing actions like viewing, adding, editing, or deleting employee data through the React application's user interface.
- **Requests:** The frontend sends HTTP requests (API calls) to the backend, typically using RESTful APIs.
  
2. **Logic Tier (Spring Boot Backend APIs):**

- **Processing:** The backend receives these API calls and processes them.
   - Implements the business logic for handling the requested operation.
   - Validates user input to ensure data accuracy and security.
   - Executes CRUD (Create, Read, Update, Delete) operations based on the request.
- **Responses:** Once processing is complete, the backend sends appropriate responses back to the frontend, such as employee data or the status of an operation.
  
3. **Data Tier (MySQL Database):**
- **Operations:** The backend communicates with the MySQL database by running SQL queries to fetch, insert, update, or delete records in the employee-related tables.
- **Storage:** The database stores employee records and ensures data consistency, integrity, and proper indexing for efficient query execution.
  
4. **End-to-End Communication:**
- The user initiates an action on the frontend → The frontend sends the request to the backend → The backend processes the request and interacts with the database → The database executes the query and returns the results to the backend → The backend sends a response to the frontend → The frontend updates the UI with the new data or status.
This architecture ensures clear separation of concerns, making the system modular, maintainable, and scalable.


### Prerequisites Installation
* Java 17
* Maven 3.8.8
* NodeJs 14.x
* MySQL 8.x

### Setup Project
* Create a separate directory for Frontend and backend
* Install and setup the package
* Build and deploy project on local machine
  
### Daemonizing the Services
- Create SystemD Service for react frontend
- Daemon Reload & systemctl the Service
- Create SystemD Service for java backend
- Daemon Reload & systemctl the Service

### Dockerization:
* Create Dockerfiles for each service.
### Creating a Docker Compose File
Create a dockercompose file using above Dockerfile of each service and run the application automatically.

