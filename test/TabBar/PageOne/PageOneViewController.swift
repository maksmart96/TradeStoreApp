//
//  PageOneViewController.swift
//  test
//
//  Created by  Максим Мартынов on 15.03.2023.
//

import UIKit

// MARK: - PageOneViewControllerDelegate
public protocol PageOneViewControllerDelegate: class {
  func pageOneViewController(_ controller: PageOneViewController, didSelectTabBarItem item: UITabBarItem)
}

public class PageOneViewController: UIViewController, UITabBarDelegate {
    // MARK: - Instance Properties
    public weak var delegate: PageOneViewControllerDelegate?
    
    @IBOutlet weak var searchTextField: UITextField!
    
    

    private var categoriesCollectionView = CategoriesCollectionView()
    private var latestCollectionView = LatestCollectionView()
    private var latestCollectionHeader = LatestCollectionViewHeader()
    private var flashSaleCollectionView = FlashSaleCollectionView()
    private var flashSaleCollectionViewHeader = FlashSaleCollectionViewHeader()
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController!.navigationItem.title = "Trade by Bata"
        Task {
            do {
                self.latestCollectionView.cells = try await NetworkHelper.shared.downloadLatest()
                self.flashSaleCollectionView.cells = try await NetworkHelper.shared.downloadFlashSale()
                //MARK: - reload data
                self.latestCollectionView.reloadData()
                self.flashSaleCollectionView.reloadData()
            } catch {
                fatalError("no download")
            }
        }
    }
    
    public override func viewDidLoad()  {
        super.viewDidLoad()
        
        searchTextField.borderStyle = .none
        view.addSubview(categoriesCollectionView)
        view.addSubview(latestCollectionHeader)
        view.addSubview(latestCollectionView)
        view.addSubview(flashSaleCollectionViewHeader)
        view.addSubview(flashSaleCollectionView)
        
        //MARK: Constraints
        categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        categoriesCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10).isActive = true
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        latestCollectionHeader.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 10).isActive = true
        latestCollectionHeader.heightAnchor.constraint(equalToConstant: 20).isActive = true
        latestCollectionHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        latestCollectionHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        latestCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        latestCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        latestCollectionView.topAnchor.constraint(equalTo: latestCollectionHeader.bottomAnchor).isActive = true
        latestCollectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
//        latestCollectionView.backgroundColor = .gray
        flashSaleCollectionViewHeader.topAnchor.constraint(equalTo: latestCollectionView.bottomAnchor, constant: 5).isActive = true
        flashSaleCollectionViewHeader.heightAnchor.constraint(equalToConstant: 20).isActive = true
        flashSaleCollectionViewHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        flashSaleCollectionViewHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        flashSaleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        flashSaleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        flashSaleCollectionView.topAnchor.constraint(equalTo: flashSaleCollectionViewHeader.bottomAnchor).isActive = true
        flashSaleCollectionView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
}

extension PageOneViewController: StoryboardInstantiable  {
  public class func instantiate(delegate: PageOneViewControllerDelegate) -> PageOneViewController {
    let viewController = instanceFromStoryboard()
    viewController.delegate = delegate
    return viewController
  }
}
