//
//  ProductModelDTO.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation

class ProductModelDTO : Codable {
    var id: Int?
    var title: String?
    var price: Double?
    var description: String?
    var image: String?
}
