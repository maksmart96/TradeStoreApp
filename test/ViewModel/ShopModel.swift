//
//  ShopModel.swift
//  test
//
//  Created by  Максим Мартынов on 20.03.2023.
//

import Foundation
import UIKit

public class ShopModel: Decodable {
    
    let latest: [ShopItem]?
    let flashSale: [ShopItem]?
    
    enum CodingKeys: String, CodingKey {

        case latest = "latest"
        case flashSale = "flash_sale"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latest = try values.decodeIfPresent([ShopItem].self, forKey: .latest)
        flashSale = try values.decodeIfPresent([ShopItem].self, forKey: .flashSale)
    }
//    var flashSale: [ShopItem]
//    private let shopItem: ShopItem
//
//    init(item: ShopItem) {
//        self.shopItem = item
//    }
//
//
//    public var category: String {
//        shopItem.category
//    }
//    public var name: String {
//        shopItem.name
//    }
//    public var price: Int {
//        Int(shopItem.price)
//    }
}

struct ShopItem: Codable {
    let category: String?
    let name: String?
    let price: Double?
    let image_url: String?
    let discount: Double?
    
    enum CodingKeys: String, CodingKey {

        case category = "category"
        case name = "name"
        case price = "price"
        case image_url = "image_url"
        case discount = "discount"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        discount = try values.decodeIfPresent(Double.self, forKey: .discount)
    }
    
    var image: UIImage? {
        get async throws {
            guard let imageUrlString = image_url else { return nil }
            guard let imageURL = URL(string: imageUrlString) else { return nil }
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            return UIImage(data: data)
        }
    }
}

