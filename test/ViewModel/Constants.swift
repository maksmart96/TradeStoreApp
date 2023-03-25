//
//  Constants.swift
//  test
//
//  Created by  Максим Мартынов on 15.03.2023.
//

import Foundation
import UIKit


struct Constants {
    static let categoryLeftDistanceToView: CGFloat = 20
    static let categoryRightDistanceToView: CGFloat = 20
    static let categoriesMinimumLineSpacing: CGFloat = 10
//    static let categoriesItemWidth: CGFloat = 33
    static let categoriesItemWidth: CGFloat = (UIScreen.main.bounds.width - Constants.categoryLeftDistanceToView - Constants.categoryRightDistanceToView - (Constants.categoriesMinimumLineSpacing / 5)) / 6
    
    
    static let collectionsLeftDistanceToView: CGFloat = 5
    static let collectionsRightDistanceToView: CGFloat = 5
    static let latestCellsMinimumLineSpacing: CGFloat = 10
    
    static let latestItemWidth: CGFloat = (UIScreen.main.bounds.width - Constants.collectionsLeftDistanceToView - Constants.collectionsRightDistanceToView - (Constants.latestCellsMinimumLineSpacing / 2)) / 3
    
    static let flashSaleItemWidth: CGFloat = (UIScreen.main.bounds.width - Constants.collectionsLeftDistanceToView - Constants.collectionsRightDistanceToView - (Constants.latestCellsMinimumLineSpacing / 2)) / 2
}
