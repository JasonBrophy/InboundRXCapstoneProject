//
//  CreateAccountController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Brophy on 2/19/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.email.delegate = self
        self.password.delegate = self
        self.repeatPassword.delegate = self
        self.phone.delegate = self
        self.address.delegate = self
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
    
    
    // Unwind back to home using the unwind segue
    private func segueToHome() {
      performSegue(withIdentifier: "unwindEditToHome", sender: self)
    }
    
    
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
        
        //from multiple paths
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
