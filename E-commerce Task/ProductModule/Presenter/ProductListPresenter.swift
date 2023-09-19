//
//  ProductListPresenter.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation
import UIKit

class ProductListPresenter : ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func getProductData() {

        interactor?.getProducts()
    }
    
    func showCartViewController(navigationController: UINavigationController) {
        router?.pushToCart(navigationConroller: navigationController)
    }
    
    func updateCart(product: ProductModel){
        interactor?.updateCart(product: product)
    }
    
    func getCartData() -> CartModel? {
        return interactor?.getCartData()
    }
    
}

extension ProductListPresenter : InteractorToPresenterProtocol {
    
    func noticeFetchedSuccess(products: [ProductModel]) {
        view?.showNotice(noticeArray: products)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
}
