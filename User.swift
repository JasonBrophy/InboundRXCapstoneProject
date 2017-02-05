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
    
    //edit account information function
    func EditAccount(email: String?, password: String?, firstName: String?, lastName: String?, address: String?, birthday: String?){
    }
    
    //recover password function
    func RecoverPassword(){
    }
    

}
