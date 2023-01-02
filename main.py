import re

file_path=("C:/Users/R2/Documents/test/testy.txt") # change filepath here

p1 = r"^[a-z]{1,}[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
p2 = r"(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])"

print("welcome to login System")  # welcome message
a = input("Do you want to register or login ?press r/l:")


def registration():
    email = input("Please enter your username / email :")
    if re.match(p1, email):
        f = open(file_path, "r")
        t_email = ()
        for i in f:
            i_email, i_password = i.split(",")
            if i_email == email:
                t_email = ("email already registered")
                break
        if t_email == ("email already registered"):
            print("email already exists")
            login_validation()
        else:
            def passwordenter():
                password = input("please enter your password:")
                if len(password) >= 5 and len(password) <= 16 and re.match(p2, password):
                    f = open(file_path, "a")
                    f.write(f"{email},{password}\n")
                    print("Registration Sucessfull")
                    f.close()

                else:
                    print( "please enter a password that has minimum :\n one special character\n one digit\n one uppercase\n one lowercase character\n password length should be between 5 and 16\n ")
                    passwordenter()

            passwordenter()
    else:
        print("plesea enter valid email format")
        registration()

def login_validation():
     email = input("Please enter your username / email :")
     password = input("please enter your password:")
     f = open(file_path,"r")
     a=()
     for i in f:
            if i == (f"{email},{password}\n"):
              a=("login Succeessful")
              break

     if a == ("login Succeessful"):
         print("login Succeessful")

     else:

           def check():
                print("Create a new account or reset password of old account ")
                c = input("Type r for registration or p for password reset:")
                if c.lower() == "r":
                        registration()
                elif c.lower() == "p":
                         email = input("Please enter your username / email :")
                         f = open(file_path, "r")
                         t_email=()
                         for i in f:
                                i_email, i_password = i.split(",")
                                if i_email == email:
                                   t_email=("email exist")
                                   break
                         if t_email==("email exist"):
                             def pcheck():
                                 d = input("Do you want to reset password or retrive the old ?(y/n):")
                                 if d.lower() == "n":
                                     print(f"your password is:{i_password}")

                                 elif d.lower() == "y":
                                     def repassword():
                                         password = input("enter new password:")
                                         if len(password) >= 5 and len(password) <= 16 and re.match(p2, password):
                                             f = open(file_path, "a")
                                             f.write(f"{email},{password}\n")
                                             f = open(file_path, "r")
                                             e = f.readlines()
                                             e.remove(f"{i_email},{i_password}")
                                             f = open(file_path, "w")
                                             f.writelines(e)
                                             f.close()
                                             print(f"Password Successfully Changed to:{password}")

                                         else:
                                             print("please enter a password that has minimum :\n one special character\n one digit\n one uppercase\n one lowercase character\n password length should be between 5 and 16\n ")
                                             repassword()

                                     repassword()
                                 else:
                                     pcheck()

                             pcheck()
                         else:
                             print("email does not exist ")
                             a = input("Do you want to register or exist ?press r:")
                             if a.lower() == "r":
                                  registration()
                             else:
                                 print("Thank you Visit Again")
                else:
                    check()
           check()

def again():
    a=input("Do you want to register or login ?press r/l:")
    if a.lower() == "l":
        login_validation()
    elif a.lower() == "r":
        registration()
    else:
        again()

if a.lower() == "l":
    login_validation()

elif a.lower() == "r" :
        registration()

else:
    again()