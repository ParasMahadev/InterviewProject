//
//  ContentView.swift
//  TestProject
//
//  Created by Paras Navadiya on 10/22/24.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel = CartViewModel()
    
    var body: some View {
           NavigationView {
               List {
                   ForEach(viewModel.carts, id: \.id) { cart in
                       Section(header: Text("Cart ID: \(cart.id) - Total: $\(cart.total, specifier: "%.2f")")) {
                           ForEach(cart.products, id: \.id) { product in
                               HStack {

                                   AsyncImage(url: URL(string: product.thumbnail)) { image in
                                       image
                                           .resizable()
                                           .aspectRatio(contentMode: .fill)
                                           .frame(width: 50, height: 50)
                                   } placeholder: {
                                       ProgressView()
                                   }
                                   
                                   VStack(alignment: .leading) {
                                       Text(product.title)
                                           .font(.headline)
                                       Text("Price: $\(product.price, specifier: "%.2f")")
                                       Text("Quantity: \(product.quantity)")
                                       Text("Discounted Total: $\(product.discountedTotal, specifier: "%.2f")")
                                   }
                                   .padding(.leading, 10)
                               }
                               .padding(.vertical, 5)
                           }
                       }
                   }
               }
               .navigationTitle("Cart")
               .onAppear {
                   viewModel.fetchCarts()
               }
               .alert(isPresented: .constant(!viewModel.errorMessage.isEmpty)) {
                   Alert(
                       title: Text("Error"),
                       message: Text(viewModel.errorMessage),
                       dismissButton: .default(Text("OK"))
                   )
               }
           }
       }
}

#Preview {
    CartView()
}
