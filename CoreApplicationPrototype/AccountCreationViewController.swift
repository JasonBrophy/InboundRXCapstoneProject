//
//  AccountCreationViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class AccountCreationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    // Perform an unwind segue back to home.
    private func segueToHome() {
        performSegue(withIdentifier: "unwindCreateAccToHome", sender: self)
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        //Check users input to make sure everything that the required field are\
        //correctly inputed. If user is successful doing so then they are returned to the home page
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let createUser = appDelegate.user
        
        //Send the text fields to the user create account function to create a user
        let result = createUser.createAccount(email: email.text, password: password.text, repeatPassword: repeatPassword.text, phone: phone.text, address: address.text)

        //show the type of error that the user is missing in their creat account application, if the 
        // createAccount function returned an error.
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
            return
        }
        
        //else return to home, as a sign of success
        
        //from multiple paths
        segueToHome()
        
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
