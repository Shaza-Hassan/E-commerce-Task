//
//  ViewController.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 18/09/2023.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var listOfProducts: UITableView!
    @IBOutlet weak var cartButton: UIBarButtonItem!
    var presentor:ViewToPresenterProtocol?

    var products: [ProductModel] = []
    
    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showProgressIndicator(view: self.view)
        presentor?.getProductData()
        listOfProducts.delegate = self
        listOfProducts.dataSource = self
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        listOfProducts.addSubview(refreshControl)
        self.navigationItem.title = "Shop"
        
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(self.openCart(_:)))
        self.navigationItem.rightBarButtonItem  = cartButton
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presentor?.getProductData()
    }
    
    @objc func openCart(_ sender: Any) {
        guard let navigationController = navigationController  else {
            return
            
        }
        presentor?.showCartViewController(navigationController: navigationController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCartData()
    }
    
    private func getCartData(){
        let cart = presentor?.getCartData()
        
        guard let cart = cart else {
            products.forEach{
                $0.selectedItems = 0
            }
            listOfProducts.reloadData()
            return
        }
        
        if cart.products.isEmpty{
            products.forEach{
                $0.selectedItems = 0
            }
            listOfProducts.reloadData()
        } else {
            
            if !products.isEmpty {
                updateProductListWithCartData(cart)
            }
        }
        
    }
    
    fileprivate func updateProductListWithCartData(_ cart: CartModel) {
        cart.products.forEach{
            product in
            let index = products.firstIndex{$0.id == product.id}
            guard let index = index else {
                return
            }
            products[index] = product
        }
        listOfProducts.reloadData()
    }
    
}


extension ProductListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProductCell.cellForTableView(tableView: tableView, cellForRowAt: indexPath)
    
        if let cartModel = CartManager.shared.getCart() , !cartModel.products.isEmpty {
            
            // update product data with cart
        }
        
        cell.configCell(product: products[indexPath.row])
        cell.callback = {
            [weak self] counter in
            self?.products[indexPath.row].selectedItems = counter
            guard let products = self?.products else{
                return
            }
            self?.presentor?.updateCart(product: products[indexPath.row])
            
            tableView.reloadData()
        }
        return cell
    }
}


extension ProductListViewController : PresenterToViewProtocol {
    func showNotice(noticeArray: [ProductModel]) {
        products = noticeArray
        getCartData()
        listOfProducts.reloadData()
        hideProgressIndicator(view: self.view)
        refreshControl.endRefreshing()
    }
    
    func showError() {
        hideProgressIndicator(view: self.view)
        print("error happening")
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        refreshControl.endRefreshing()

    }
    
    
}
