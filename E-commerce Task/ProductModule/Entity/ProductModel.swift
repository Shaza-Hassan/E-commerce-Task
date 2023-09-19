//
//  ProductModel.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 18/09/2023.
//

import Foundation

class ProductModel: Codable {
    var id: Int?
    var title: String?
    var price: Double = 0.0
    var description: String?
    var image: String?
    var selectedItems: Int = 0
    

    init(id: Int? = nil, title: String? = nil, price: Double = 0.0, description: String? = nil, image: String? = nil, selectedItems: Int = 0) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.image = image
        self.selectedItems = selectedItems
    }
    
}
