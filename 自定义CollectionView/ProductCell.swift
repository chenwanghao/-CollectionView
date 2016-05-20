//
//  ProductCell.swift
//  TabelViewForSwift
//
//  Created by allen on 16/4/21.
//  Copyright © 2016年 allen. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    private static let identifier:String = "productCell"
    private lazy var mainImageView:UIImageView = {
        let uiImageView = UIImageView()
        
        return uiImageView
    }()
    
    private lazy var fineImageView:UIImageView = {
        let fineImageView = UIImageView()
        fineImageView.image = UIImage(named: "jingxuan.png")
        
        return fineImageView
    }()
    
    private lazy var nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFontOfSize(13)
        return nameLabel
    }()
    
    
    private lazy var giveImageView:UIImageView = {
        let giveImageView = UIImageView()
        giveImageView.image = UIImage(named: "buyOne.png")
        return giveImageView
    }()
    
    
    private lazy var specialLabel:UILabel = {
        let specialLabel = UILabel()
        specialLabel.font = UIFont.systemFontOfSize(13)
        return specialLabel
    }()
    
    private  var discountView:DiscountView?
    
    
    
    
    
    var goodsArr:Goods?{
        didSet{
            mainImageView.sd_setImageWithURL(NSURL(string: goodsArr!.img!), placeholderImage: UIImage(named: "v2_placeholder_square"))
            
            if goodsArr?.pm_desc == "买一赠一" {
                giveImageView.hidden = false
            }else {
                giveImageView.hidden = true
            }
            
            if goodsArr?.is_xf  == 1 {
                fineImageView.hidden = false
            }else {
                fineImageView.hidden = true
                
            }
            
            specialLabel.text = goodsArr?.specifics
            
            nameLabel.text = goodsArr?.name
            
            if discountView != nil {
                discountView?.removeFromSuperview()
            }
            
            discountView = DiscountView(discount: goodsArr?.partner_price , origin: goodsArr?.market_price)
            
            addSubview(discountView!)
        }
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(mainImageView)
        addSubview(giveImageView)
        addSubview(fineImageView)
        addSubview(specialLabel)
        addSubview(nameLabel)
        
    }
    
    
    
    
    
    
    
    class func tableView(tabView:UITableView) -> ProductCell{
        var cell =  (tabView.dequeueReusableCellWithIdentifier(identifier)) as? ProductCell
        if cell == nil {
            cell = ProductCell(style: .Default, reuseIdentifier: identifier)
        }
        return cell!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.frame =  CGRect(x: 0, y: 0, width: CGRectGetHeight(bounds), height: CGRectGetHeight(bounds))
        fineImageView.frame = CGRect(x: CGRectGetMaxX(mainImageView.frame) + margin, y: margin, width: 40, height: 16)
        
        if fineImageView.hidden {
            nameLabel.frame = CGRect(x: CGRectGetMaxX(mainImageView.frame) + margin, y: margin, width: mj_w - CGRectGetMaxX(mainImageView.frame) - margin , height: 16)
        }else{
            nameLabel.frame = CGRect(x: CGRectGetMaxX(fineImageView.frame) + margin, y: margin, width: mj_w - CGRectGetMaxX(fineImageView.frame) - margin , height: 16)
        }
        
        giveImageView.frame = CGRect(x: CGRectGetMaxX(mainImageView.frame) + margin, y: CGRectGetMaxY(fineImageView.frame)+margin, width: 40, height: 16)
        specialLabel.frame = CGRect(x: CGRectGetMaxX(mainImageView.frame) + margin, y: CGRectGetMaxY(giveImageView.frame)+margin, width: 100, height: 16)
        
        discountView?.frame = CGRect(x:  CGRectGetMaxX(mainImageView.frame) + margin, y:CGRectGetMaxY(specialLabel.frame)+margin , width: 150, height: 16)
        print(CGRectGetMaxY(discountView!.frame))
      //  nameLabel.frame
        
        
        //  print("cell:\(NSStringFromCGRect(frame))")
        //print("label:\(NSStringFromCGRect((mainImageView.frame)))")
    }
    
    
}
