//
//  ConfirmCredentialsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Brophy on 3/1/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class ConfirmCredentialsViewController: UIViewController, UITextFieldDelegate {
    
    /************ Class Varibles ********/
    
    var viewPassword = false
    
    /************ View Outlets *********/
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    /************ View Actions **********/
    
    
    //Unwind segue back to the home screen
    private func segueToHome() {
        performSegue(withIdentifier: "unwindLogintoHome", sender: self)
    }
    
    @IBAction func confirmButtonPress(_ sender: UIButton) {
        
        
        // Fetch the currently logged in user.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        
        //check users input through the user object
        // Using security test with a logged in user means
        // It will check specifically whether the credentials matched the current user, not any user
        let result = user.securityTest(emailField: emailField.text, passwordField: passwordField.text)
        
        //Show the error, if there was an error returned
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
            return
        }
        
        // At this point, we have a valid edit account request, so send the user to the edit account page.
        performSegue(withIdentifier: "validEdit", sender: self)
        
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
    
    
    /************ Default Controller Functions *********/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
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
    
    
}
