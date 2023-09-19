//
//  ProductMapper.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation

class ProductMapper {
    func fromDtoToModel(productDTOModel: ProductModelDTO) -> ProductModel {
        return ProductModel(id: productDTOModel.id,title: productDTOModel.title, price: productDTOModel.price ?? 0.0, description: productDTOModel.description,image: productDTOModel.image, selectedItems: 0)
    }
}
