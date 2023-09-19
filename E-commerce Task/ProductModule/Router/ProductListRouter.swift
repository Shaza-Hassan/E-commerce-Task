//
//  ProductListRouter.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation
import UIKit

class ProductListRouter : PresenterToRouterProtocol {
    static func createModule() -> ProductListViewController {
        let view = ProductListViewController()
        
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ProductListPresenter()
        var interactor: PresenterToInteractorProtocol = ProductListInteractor()
        let router:PresenterToRouterProtocol = ProductListRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushToCart(navigationConroller: UINavigationController) {
        let cartNavigationController = CartRouter.createModule()
        navigationConroller.pushViewController(cartNavigationController, animated: true)
    }
    
    
    
    
}
