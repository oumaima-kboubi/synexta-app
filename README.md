# SYNEXTA-app 💡
<div id="here"></div>

## About this project 🤔
This Symfony project is part of a technical test. 
The goal is to develop a web application with two main parts. In the first part, users can create an account, providing their name, email (unique), and a 12-character password. Upon registration, a unique account validation link is sent to the user's email. Users can log in, log out, and edit their name and surname after logging in.

In the second part, there is a shared database table containing a minimum of 10 products and 3 product categories ( i generated the data using fixtures and faker bundle). When logged in, users can add individual products to their personal list, add entire product categories to the list, remove products from their list, save their product choices and filter the products based on their categories. These choices persist across sessions. Products can be associated with multiple users, and each user has their personalized product list. 🥳

It uses the **monorepo** strategy ✅:    

1- ⚡ **/templates**: The frontend templates that will be exposed to the users.   
2- ⚡ **/src**: The backend part where all the functionnalities' logic goes.   
3- ⚡ **/README FILE imgs**: This folder contains the DB SQL dump file and the images for this fantastic README file. 🥳  
3- ⚡ **/docker-compose.yml**: The fake mailer server config on docker.

### Built With 🛠️
* [php 8](https://www.php.net/releases/8.0/en.php), PHP 8 is a major version of the PHP programming language. It was released in November 2020 and introduced several new features and improvements over its predecessor, PHP 7.
* [Symfony 5.4](https://symfony.com), a high-performance PHP web application framework that enables rapid development of robust and maintainable web applications.
* [My SQL](https://www.mysql.com/fr/), an open-source relational database management system used for storing and managing structured data.


### Testing and developing Tool 👀
* [Postman](https://www.postman.com/), an API development and testing tool that simplifies the process of sending HTTP requests, managing APIs, and analyzing responses.
* [XAMPP](https://www.apachefriends.org/fr/index.html), a free and open-source software package that provides a local server environment for web development, including tools like Apache, MySQL, PHP, and more.

<p align="right">(<a href="#here"> Go to the 🔝</a>)</p>


## Getting Started 🎉

In order to run this project and extend its functionalities you need to follow a few steps : 

### Prerequisites 🧷

* Make sure that Docker is installed on your operation system.
* Make sure that Symfony CLI is installed on your operating system.
* Make sure that XAMPP is installed and running on your operating system.

### Installation 🔧

1. Clone the repo
   ```sh
   git clone https://github.com/oumaima-kboubi/synexta-app.git
   ```
##### If you want to build on top of the project   

2. Install composer packages
   ```sh
   composer install
   ```
3.  Add an **.env** file for required projects
     ```sh
     #DB connection string
     DATABASE_URL="MySQL connection string" 
     ...
     ```
 4. Run the symfony server in the background:
     ```sh
     symfony console server:start -d
     ```
 5. Run the docker container:
    ```sh
     docker-composer up
    ```
 6. Open the web mail interface from the fake email server running in docker:
     ```sh
      symfony open:local:webmail
     ```
 7. Ensure that all ports are well set and enjoy!   
 
 
<p align="right">(<a href="#here"> Go to the 🔝</a>)</p>

## The app live demo  ♾️
* [THE LIVE DEMO for you to live the real experience🎵](https://www.youtube.com/watch?v=_X36k_RJxuY)
//////* The result file  **/The new bands.xlsx** and the DB SQL dump file  **/gammatest.sql** are under the folder  **README file img**.
## The App frontend Overview💻
### Part 1
* *Sign in page*

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/sign-in.png)

* *Register page*

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/register.png)

Once the account is created, a verification email is sent to the user in order to be able to access his personal space for extra security mesures.

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/register%20verify.png)

This is the received email:

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/register%20email.png)

After clicking on the email link, the user will be redirected to his personal space.

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/email%20verified.png)

The user is always able to change his password in case he forgets it by clicking on the **Forgot password?** button.

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/resetpwd.png)

After filling the form with the right email, the user will receive an email to change his password account.

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/reset-msg.png)

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/resetpwd%20email.png)

After clicking on the email link the user will be able to change his password immediatly and access his personal account.

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/resetpwdform.png)

* *Edit user info page*

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/edit%20profile.png)

<p align="right">(<a href="#here"> Go to the 🔝</a>)</p>

### Part 2

* *Home page*

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/homepage%20name%20change.png)

* *Products list page*

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/product%20list.png)

* *Personal list page*

If the user's personal list is empty:

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/empty%20personal%20list.png)

If the user's personal list is full:

![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/full%20personal%20list.png)

* *The user can do a list of actions:*
  -  Add a product to his personal list:
    
  ![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/product%20added.png)

  -  Add a category to his personal list:
    
  ![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/cat%20add.png)

  - Remove a product from his personal list:
    
  ![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/remove%20product.png)

  - Filter the products based on the categories:
    
  ![image](https://github.com/oumaima-kboubi/synexta-app/blob/main/README%20FILE%20imgs/category%20filter.png)

  - Logout.

<p align="right">(<a href="#here"> Go to the 🔝</a>)</p>

## Contact 📞

📧 Oumaima Kboubi - Kaboubioumaima@outlook.fr
