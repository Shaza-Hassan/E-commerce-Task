//
//  ProductCell.swift
//  E-commerce Task
//
//  Created by Shaza Hassan on 18/09/2023.
//

import Foundation
import UIKit
import Kingfisher

class ProductCell : UITableViewCell{
    @IBOutlet weak var productView: UIImageView!
    @IBOutlet weak var price: PaddingLabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var increaseCounter: UIButton!
    @IBOutlet weak var decreaseCounter: UIButton!
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var countOfProduct: UILabel!
    @IBOutlet weak var quantityStack: UIStackView!
    
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
    
    
    class func cellForTableView(tableView: UITableView,cellForRowAt indexPath: IndexPath) -> ProductCell {
        tableView.register(UINib(nibName: String(describing: ProductCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductCell.self))

        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self), for: indexPath) as! ProductCell
        
        return cell
    }
    
    
    func configCell(product: ProductModel){
        self.productModel = product
        price.text = "\(product.price ) EGP"
        productName.text = product.title
        quantityStack.isHidden = product.selectedItems == 0 ? true : false
        countOfProduct.text = "\(product.selectedItems )"
        addItem.isHidden = product.selectedItems == 0 ? false : true
        let url = URL(string: product.image ?? "")
        productView.kf.setImage(with: url)
    }
    
    @IBAction func onAddButtonClick(_ sender: Any) {
        
        guard let productModel = productModel else{
            return
        }
        
        productModel.selectedItems += 1
    
        callback?(productModel.selectedItems)
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
