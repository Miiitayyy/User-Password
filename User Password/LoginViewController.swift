//
//  ViewController.swift
//  User Password
//
//  Created by mitay on 20/10/2019.
//  Copyright © 2019 mitay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let userName = "User"
    private let password = "Password"
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "logIn" else { return }
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTextField.text
    }

    // MARK: IBActions
    
    @IBAction func logInPressed() {
        guard
            userNameTextField.text == userName,
            passwordTextField.text == password
            else {
                showAlert(title: "Invalid login or password",
                          message: "Please, enter correct login and password",
                          textField: passwordTextField)
                return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
        
    }
 
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Oops!",
                  message: "Your name is \(userName) 😉")}
    
    @IBAction func rorgotPasswodPressed(_ sender: Any) {
        showAlert(title: "Oops!",
                  message: "Your password is \(password) 😉")}
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    }
    
    
    // MARK: - Alert Controller
    extension LoginViewController {
        private func showAlert(title: String, message: String, textField: UITextField? = nil) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                textField?.text = nil
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    // MARK: Text Field Delegate
    extension LoginViewController: UITextFieldDelegate {
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super .touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == userNameTextField {
                textField.resignFirstResponder()
                passwordTextField.becomeFirstResponder()
            } else {
                logInPressed()
            }
            return true
        }
    
}


