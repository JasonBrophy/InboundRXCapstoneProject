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

    private var email:String = ""
    
    
    init(userEmail: String){
        self.email = userEmail
    }
    
    func loginUser(emailField: String?, passwordField: String?)  -> (Bool, String){
        //for prototype, just auto assume login success
        if(emailField == "" || passwordField == ""){
            //Error for empty field
            return (false, "A field was left empty")
        }
        let userInfo = UserDefaults.standard.dictionary(forKey: emailField!.lowercased())
        if(userInfo == nil || passwordField! != userInfo?["password"] as! String){
            //passwords do not match
            return (false, "Invalid email or password")
        }
        
        self.email = emailField!.lowercased()
        return (true, "")
        //Error checking needed when we start to get to the login page
        //from multiple paths
    }
    
    func createAccount(email: String?, password: String?, repeatPassword: String?, securityQuestion: String?, securityAnswer: String?, firstName: String?, lastName: String?, address: String?, birthdate: String?) -> (Bool, String){
        let defaults = UserDefaults.standard
        if(email == "" || password == "" || repeatPassword == "" || securityAnswer == ""){
            //create items required to create popup error
            return (false, "A field was left empty")
        }
        if(password! != repeatPassword!){
            //create popup error for passwords not matching, or, just show error in ui
            return (false, "Passwords do not match")
        }
        if(defaults.object(forKey: email!.lowercased()) != nil){
            //create pop up error
            //return tuple of (number, string error)
            return (false, "Email already used")
        }else{
            
            let userInformation: [String: String]=["email": email!.lowercased(), "password": password!, "securityQuestion": securityQuestion!, "securityAnswer": securityAnswer!, "firstName": firstName ?? "", "lastName": lastName ?? "", "address": address ?? "", "birthdate": birthdate ?? ""]
            
            defaults.setValue(userInformation, forKey: email!.lowercased())
        }
        return (true, "")

    }
    
    //edit account information function
    func EditAccount(email: String?, password: String?, firstName: String?, lastName: String?, address: String?, birthday: String?){
    }
    
    //recover password function
    func RecoverPassword(){
    }
    

}
