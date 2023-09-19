//
//  CartInteractor.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation

class CartInteractor : CartModulePresenterToInteractorProtocol {
    func clearCart() {
        CartManager.shared.clearCart()
    }
    
    
    func getCart() -> CartModel? {
        return CartManager.shared.getCart()
    }
    
    func updateCart(product: ProductModel) {
        CartManager.shared.updateCart(product: product)
    }
    
    
}
