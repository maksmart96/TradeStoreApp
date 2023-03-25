//
//  ShopItemViewModel.swift
//  test
//
//  Created by  Максим Мартынов on 19.03.2023.
//

import Foundation


public class NetworkHelper {
    
//    var items: [ShopItem] = []
    
    static let shared = NetworkHelper()
    
    func downloadLatest() async throws -> [ShopItem] {
        let latestURL = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
        
        let (data, response) = try await URLSession.shared.data(from: latestURL)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else { throw URLError(.badServerResponse) }
        let decoder = JSONDecoder()
        let results = try decoder.decode(ShopModel.self, from: data)
        return results.latest!
    }
    
    func downloadFlashSale() async throws -> [ShopItem] {
        let flashSaleURL = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
        let (data, response) = try await URLSession.shared.data(from: flashSaleURL)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else { throw URLError(.badServerResponse) }
        let decoder = JSONDecoder()
        let results = try decoder.decode(ShopModel.self, from: data)
        print("items downloaded")
        return results.flashSale!
    }
}


//extension URLSession {
//    func decode<T: Decodable>(
//        _ type: T.Type = T.self,
//        from url: URL,
//        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
//        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
//        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
//    ) async throws  -> T {
//        let (data, _) = try await data(from: url)
//
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = keyDecodingStrategy
//        decoder.dataDecodingStrategy = dataDecodingStrategy
//        decoder.dateDecodingStrategy = dateDecodingStrategy
//
//        let decoded = try decoder.decode(T.self, from: data)
//        return decoded
//    }
//}
