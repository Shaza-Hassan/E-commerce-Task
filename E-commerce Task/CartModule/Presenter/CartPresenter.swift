//
//  CartPresenter.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation

class CartPresenter : CartModuleViewToPresenterProtocol{
    
    var interactor: CartModulePresenterToInteractorProtocol?
        
    func getCart() -> CartModel?{
        return interactor?.getCart()
    }
    

    func updateCart(product: ProductModel) {
        interactor?.updateCart(product: product)
    }
    func clearCart() {
        interactor?.clearCart()
    }
    
    
    
}
