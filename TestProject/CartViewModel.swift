//
//  ProductViewModel.swift
//  TestProject
//
//  Created by Paras Navadiya on 10/22/24.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var carts: [Cart] = []
    @Published var errorMessage: String = ""
    
    func fetchCarts() {
        APIService.shared.fetchCarts() { result in
            switch result {
            case .success(let cartModel):
                self.carts = cartModel.carts
            case .failure(let error):
                self.errorMessage = error.localizedDescription  
            }
        }
    }
}
