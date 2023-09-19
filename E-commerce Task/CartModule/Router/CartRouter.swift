//
//  CartRouter.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import Foundation
import UIKit
class CartRouter: CartModulePresenterToRouterProtocol{
    static func createModule() -> CartViewController {
        let view = CartViewController()
        let presenter = CartPresenter()
        let interactor = CartInteractor()
        view.presenter = presenter
        presenter.interactor = interactor
        return view
    }
}
