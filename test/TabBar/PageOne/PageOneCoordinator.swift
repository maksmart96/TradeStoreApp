//
//  PageOneCoordinator.swift
//  test
//
//  Created by  Максим Мартынов on 17.03.2023.
//
//import Foundation
//import UIKit
//
//public class PageOneCoordinator: Coordinator {
//
//  // MARK: - Instance Properties
//    public var children: [Coordinator] = []
//    public let router: Router
//
//  // MARK: - Object Lifecycle
//  public init(router: Router) {
//    self.router = router
//  }
//
//  // MARK: - Instance Methods
//  public func present(animated: Bool,
//                      onDismissed: (() -> Void)?) {
//    let viewController = PageOneViewController.instantiate(delegate: self)
//    router.present(viewController,
//                   animated: animated,
//                   onDismissed: onDismissed)
//
//
//  }
//}
//
//extension PageOneCoordinator: PageOneViewControllerDelegate {
//    public func pageOneViewController(_ controller: PageOneViewController, didSelectTabBarItem item: UITabBarItem) {
//        //TO DO
//        let coordinator = PageOneCoordinator(router: router)
//        presentChild(coordinator, animated: true)
//    }
//
//
//}
