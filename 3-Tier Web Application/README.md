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
* Prerequisites Installation for Project
* Build and Setup 3-tier Application
* Dockerization and Deployment
* Run the Application
* Documentation

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

### Prerequisites Installation
* Java 17
* Maven 3.8.8
* NodeJs 14.x
* MySQL 8.x

### Setup Project
* Create a separate directory for Frontend and backend
* Install and setup the package
* Build and deploy project on local machine


### Dockerization:
* Create Dockerfiles for each service.
* Use Docker Compose to orchestrate services.
* Run the Application
