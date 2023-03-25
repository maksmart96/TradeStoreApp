//
//  FavoriteViewController.swift
//  test
//
//  Created by  Максим Мартынов on 25.03.2023.
//

import UIKit
public protocol FavoriteViewControllerDelegate {
    
}

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoriteViewController: StoryboardInstantiable  {
  public class func instantiate(delegate: FavoriteViewControllerDelegate) -> FavoriteViewController {
    let viewController = instanceFromStoryboard()
//      viewController.delegate = delegate
    return viewController
  }
}
