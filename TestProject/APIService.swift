//
//  ProductServices.swift
//  TestProject
//
//  Created by Paras Navadiya on 10/22/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchCarts(completion: @escaping (Result<CartModel, Error>) -> Void) {
        // API URL
        guard let url = URL(string: "https://dummyjson.com/carts") else {
            completion(.failure(CartErrors.invalidURL))
            return
        }
        
        // Data task to fetch data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(CartErrors.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(CartErrors.noData))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(CartModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(CartErrors.networkError(error)))
                }
            }
        }.resume()
    }
}
