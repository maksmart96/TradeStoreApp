//
//  LatestCollectionView.swift
//  test
//
//  Created by  Максим Мартынов on 19.03.2023.
//

import UIKit

class LatestCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let networkHelper = NetworkHelper()
    var cells = [ShopItem]()
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        //register cells
        register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layout.minimumLineSpacing  = Constants.latestCellsMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.collectionsLeftDistanceToView, bottom: 0, right: Constants.collectionsRightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.reuseID, for: indexPath) as! LatestCollectionViewCell 
        cell.categoryLabel.text = cells[indexPath.row].category!
        cell.nameLabel.text = "\(cells[indexPath.row].name!)"
        cell.priceLabel.text = "$ \(cells[indexPath.row].price!)"
            Task {
                do {
                    let image = try await self.cells[indexPath.row].image
                    cell.mainImageView.image = image
                    cell.clipsToBounds = true
                } catch {
                    print(error)
                }
            }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.latestItemWidth, height: frame.height * 0.95)//0.8
    }
}

