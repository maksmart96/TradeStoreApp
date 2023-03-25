//
//  LatestCollectionViewCell.swift
//  test
//
//  Created by  Максим Мартынов on 19.03.2023.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    static let reuseID = "LatestCollectionViewCell"
    
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 10)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        addSubview(categoryLabel)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(addButton)
        
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
        nameLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12
        self.addButton.layer.cornerRadius = 12
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.clipsToBounds = false
    }
}
