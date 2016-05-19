//
//  ssss.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/21.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit
extension UIColor {
    class func colorWithCustom(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    class func randomColor() ->UIColor{
        let r = CGFloat(arc4random_uniform(256))/255.0
        let g = CGFloat(arc4random_uniform(256))/255.0
        let b = CGFloat(arc4random_uniform(256))/255.0
        
      return  UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        
    }
    
}
//MARK 
