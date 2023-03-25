//
//  ProfileViewController.swift
//  test
//
//  Created by  Максим Мартынов on 24.03.2023.
//

import Foundation
import UIKit

public protocol ProfileViewControllerDelegate: class {
    // MARK: - ProfileViewControllerDelegate
    func profileViewControllerDidPressLogOut()
}
public class ProfileViewController: UIViewController {
    // MARK: - Instance Properties
    public weak var delegate: ProfileViewControllerDelegate?
    
    @IBOutlet weak var detailImage: UIImageView!
    //MARK: - View LifeCycle
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController!.navigationItem.title = "Profile"
        
    }
    
    //MARK: - IBActions
    @IBAction func LogOutPressed(_ sender: Any) {
        delegate?.profileViewControllerDidPressLogOut()
    }
    
    @IBAction func updateImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
//        UIImagePickerController.isSourceTypeAvailable(.camera)
//                ? .camera
//                : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}
extension ProfileViewController: StoryboardInstantiable  {
    public class func instantiate(delegate: ProfileViewControllerDelegate) -> ProfileViewController {
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       guard let selectedImage = info[.editedImage] as? UIImage else { return }
        
        detailImage.contentMode = .scaleAspectFill
        detailImage.clipsToBounds = true
        detailImage.layer.cornerRadius = detailImage.bounds.height / 2
        detailImage.image = selectedImage
        
        
        //мучения с фото в углу
//        let button = UIButton.init(type: .custom) as! UIButton
//        button.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
//        button.frame = CGRectMake(0, 0, 40, 40)
//        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//        let barItem = UIBarButtonItem(customView: button)
//        tabBarController?.navigationItem.rightBarButtonItem = barItem
        dismiss(animated: true, completion: nil)
    }
}
