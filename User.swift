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

    
    //account creation function
    func AccountCreation(email: String, password: String, securityQuestion: String, securityAnswer: String, firstName: String, lastName: String, address: String, birthday: String){
      
        let defaults = UserDefaults.standard
        
        if(defaults.object(forKey: email) != nil){
            //create pop up error
            //return tuple of (number, string error)
        }else{
            
            let userInformation: [String: String]=["email": email, "password": password, "securityQuestion": securityQuestion, "securityAnswer": securityAnswer, "firstName": firstName, "lastName": lastName, "address":address, "birthday": birthday]

            defaults.setValue(userInformation, forKey: email)
        }
        
    }
    
    
    
    
    
    //edit account information function
    func EditAccount(email: String?, password: String?, firstName: String?, lastName: String?, address: String?, birthday: String?){
    }
    
    //recover password function
    func RecoverPassword(){
    }
    

}
