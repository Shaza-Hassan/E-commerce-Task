//
//  CartModel.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation

class CartModel: Codable {
    var products: [ProductModel] = []
    
    var totalPrice : Double {
        var sum : Double = 0
        
        products.forEach{
            sum += ($0.price * Double($0.selectedItems))
        }        
        return sum
    }
}
