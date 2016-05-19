//
//  SuperMarketTableView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/21.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class SuperMarketTableView: UITableView {
        
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        backgroundColor = tabelBGColor
        userInteractionEnabled = true
        
    }
    
    
       
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    
}



