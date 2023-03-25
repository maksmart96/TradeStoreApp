//
//  LoginCoordinator.swift
//  test
//
//  Created by  Максим Мартынов on 17.03.2023.
//
import Foundation
import UIKit

public class LoginCoordinator: Coordinator {
    
    // MARK: - Instance Properties
    public var children: [Coordinator] = []
    public let router: Router
    
    // MARK: - Object Lifecycle
    public init(router: Router) {
        self.router = router
    }
    
    // MARK: - Instance Methods
    public func present(animated: Bool,
                        onDismissed: (() -> Void)?) {
        let viewController =
        LoginViewController.instantiate(delegate: self)
        router.present(viewController,
                       animated: animated,
                       onDismissed: onDismissed)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    public func loginViewControllerDidPressLogin() {
        let coordinator = TabBarControllerCoordinator(router: router)
        //PageOneCoordinator
        presentChild(coordinator, animated: true)
    }
}
