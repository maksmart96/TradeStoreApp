//
//  CategoriesCollectionViewCell.swift
//  test
//
//  Created by  Максим Мартынов on 18.03.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    //MARK: Instanse Properties
    static let reuseID = "CategoriesCollectionViewCell"
    
    let categoryImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let categoryContainerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.size.width / 1.4

        return view
    }()
    
    let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 6)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoryContainerView)
        addSubview(categoryImageView)
        addSubview(categoryNameLabel)
        categoryContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        categoryContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        categoryContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryContainerView.widthAnchor.constraint(equalToConstant: Constants.categoriesItemWidth).isActive = true
        categoryContainerView.heightAnchor.constraint(equalTo: categoryContainerView.widthAnchor).isActive = true
        
        categoryNameLabel.topAnchor.constraint(equalTo: categoryContainerView.bottomAnchor/*, constant: 10*/).isActive = true
        
        categoryImageView.leadingAnchor.constraint(equalTo: categoryContainerView.leadingAnchor, constant: 7).isActive = true
        categoryImageView.trailingAnchor.constraint(equalTo: categoryContainerView.trailingAnchor, constant: -7).isActive = true
        categoryImageView.topAnchor.constraint(equalTo: categoryContainerView.topAnchor, constant:  7).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: categoryContainerView.bottomAnchor, constant: -7).isActive = true
        
//        categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        categoryImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//
//
//        categoryNameLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor).isActive = true
        
        categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//public extension UIImage {
//    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
//        // Determine the scale factor that preserves aspect ratio
//        let widthRatio = targetSize.width / size.width
//        let heightRatio = targetSize.height / size.height
//
//        let scaleFactor = min(widthRatio, heightRatio)
//
//        // Compute the new image size that preserves aspect ratio
//        let scaledImageSize = CGSize(
//            width: size.width * scaleFactor,
//            height: size.height * scaleFactor
//        )
//
//        // Draw and return the resized UIImage
//        let renderer = UIGraphicsImageRenderer(
//            size: scaledImageSize
//        )
//
//        let scaledImage = renderer.image { _ in
//            self.draw(in: CGRect(
//                origin: .zero,
//                size: scaledImageSize
//            ))
//        }
//
//        return scaledImage
//    }
//}
