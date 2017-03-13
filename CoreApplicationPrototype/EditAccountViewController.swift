//
//  CreateAccountController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Brophy on 2/19/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController {
    
    /************ View Outlets **********/
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    
    /************ View Actions **********/
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        // First grab the user for the application
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let editUser = appDelegate.user
        
        //send the data in the fields to the user for the app to edit the current user
        let result = editUser.editAccount(email: email.text ?? "", password: password.text ?? "", repeatPassword: repeatPassword.text ?? "", phone: phone.text ?? "", address: address.text ?? "")
        
        //show the type of error that the user is missing in their creat account application
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
            return
        }
        
        //else return to home, as a sign of success
        segueToHome()
    }

    /************ Additional Controller Functions ******/
    
    // Unwind back to home using the unwind segue
    private func segueToHome() {
        performSegue(withIdentifier: "unwindEditToHome", sender: self)
    }
    
    /************ Default Controller Functions *********/
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // set the UITextfield delegates to this class so they use the overridden functions to dismiss the keyboard
        self.email.delegate = self
        self.password.delegate = self
        self.repeatPassword.delegate = self
        self.phone.delegate = self
        self.address.delegate = self
    }
}


extension EditAccountViewController: UITextFieldDelegate {
    
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
