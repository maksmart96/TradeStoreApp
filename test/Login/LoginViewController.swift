//
//  LoginViewController.swift
//  test
//
//  Created by  Максим Мартынов on 15.03.2023.
//

import UIKit

public protocol LoginViewControllerDelegate: class {
    func loginViewControllerDidPressLogin()
}

public class LoginViewController: UIViewController {
    // MARK: - Instance Properties
    public weak var delegate: LoginViewControllerDelegate?
    public var accountManager = AccountManager()
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func LoginPressed(_ sender: Any) {
    
        guard let passwordText = passwordTextField.text,
              let firstNameText = firstNameTextField.text,
                !passwordText.isEmpty,
                !firstNameText.isEmpty
        else {
            let alert = UIAlertController(title: "some field is empty", message: "It looks like you didnt fill all the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }

        guard accountManager.checkUser(firstName: firstNameText, password: passwordText) == true else {
            let alert = UIAlertController(title: "Account Not Found", message: "It looks like you dont have an account", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        
        delegate?.loginViewControllerDidPressLogin()
    }
    @IBAction func toogleSecureInput(_ sender: Any) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
}

extension LoginViewController: StoryboardInstantiable  {
  public class func instantiate(delegate: LoginViewControllerDelegate) -> LoginViewController {
    let viewController = instanceFromStoryboard()
    viewController.delegate = delegate
    return viewController
  }
}
