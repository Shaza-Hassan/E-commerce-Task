//
//  ProductListInteractor.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation
import Alamofire

class ProductListInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func getProducts() {
        print("calling api")
        AF.request("\(BASE_URL)/products").responseDecodable(of: [ProductModelDTO].self) {
            [weak self] response in
            
            switch response.result {
            case .success(let data):
                let products = data.map{
                    ProductMapper().fromDtoToModel(productDTOModel: $0)
                }
                self?.presenter?.noticeFetchedSuccess(products: products)
            case .failure(let err):
                print(err)
                self?.presenter?.noticeFetchFailed()
            }
            
        }
    }
    
    func updateCart(product: ProductModel) {
        CartManager.shared.updateCart(product: product)
    }
    
    func getCartData() -> CartModel?{
        return CartManager.shared.getCart()
    }
    
}
