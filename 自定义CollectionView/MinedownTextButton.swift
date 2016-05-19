//
//  MinedownTextButton.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/26.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class MinedownTextButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame:CGRect){
        super.init(frame:CGRectZero)
        imageView?.contentMode = .Bottom
        titleLabel?.textAlignment = .Center
        titleLabel?.font = UIFont.systemFontOfSize(12)
        setTitleColor(UIColor.grayColor(), forState: .Normal)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleFrame = CGRect(x: 0, y:CGRectGetHeight(frame)*0.5 , width: CGRectGetWidth(frame), height: CGRectGetHeight(frame)*0.5)
        return titleFrame
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageFrame = CGRect(x: 0, y: 0, width: CGRectGetWidth(frame), height: CGRectGetHeight(frame)*0.5)

        return imageFrame
    
    }
}
