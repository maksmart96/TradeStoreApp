//
//  StartCoordinator.swift
//  test
//
//  Created by  Максим Мартынов on 17.03.2023.
//
import UIKit
import Foundation
public class StartCoordinator: Coordinator {

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
      SignInViewController.instantiate(delegate: self)
    router.present(viewController,
                   animated: animated,
                   onDismissed: onDismissed)
  }
}

// MARK: - SignInViewControllerDelegate
extension StartCoordinator: SignInViewControllerDelegate {

    public func signInViewControllerDidPressSignIn(
      _ viewController: SignInViewController) {
      let router = ModalNavigationRouter(parentViewController: viewController)
      let coordinator = TabBarControllerCoordinator(router: router)
          //PageOneCoordinator
      presentChild(coordinator, animated: true)
    }
    
    public func signInViewControllerDidPressLogin(_ viewController: SignInViewController) {
        let router = ModalNavigationRouter(parentViewController: viewController)
        let coordinator = LoginCoordinator(router: router)
        presentChild(coordinator, animated: true)
    }
}
