//
//  LogInViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 11/30/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import UIKit
import UserNotifications

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    /************ Class Varibles ********/
    
    var viewPassword = false
    
    /************ View Outlets **********/
    
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    /************ View Actions **********/
    
    @IBAction func logInButtonPress(_ sender: UIButton) {
        //This allows to check whether what the user inputed, to login, was a match
        //to a preexisting user, if not then show an error to the user to let them know
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        
        //check users input through the user object
        let result = user.loginUser(emailField: emailField.text, passwordField: passwordField.text)

        
        //Show the error if the login function returned one, as an alert popup.
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
            return
        }
        
        // Login was successful, return to the home view.
        segueToHome()
    }
    
    
    // Connected to the cancel button, it segues the user back to home on click using an unwind.
    @IBAction func dismiss(_ sender: UIButton) {
        segueToHome()
    }
    
    
    // Update the visibility of the password field based upon the check box
    // This is done by setting it to secure/not secure, depending on button status.
    @IBAction func updatePasswordVisibility(_ sender: UISwitch) {
        if viewPassword {
            passwordField.isSecureTextEntry = true;
            viewPassword = false
        }
        else{
            passwordField.isSecureTextEntry = false;
            viewPassword = true
        }
    }
    
    /************ Additional Controller Functions ******/
    
    //Perform an unwind segue back to the home view.
    private func segueToHome() {
        performSegue(withIdentifier: "unwindLogintoHome", sender: self)
    }
    
    /************ Default Controller Functions *********/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the text fields to use this controller as their delegate.
        // This allows for use of the implemented functions
        emailField.delegate = self
        passwordField.delegate = self
        
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
}
