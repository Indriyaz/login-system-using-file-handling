# login-system-using-file-handling
please input the file path in the variable file_path 
```
Features:
input email validation
input password validation
password reset
password retrieve
new user registration
no duplication of email id/username are allowed
user validation
```
```
 The system has two main features: registration and login validation. The script starts by importing the regular expression module (re) and defining two regular expressions (p1 and p2) that are used to validate the email and password entered by the user. Then it prints a welcome message and asks the user if they want to register or log in.
```
```
If the user chooses to register, the code calls the registration() function, which prompts the user to enter their email and then uses the regular expression (p1) to validate the email format. If the format is correct, the passwordenter() function is called, which prompts the user to enter their password and uses the regular expression (p2) to validate the password format. If the format is correct, the code opens a file named "testy.txt" in the "append" mode and writes the email and password to it. If the format is not correct, the function prompts the user to enter a valid password format. If the email format is not correct, the function prompts the user to enter a valid email format.
```
```
If the user chooses to log in, the code calls the login_validation() function, which prompts the user to enter their email and password and then opens the "testy.txt" file in the "read" mode. The code then reads the file line by line and checks if the email and password entered by the user match any of the lines in the file. If there is a match, the code prints "login Successful", otherwise, it calls the check() function which prompts the user to either register or reset their password. If the user chooses to reset their password, the code prompts the user to enter a new password and then writes it to the file, replacing the old password.
```
