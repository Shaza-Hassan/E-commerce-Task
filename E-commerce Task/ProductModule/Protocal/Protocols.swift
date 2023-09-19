//
//  Protocols.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 18/09/2023.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol  {
 
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func getProductData()
    func showCartViewController(navigationController:UINavigationController)
    func updateCart(product: ProductModel)
    func getCartData() -> CartModel?
    
}

protocol PresenterToViewProtocol   {
    func showNotice(noticeArray:[ProductModel])
    func showError()
}

protocol PresenterToRouterProtocol {
    static func createModule()-> ProductListViewController
    func pushToCart(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol  {
    var presenter:InteractorToPresenterProtocol? {get set}
    func getProducts()
    func updateCart(product:ProductModel)
    func getCartData() -> CartModel?
}

protocol InteractorToPresenterProtocol {
    func noticeFetchedSuccess(products:[ProductModel])
    func noticeFetchFailed()
}
