//
//  CartProtocols.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation
import UIKit

protocol CartModuleViewToPresenterProtocol  {
    
    var interactor: CartModulePresenterToInteractorProtocol? {get set}
    func getCart() -> CartModel?
    func updateCart(product: ProductModel)
    func clearCart()
    
}

protocol CartModulePresenterToViewProtocol   {
    func showCartData(cartModel: CartModel)
}

protocol CartModulePresenterToRouterProtocol {
    static func createModule()-> CartViewController
}

protocol CartModulePresenterToInteractorProtocol  {
    func getCart() -> CartModel?
    func updateCart(product:ProductModel)
    func clearCart()
}
