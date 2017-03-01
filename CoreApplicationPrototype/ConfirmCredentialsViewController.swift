//
//  ConfirmCredentialsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Brophy on 3/1/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class ConfirmCredentialsViewController: UIViewController, UITextFieldDelegate {
    
    var loginSuccess = false
    var viewPassword = false
    
    
    /************ View Outlets *********/
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    /************ View Actions **********/
    
    
    //pops the last two nav views off the stack and returns home
    //Probably bad practice.
    private func segueToHome() {
        performSegue(withIdentifier: "unwindLogintoHome", sender: self)
    }
    
    @IBAction func confirmButtonPress(_ sender: UIButton) {
        
        
        //This allows to check whether what the user inputed, to login, was a match
        //to a preexisting user, if not then show an error to the user to let them know
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        
        //check users input through the user object
        let result = user.securityTest(emailField: emailField.text, passwordField: passwordField.text)
        
        //loginSuccess = loginUser return item 0.
        self.loginSuccess = result.0
        
        //Show the error, if no match found
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
            return
        }
        
        //Error checking needed when we start to get to the login page
        //from multiple paths
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
