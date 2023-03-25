//
//  ProfileCoordinator.swift
//  test
//
//  Created by  Максим Мартынов on 24.03.2023.
//

import Foundation
import UIKit

public class TabBarControllerCoordinator: Coordinator {

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
      let tabBarController = TabBarController.instantiate(delegate: self)
      let pageOneViewController = PageOneViewController.instantiate(delegate: self)
      let favoriteViewController = FavoriteViewController.instantiate(delegate: self)
      let cartViewController = CartViewController.instantiate(delegate: self)
      let chatViewController = ChatViewController.instantiate(delegate: self)
      let profileViewController = ProfileViewController.instantiate(delegate: self)
      tabBarController.viewControllers = [pageOneViewController, favoriteViewController, cartViewController, chatViewController, profileViewController]
      tabBarController.selectedViewController = pageOneViewController
    router.present(tabBarController,
                   animated: animated,
                   onDismissed: onDismissed)
  }
}

extension TabBarControllerCoordinator: ProfileViewControllerDelegate, PageOneViewControllerDelegate, FavoriteViewControllerDelegate, CartViewControllerDelegate, ChatViewControllerDelegate  {
    public func profileViewControllerDidPressLogOut() {
        router.dismiss(animated: true)
    }
    
    public func pageOneViewController(_ controller: PageOneViewController, didSelectTabBarItem item: UITabBarItem) {
        //todo
    }
    
    public func profileViewController(_ controller: ProfileViewController, didPressSignOutBurron: UIButton) {
        router.dismiss(animated: true)
    }
    
    
}
