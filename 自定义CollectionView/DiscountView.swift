//
//  DiscountView.swift
//  TabelViewForSwift
//
//  Created by allen on 16/4/21.
//  Copyright © 2016年 allen. All rights reserved.
//

import UIKit

class DiscountView: UIView {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    private lazy var discountPrice:UILabel = {
        let discountLabel  = UILabel()
        discountLabel.textAlignment = .Center
        discountLabel.font = UIFont.systemFontOfSize(13)
        discountLabel.textColor = UIColor.redColor()
        return discountLabel
    }()
    
    
    private lazy var originalPrice:UILabel = {
        let originalLabel = UILabel()
        originalLabel.font = UIFont.systemFontOfSize(13)
        return originalLabel
    }()
    
    private lazy var lineView:UIView = {
        let  lineView = UIView()
        lineView.backgroundColor = UIColor.blackColor()
        //        lineView.alpha = 0.5
        return lineView
    }()
    
    
    convenience init(discount:String?,origin:String?){
        self.init(frame:CGRectZero)
        
        if discount != nil && discount!.characters.count > 0 {
            
            self.discountPrice.text = "$" + discount!
            //self.discountPrice.sizeToFit()
        }
        
        if origin != nil && origin?.characters.count>0 {
            
            self.originalPrice.text = "$" + origin!
            // self.originalPrice.sizeToFit()
        }
        
        if discount == origin {
            self.originalPrice.hidden = true
        }
        
        
        
    }
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(discountPrice)
        addSubview(originalPrice)
        originalPrice.addSubview(lineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        originalPrice.sizeToFit()
        discountPrice.frame = CGRect(x: 0, y: 0, width: CGRectGetWidth(bounds)*0.5, height: CGRectGetHeight(bounds))
        originalPrice.frame = CGRect(x: CGRectGetWidth(bounds)*0.5, y: 0, width: CGRectGetWidth(bounds)*0.5, height:CGRectGetHeight(bounds) )
        lineView.frame = CGRect(x: 0, y: CGRectGetHeight(bounds)*0.5, width: CGRectGetWidth(originalPrice.frame)*0.75, height: 1)
    }
    
}
