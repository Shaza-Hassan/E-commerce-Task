//
//  CartManager.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation

class CartManager{
    
    private init(){
        
    }
    
    static let shared = CartManager()
    
    
    private var cartModel: CartModel? = nil
    
    private func addProductToCart(_ product: ProductModel) {
        cartModel?.products.append(product)
    }
    
    func updateCart(product: ProductModel) {
        if cartModel == nil{
            cartModel = CartModel()
        }
        
        let index = cartModel?.products.firstIndex(where: {$0.id == product.id})
        
        if let index = index {
            if product.selectedItems == 0 {
                cartModel?.products.remove(at: index)
            } else{
                cartModel?.products[index] = product
            }
        } else{
            addProductToCart(product)
        }
        
        saveDataInUserDefualt()
    }
    
    func clearCart(){
        clearCartFromUserDefualt()
        cartModel = nil
    }
    
    func getCart() -> CartModel? {
        return getCartFromUserDefualt()
    }
    
    private func saveDataInUserDefualt(){
        guard let cartModel = cartModel else {
            return
        }
        
        if let encoded = try? JSONEncoder().encode(cartModel) {
            UserDefaults.standard.set(encoded, forKey: CART_KEY)
        }
        
    }
    
    private func getCartFromUserDefualt() -> CartModel? {
        if let data  =  UserDefaults.standard.object(forKey: CART_KEY) as? Data {
            if let cartModel = try? JSONDecoder().decode(CartModel.self, from: data) {
                return cartModel
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    private func clearCartFromUserDefualt() {
        UserDefaults.standard.removeObject(forKey: CART_KEY)
    }
}
