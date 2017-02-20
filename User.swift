//
//  User.swift
//  CoreApplicationPrototype
//
//  Created by Cher Moua on 2/4/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class User: NSObject {
    //email, address, birthday, last name, first name
    //login status
    //maybe security question and security answer

    private var email:String = "" //This is used to store the email of the current user.
    
    
    init(userEmail: String){
        self.email = userEmail
    }
    
    func loggedIn() -> Bool{
        return self.email != "noUser"
    }
    
    func logOut() -> (Bool, String){
        if(self.email == "noUser"){
            return (false, "No user to log out!")
        }
        else{
            self.email = "noUser"
            return (true, "")
        }
        
        
    }
    
    // This function takes the emailField string and password string
    // for logging a user in.  The return value is a tuple of a 
    // Boolean for testing success of login, and a string, to be 
    // utilized in event of an error.
    func loginUser(emailField: String?, passwordField: String?)  -> (Bool, String){
        //If either field is blank, return false and an error message
        //in string format to state as such.
        if(emailField == "" || passwordField == ""){
            //Error for empty field
            return (false, "A field was left empty")
        }
        //Get the dictionary for this email, lowercased, if it exists
        let userInfo = UserDefaults.standard.dictionary(forKey: emailField!.lowercased())
        
        // If there is no user with this email, or the password is incorrect
        // Return an error stating as such, but not specifying which for security.
        if(userInfo == nil || passwordField! != userInfo?["password"] as! String){
            //passwords do not match
            return (false, "Invalid email or password")
        }
        
        //Set the application user to be this user, who logged in successfully.
        self.email = emailField!.lowercased()
        
        //return a successful result.
        return (true, "")
        //Error checking needed when we start to get to the login page
        //from multiple paths
    }
    
    // This function is used to create an account for a user within the app
    // It takes the String optionals email, password, repeatPassword,
    // securityQuestion, securityAnswer, firstName, lastName, address, and
    // birthdate.  These values are utilized to create a dictionary entry
    // in the userDefaults, which stores the user information.  It returns
    // a tuple of (Boolean, String), where the boolean represents whether
    // the login was successful (true), or not(false).  If false, the
    // second item in the tuple is a string representing the error
    // which resulted in failure to create an account
    func createAccount(email: String?, password: String?, repeatPassword: String?, securityQuestion: String?, securityAnswer: String?, firstName: String?, lastName: String?, address: String?, birthdate: String?) -> (Bool, String){
        //Get the Userdefaults object for standard defaults
        let defaults = UserDefaults.standard
        if(email == "" || password == "" || repeatPassword == "" || securityAnswer == ""){
            //If there was an empty value in one of the arguments
            //return false, and the a message representing that.
            return (false, "A field was left empty")
        }
        
        if(password! != repeatPassword!){
            //If the passwords supplied do not match, return false and a string stating that.
            return (false, "Passwords do not match")
        }
        
        if(defaults.object(forKey: email!.lowercased()) != nil){
            //If there is already an object for this email (so a user with that email exists)
            //return false and a message stating the error (string)
            return (false, "Email already used")
        }else{
            
            //Load a dictionary with the email (lowercase), password, and 
            //other user info, if any optionals are non existant, make the stored value
            // the empty string.
            let userInformation: [String: String]=["email": email!.lowercased(), "password": password!, "securityQuestion": securityQuestion!, "securityAnswer": securityAnswer!, "firstName": firstName ?? "", "lastName": lastName ?? "", "address": address ?? "", "birthdate": birthdate ?? ""]
            
            //Set the defaults item matching key of email lowercased to be
            //the dictionary provided.
            defaults.setValue(userInformation, forKey: email!.lowercased())
        }
        
        //Successfully created account, so return true, and the empty string
        return (true, "")

    }
    
    //edit account information function, not implemented
    func editAccount(email: String?, password: String?, repeatPassword: String?, firstName: String?, lastName: String?, address: String?, birthday: String?, securityQuestion: String?, securityAnswer: String?) -> (Bool, String){
        var userInfo = UserDefaults.standard.dictionary(forKey: self.email.lowercased())

        if(userInfo == nil || securityAnswer! != userInfo!["securityAnswer"] as? String ?? ""){
            return (false, "Invalid edit")
        }
        
        
        
        if(password != ""){
            if(password != repeatPassword){
                return (false, "Passwords do not match")
            }
            userInfo!["password"] = password
        }
        if(firstName != ""){
            userInfo!["firstName"] = firstName
        }
        if(lastName != ""){
            userInfo!["lastName"] = lastName
        }
        if(address != ""){
            userInfo!["address"] = address
        }
        if(birthday != ""){
            userInfo!["birthdate"] = birthday
        }
        
        let defaults = UserDefaults.standard
        defaults.setValue(userInfo, forKey: self.email.lowercased())
        defaults.synchronize()
        return (true, "")
    }
    
    //recover password function not yet implemented
    func RecoverPassword(){
    }
    

}
