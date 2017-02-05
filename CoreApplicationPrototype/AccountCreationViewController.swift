//
//  AccountCreationViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class AccountCreationViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var securityQuestion: UILabel!
    @IBOutlet weak var securityAnswer: UITextField!
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
    
    //pops the last three nav views off the stack and returns home
    //Probably bad practice.
    private func segueToHome() {
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 4], animated: true);
        
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        //Error checking needed when we start to get to the Account Creatin page
        
        //account creation function
            
            let defaults = UserDefaults.standard
        if(email.text == nil || password.text == nil || repeatPassword.text == nil || securityAnswer.text == nil){
            //create items required to create popup error
            return
        }
        if(password.text != repeatPassword.text){
            //create popup error for passwords not matching, or, just show error in ui
            return
        }
        if(defaults.object(forKey: email.text!) != nil){
            //create pop up error
            //return tuple of (number, string error)
            return
        }else{
                
            let userInformation: [String: String]=["email": email.text!, "password": password.text!, "securityQuestion": securityQuestion.text!, "securityAnswer": securityAnswer.text!, "firstName": firstName.text ?? "", "lastName": lastName.text ?? "", "address":address.text ?? "", "birthdate": birthdate.text ?? ""]
                
            defaults.setValue(userInformation, forKey: email.text!)
        }//from multiple paths
        segueToHome()
        
        //The Account Info that the user enter will need to be put into a model at this point
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
