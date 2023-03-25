//
//  ViewController.swift
//  test
//
//  Created by  Максим Мартынов on 13.03.2023.
//
import UIKit
// MARK: - SignInViewControllerDelegate
public protocol SignInViewControllerDelegate: AnyObject {
    func signInViewControllerDidPressSignIn(_ viewController: SignInViewController)
    func signInViewControllerDidPressLogin(_ viewController: SignInViewController)
}

public class SignInViewController: UIViewController {
    // MARK: - Instance Properties
    public weak var delegate: SignInViewControllerDelegate?
    public var accountManager = AccountManager()
    
    @IBOutlet var signInTitle: UILabel!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var eMailTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var alreadyHaveAnAccountLabel: UILabel!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signInWithAppleButton: UIButton!
    @IBOutlet var signInWithGoogleButton: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.delegate =
        
    }
    
//MARK: - Segue handling
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Login" {
//            guard let loginVC = segue.destination as? LoginViewController else { return }
//            loginVC.navigationController?.navigationItem.backBarButtonItem?.tintColor = .systemIndigo
//        }
//    }
    
    @IBAction internal func loginPressed(_ sender: Any) {
        delegate?.signInViewControllerDidPressLogin(self)
    }
    
    @IBAction internal func SignInPressed(_ sender: Any) {
        guard let emailText = eMailTextField.text,
              let firstNameText = firstNameTextField.text,
              let lastNameText = lastNameTextField.text,
              !firstNameText.isEmpty,
              !lastNameText.isEmpty else {
            let alert = UIAlertController(title: "some field is empty", message: "It looks like you didnt fill all the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        guard emailText.isEmail() else {
            let alert = UIAlertController(title: "email is not valid", message: "It looks like your email is not valid ", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        guard accountManager.checkUser(firstName: firstNameText, password: "") != true else {
            let alert = UIAlertController(title: "Existing account", message: "It looks like you have an account ", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        
        //перейти на page1 контроллер
        delegate?.signInViewControllerDidPressSignIn(self)
    }
    
}

extension SignInViewController: StoryboardInstantiable  {
    
  public class func instantiate(delegate: SignInViewControllerDelegate) -> SignInViewController {
    let viewController = instanceFromStoryboard()
    viewController.delegate = delegate
    return viewController
  }
}
