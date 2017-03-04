//
//  User.swift
//  CoreApplicationPrototype
//
//  Created by Cher Moua on 2/4/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class User: NSObject {
    
    
    private var email: String = "" //This is used to store the email of the current user.
    private var points: Int = 0 //This stores the current users points value (for display only)
    
    
    init(userEmail: String){
        self.email = userEmail
    }
    
    
    // Return true if there is a user logged in, false if there is not.
    // Could be modified to return the username of the user if logged in as well.
    func loggedIn() -> Bool{
        return self.email != "noUser"
    }
    
    
    //This function returns a boolean string tuple consisting of success status and possible error message.
    // Return true if log out is successful (if there is a user to logout), 
    // Return false if there is no currently logged in user, as well as a string message stating such
    // Also set the current user points to 0.
    func logOut() -> (Bool, String){
        if(self.email == "noUser"){
            return (false, "No user to log out!")
        }
        else{
            self.email = "noUser"
            self.points = 0
            let webCallController = WebCallController()
            return (true, "")
        }
    }
    
    
    // This function takes the emailField string and password string
    // for logging a user in.  The return value is a tuple of a 
    // Boolean for testing success of login, and a string, to be 
    // utilized in event of an error.
    func loginUser(emailField: String?, passwordField: String?)  -> (Bool, String){
        
        let result = self.securityTest(emailField: emailField, passwordField: passwordField)
        if(!result.0){
            return (result.0, result.1)
        }
        //Set the application user to be this user, who logged in successfully.
        // Load their points in as the current point value by grabbing from the stored dictionary.
        self.email = emailField!.lowercased()
        self.points = result.2
        
        //return a successful result.
        return (true, "")
        //Error checking needed when we start to get to the login page
        //from multiple paths
    }
    
    
    // This function checks the credentials for a logging in user against
    // Any user not yet logged in found in the database, and checks the credentials
    // Of only the logged in user if used when a user is logged in.  It returns
    // a tuple of a result, true or false, a string error message, and the user's points
    // If they are logged in, to set the value only if being logged in.
    func securityTest(emailField: String?, passwordField: String?) -> (Bool, String, Int){
        //If either field is blank, return false and an error message
        //in string format to state as such.
        if(emailField == "" || passwordField == ""){
            //Error for empty field
            return (false, "A field was left empty", 0)
        }
        // If we are trying to check credentials of a logged in user
        // Make sure the email of the user logged in matches that of the person supplied
        // So the password check is for the correct user.
        if(self.email != "noUser" && emailField?.lowercased() != self.email.lowercased()){
            return (false, "Invalid credentials", 0)
        }
        //Get the dictionary for this email, lowercased, if it exists
        let userInfo = UserDefaults.standard.dictionary(forKey: emailField!.lowercased())
        // Comment in the next line to add webserver dictionary creation
        let webServerDict: [String: String] = ["email": emailField!, "password": passwordField!]
        let webCallController = WebCallController()
        webCallController.userLogIn(userDict: webServerDict)

        // If there is no user with this email, or the password is incorrect		
        // Return an error stating as such, but not specifying which for security.
        /*if(userInfo == nil || passwordField! != userInfo?["password"] as! String){
            //passwords do not match
            return (false, "Invalid email or password", 0)
        }*/
        let pointsString = userInfo!["points"] as! String
        return (true, "", Int(pointsString)!)

    }
    
    // This function is used to create an account for a user within the app
    // It takes an email, password, repeatPassword, phone number, and address, all as string optionals
    // It forms from this the email, password and point combo to store locally (password removed upon web server call finished)
    // and stores these values in the userDefaults for the application.
    // It also creates a dictionary with the email, password, and then possible phone number and address, if filled not empty.
    func createAccount(email: String?, password: String?, repeatPassword: String?, phone: String?, address: String?) -> (Bool, String){
        //Get the Userdefaults object for standard defaults
        let defaults = UserDefaults.standard
        if(email == "" || password == "" || repeatPassword == ""){
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
        }
        
        // Populate the locally stored information, and a start to the server information for account creation.
        let storedInfo: [String: String] = ["email": email!.lowercased(), "password": password!, "points": "0"]
        var toServer: [String: String] = ["email": email!.lowercased(), "password": password!]

        // If the phone argument was not empty, add an entry for phone number
        if(phone != ""){
            toServer["phone"] = phone
        }
        
        // If the address argument was not empty, add an entry for the address.
        if(address != ""){
            toServer["address"] = address
        }
        
        let webCallController = WebCallController()
        webCallController.createNewUser(userDict: toServer)
        
        //Set the defaults item matching key of email lowercased to be
        //the dictionary provided.
        defaults.setValue(storedInfo, forKey: email!.lowercased())
        
        //Successfully created account, so return true, and the empty string
        return (true, "")

    }
    
    // This function retrieves the dictionary for the currently logged in user, then updates the stored password (if changed)
    // The password storage will be removed upon server, as such, the server code exists, to create the dictionary to send
    // However at this time it is not used.
    func editAccount(email: String?, password: String?, repeatPassword: String?, phone: String?, address: String?) -> (Bool, String){
        
        //Read in the dictionary for the current user from storage in UserDefaults.
        var localStored = UserDefaults.standard.dictionary(forKey: self.email.lowercased())
        var toServer = [String: String]()
        //If there is no user found, panic!, you are logged in without existing.
        if(localStored == nil){
            return (false, "Invalid edit")
        }
        
        // If the user did not leave the password field blank.
        if(password != nil){
            //If their password does not match the password repetition, return an error
            if(password != repeatPassword){
                return (false, "Passwords do not match")
            }
            // Populate a locally stored dictionary entry and to server dictionary entry with this new password.
            localStored!["password"] = password
            toServer["password"] = password
        }
        
        // If the phone entry is not empty, add its updated info to the dictionary.
        if(phone != ""){
            toServer["phone"] = phone
        }
        
        //If the address entry is not empty, add its updated info to the dictionary.
        if(address != ""){
            toServer["address"] = address
        }
        
        // Now store the information again for the user, as it has been updated.
        // Synchronize to force the data to be recognized as updated, then return success.
        let defaults = UserDefaults.standard
        defaults.setValue(localStored, forKey: self.email.lowercased())
        defaults.synchronize()
        return (true, "")
    }
    
    
    // Currently just grab a random integer between 0-100, return that string.
    func updatePoints() -> String {
        // To be updated when web server is implemented.
        let webCallController = WebCallController()
        webCallController.getUserPoints { (userPoints) in
            // If the rewardsList retrieved is not empty, run through each dictionary in the list
            // If its not a daily deal, its a reward, so grab its relevant info to create the product.
            if(userPoints != "" || userPoints != nil){
                self.points = Int(Float(userPoints!)!)
            }
            else{
                self.points = 0
            }
        }
        return String(self.points)
    }

}
