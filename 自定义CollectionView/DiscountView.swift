//
//  DiscountView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/22.
//  Copyright © 2016年 cc. All rights reserved.
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
    
    private lazy  var discountPriceLabel:UILabel = {
       let discountLabel = UILabel()
        discountLabel.textColor = UIColor.redColor()
        discountLabel.font = UIFont.systemFontOfSize(13)
        return discountLabel
    }()
    
    
    private lazy var originPriceLabel:UILabel = {
        let originLabel = UILabel()
        originLabel.textColor = UIColor.grayColor()
        originLabel.font = UIFont.systemFontOfSize(13)
        return originLabel
    }()
    
    
    private lazy var lineView:UIView = {
        let  lineView = UIView()
        lineView.backgroundColor = lineViewColor
        
        return lineView
        
    
    }()
    
    
    convenience init(origin:String?,discount:String?) {
            self.init()
        if origin != nil || origin?.characters.count > 0 {
            
            originPriceLabel.text = "$\(origin!.cleanDecimalPointZear())"
        }
        
        if discount != nil || discount?.characters.count > 0 {
            
            discountPriceLabel.text = "$\(discount!.cleanDecimalPointZear())"
            if origin == discount {
                originPriceLabel.hidden = true
            }
        }
        
            
        }
    
    init(){
        super.init(frame: CGRectZero)
        addSubview(discountPriceLabel)
        addSubview(originPriceLabel)
        originPriceLabel.addSubview(lineView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        discountPriceLabel.frame = CGRect(x: 5, y: 0, width: CGRectGetWidth(frame)*0.5, height: CGRectGetHeight(frame))
        discountPriceLabel.sizeToFit();
        originPriceLabel.frame = CGRect(x: CGRectGetMaxX(discountPriceLabel.frame)+5, y: 0, width: CGRectGetWidth(frame)*0.5, height: CGRectGetHeight(frame))
        originPriceLabel.sizeToFit()
        lineView.frame = CGRect(x: 0, y: (CGRectGetHeight(originPriceLabel.frame))*0.5, width: CGRectGetWidth(originPriceLabel.frame), height:1)
    }

}
