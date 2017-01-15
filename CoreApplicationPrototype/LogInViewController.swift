//
//  LogInViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 11/30/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    /************ Local Varibles *******/
    
    var loginSuccess = false
    var viewPassword = false
    
    /************ View Outlets *********/
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    /************ View Actions **********/
    
    
    @IBAction func submitLogInInfo(_ sender: UIButton) {
        
        //for prototype, just auto assume login success
        loginSuccess = true
        
    }
    
    @IBAction func updatePasswordVisibility(_ sender: UIButton) {
        if viewPassword {
            passwordField.isSecureTextEntry = true;
            viewPassword = false
        }
        else{
            passwordField.isSecureTextEntry = false;
            viewPassword = true
        }
    }
    
    
    /************ Default Controller Functions *********/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
