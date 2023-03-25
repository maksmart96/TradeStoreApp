//
//  FlashSaleCollectionViewCell.swift
//  test
//
//  Created by  Максим Мартынов on 23.03.2023.
//

import Foundation
import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FlashSaleCollectionViewCell"
    
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.shadowColor = .darkGray
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center

        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white: 0.8, alpha: 0.7)
        label.font = .boldSystemFont(ofSize: 7)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.shadowColor = .darkGray
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        let imageView = UIImageView(image: UIImage(named: "plus"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 7).isActive = true
        imageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -7).isActive = true
        imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 7).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -7).isActive = true
        
        button.backgroundColor = UIColor(white: 0.8, alpha: 0.9)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    let sellerPhoto: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SellerPhoto"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        
        return imageView
    }()
    
    //MARK: - LIKE BUTTON нужно выставить и DiscountLabel
    let likeButton: UIButton = {
        let button = UIButton()
        let imageView = UIImageView(image: UIImage(named: "like"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -5).isActive = true
        imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 5).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -5).isActive = true
        
        button.backgroundColor = UIColor(white: 0.8, alpha: 0.9)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    let discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        addSubview(categoryLabel)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(addButton)
        addSubview(discountLabel)
        addSubview(likeButton)
        addSubview(sellerPhoto)
        
        // mainImage constraints
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //categoryLabel constraints
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        categoryLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        //nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //
        
        //priceLabel constraints
        priceLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        //addButton constraints
        addButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        //MARK: - likeButton constraints-----------------
        likeButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        likeButton.widthAnchor.constraint(equalTo: likeButton.heightAnchor).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -5).isActive = true
        likeButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor).isActive = true
        //discountLabel constraints
        discountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7).isActive = true
        discountLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        discountLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        //sellerPoto constraints
        sellerPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        sellerPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        sellerPhoto.heightAnchor.constraint(equalToConstant: 25).isActive = true
        sellerPhoto.widthAnchor.constraint(equalTo: sellerPhoto.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12
        self.addButton.layer.cornerRadius = self.addButton.bounds.width / 2
        //
        self.likeButton.layer.cornerRadius = self.likeButton.bounds.width / 2
        //
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.clipsToBounds = false
        
        
    }
}
