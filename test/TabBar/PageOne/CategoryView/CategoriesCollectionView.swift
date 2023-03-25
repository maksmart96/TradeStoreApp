//
//  CategoriesCollectionView.swift
//  test
//
//  Created by  Максим Мартынов on 18.03.2023.
//

import UIKit

class CategoriesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
//        backgroundColor = .darkGray
        delegate = self
        dataSource = self
        register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.categoriesMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.categoryLeftDistanceToView, bottom: 0, right: Constants.categoryRightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryEnum.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseID, for: indexPath) as! CategoriesCollectionViewCell
        
        
        
        let image = UIImage(named: CategoryEnum.allCases[indexPath.row].imageName!)
        
//        cell.backgroundColor = .green
        cell.categoryImageView.image = image
        cell.categoryNameLabel.text = CategoryEnum.allCases[indexPath.row].title
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: Constants.categoriesItemWidth, height: frame.height * 0.9)
//    }
}



