//
//  SuperMarketProductTableView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/21.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class SuperMarketProductTableView: UITableView {
    
    
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
    
    
    
   // private lazy var discountView
    
    
    private lazy var lineView:UIView = {
       let lineView = UIView()
        lineView.backgroundColor = lineViewColor
        lineView.alpha = lineAlpha
        
        return lineView
    }()
    
    
    
    
    
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: .Plain)
        backgroundColor = tabelBGColor
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
