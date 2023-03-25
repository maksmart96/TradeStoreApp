//
//  TabBarController.swift
//  test
//
//  Created by  Максим Мартынов on 25.03.2023.
//

import UIKit



class TabBarController: UITabBarController {

    
//    public weak var delegate: TabBarControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "profileImage"), style: .done, target: self, action: #selector(presentProfile))
        navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsets(top: 1, left: 1, bottom: -1, right: -1)
//        navigationItem.rightBarButtonItem.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Menu"), style: .done, target: self, action: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    
//        navigationItem.rightBarButtonItem?.isHidden = true
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func presentProfile() {
        //show profileViewController
    }
}

  extension TabBarController: StoryboardInstantiable  {
    public class func instantiate(delegate: PageOneViewControllerDelegate) -> TabBarController {
      let viewController = instanceFromStoryboard()
//      viewController.delegate = delegate
      return viewController
    }
  }
