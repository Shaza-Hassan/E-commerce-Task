//
//  CartTableViewCell.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 19/09/2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var quantityOfProduct: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    
    private var productModel: ProductModel?
    var callback : ((Int)->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView,cellForRowAt indexPath: IndexPath) -> CartTableViewCell {
        tableView.register(UINib(nibName: String(describing: CartTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CartTableViewCell.self))
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CartTableViewCell.self), for: indexPath) as! CartTableViewCell
        
        return cell
        
    }
    
    func configCell(product: ProductModel){
        self.productModel = product
        productPrice.text = "\(product.price) EGP"
        productTitle.text = product.title
        quantityOfProduct.text = "\(product.selectedItems)"
        let url = URL(string: product.image ?? "")
        productImage.kf.setImage(with: url)
    }
    
    @IBAction func increaseQuantity(_ sender: Any) {
        
        
        guard let productModel = productModel else{
            return
        }
        
        productModel.selectedItems += 1
        
        callback?(productModel.selectedItems)
    }
    
    @IBAction func decreaseQuantity(_ sender: Any) {
        
        guard let productModel = productModel else{
            return
        }
        
        if productModel.selectedItems > 1 {
            productModel.selectedItems -= 1
        } else{
            productModel.selectedItems = 0
            
        }
        
        callback?(productModel.selectedItems)
    }
    
    
}
