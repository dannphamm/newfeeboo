//
//  LoginViewController.swift
//  FeeBoo
//
//  Created by Dung Pham on 5/23/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func LoginTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (User, error) in
            print("we tried to sign in")
            if error != nil {
                print("hey we have an error:\(String(describing: error))")
                
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            print("we tried to create a user")
            
            if error != nil {
                print("hey we have an error:\(String(describing: error))")
                print("signed in successfully")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                
            } else {
                print("created user successfully")
            }
        })
            } else {
                print("signed in successfully")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }


}

