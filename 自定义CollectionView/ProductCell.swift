//
//  ProductCell.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/22.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    private static let productID = "productCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    private lazy var productImageView:UIImageView = {
        let productImageView = UIImageView()
        
        
        return productImageView
    }()
    
    
    private lazy var fineImageView:UIImageView = {
        let fineImageView = UIImageView()
        fineImageView.image = UIImage(named: "jingxuan.png")
        return fineImageView
    }()
    
    
    
    
    
    private lazy var nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFontOfSize(14)
        
        return nameLabel
    }()
    
    private lazy var buyOneImageView:UIImageView = {
        let buyOneImageView = UIImageView()
        buyOneImageView.image = UIImage(named: "buyOne.png")
        return buyOneImageView
    }()
    
    private lazy var specialLabel:UILabel = {
        let specialLabel = UILabel()
        return specialLabel
    }()
    
    
    
    private  var discountView:DiscountView?
    
    
    private lazy var lineView:UIView = {
        let lineView = UIView()
        lineView.backgroundColor = lineViewColor
        lineView.alpha = lineAlpha
        
        return lineView
    }()
    
    
    
    var goods:Goods?{
        didSet{
           productImageView.sd_setImageWithURL(NSURL(string: (goods?.img)!), placeholderImage: UIImage(named: "v2_placeholder_square"))
            if goods!.pm_desc == "买一赠一" {
                fineImageView.hidden = false
            } else {
                fineImageView.hidden = true
            }
            
            if goods!.is_xf == 1 {
                buyOneImageView.hidden = false
            }else {
                buyOneImageView.hidden = true
            }
            
            specialLabel.text = goods?.specifics
            
           // discountView =
            
        }
    
    }
    
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.groupTableViewBackgroundColor()
        addSubview(productImageView)
        
        
    }
    
    class func productTableView(tableView:UITableView)->ProductCell{
        var cell = (tableView.dequeueReusableCellWithIdentifier(productID)) as? ProductCell
        
        if cell == nil {
            cell = ProductCell(style: .Default, reuseIdentifier: productID)
        }
        
        return cell!
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImageView.frame = CGRect(x: 0, y: 0, width: CGRectGetHeight(bounds), height:CGRectGetHeight(bounds))
        
    }


}
