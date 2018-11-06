First, I should to prepare you that I wanted to realize MVC structure of project, but I could not, because I have a few experience in this technology. This approach would let me using classes and their methods to handle pages instead of creating .cfm script for each page. (I realized it using PHP).  I developed a simple authorization without using authentication keys and tokens. In addition, I created a simple validation without regular expressions and used bootstrap for table’s styles instead my own, because I wanted to finish the project faster.

Directory css - contains css files for the pages

	-auth.css - styles of authentication page;

	-site.css - styles of all remained;

Directory js - contains js files for the pages

	-site.js - handling frontend of header part of page and mistakes page; 

	-userList.js - handling frontend of userList page;

	-validate.js - realize validation of form's fields;

addMistake.cfm - view file of adding mistake page;

addUser.cfm - view file of adding user page;

Application.cfm - main script, which runs before all;

auth.cfm - view file of authentication page;

db.sql - SQL script of creating database;

doAddMistake.cfm - realizing of adding mistake to database;

doAddUser.cfm - realizing of adding user to database;

doAuth.cfm - realizing authorization;

logout.cfm - realizing log out;

saveHistory.cfm - realizing of updating mistake's history;

site.cfm - view file of displaying mistake and their histories;

updateUser.cfm - realizing of updating user record in database;

userList.cfm - view file of displaying users;