//
//  LatestCollectionViewHeader.swift
//  test
//
//  Created by  Максим Мартынов on 23.03.2023.
//

import UIKit

class LatestCollectionViewHeader: UIView {
    
//    static let reuseID = "HeaderCollectionView"
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.text = "Latest"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 7)
        label.textColor = .gray
        label.text = "View all"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .systemMint
        addSubview(leftLabel)
        addSubview(viewAllLabel)
        //left label constraints
        leftLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        leftLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        //viewAll label constraints
        viewAllLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        viewAllLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
