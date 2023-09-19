//
//  CartViewController.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var clearCartButton: UIButton!
    @IBOutlet weak var cartProductList: UITableView!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var noProductInCartLabel: UILabel!
    
    var presenter : CartModuleViewToPresenterProtocol?
    
    var cartModel : CartModel?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        setupView()
        cartProductList.dataSource = self
        cartProductList.delegate = self
    }
    
    
    private func setupView(){
        cartModel = presenter?.getCart()

        guard let cartModel = cartModel, !cartModel.products.isEmpty else {
            clearCartButton.isHidden = true
            cartProductList.isHidden = true
            payButton.isHidden = true
            noProductInCartLabel.isHidden = false
            return
        }
        
        clearCartButton.isHidden = false
        cartProductList.isHidden = false
        payButton.isHidden = false
        noProductInCartLabel.isHidden = true
        
        payButton.setTitle("Pay \(cartModel.totalPrice) EGP", for: .normal)
        cartProductList.reloadData()
    }
    @IBAction func clearCart(_ sender: Any) {
        presenter?.clearCart()
        setupView()
    }
    
}


extension CartViewController :  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartModel?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CartTableViewCell.cellForTableView(tableView: tableView, cellForRowAt: indexPath)
        guard let cartModel = cartModel else {
            return cell
        }
        
        cell.configCell(product: cartModel.products[indexPath.row])
        cell.callback = {
            [weak self] counter in
            cartModel.products[indexPath.row].selectedItems = counter
            
            self?.presenter?.updateCart(product: cartModel.products[indexPath.row])
            
            self?.setupView()
        }
        return cell
    }
    
    
}
