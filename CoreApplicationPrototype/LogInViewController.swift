//
//  LogInViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 11/30/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    /************ Local Varibles *******/
    
    var loginSuccess = false
    var viewPassword = false
    
    /************ View Outlets *********/
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    /************ View Actions **********/
    
    
    //pops the last two nav views off the stack and returns home
    //Probably bad practice.
    private func segueToHome() {
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true);
        
    }
    
    @IBAction func logInButtonPress(_ sender: UIButton) {
        
        //for prototype, just auto assume login success
        if(usernameField.text == nil || passwordField.text == nil){
            //Error for empty field
            return
        }
        let userInfo = UserDefaults.standard.dictionary(forKey: usernameField.text!)
        if(userInfo == nil){
            //error, no user with that email found
            return
        }
        if(passwordField.text! != userInfo?["password"] as! String){
            //passwords do not match
            return
        }
        loginSuccess = true
        var user: User = User(userEmail: usernameField.text!)
        //Error checking needed when we start to get to the login page
        //from multiple paths
        segueToHome()
        
        
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
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    //'Return' (Labeled as Done) closes the keyboard.
    //'_' uses no argument label
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //touching anywhere outside the keyboard UI will close the keyboard.
    //'_' uses no argument label
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
