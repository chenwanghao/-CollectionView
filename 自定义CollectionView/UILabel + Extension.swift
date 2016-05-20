//
//  UILabel + Extension.swift
//  SwiftForUIlabel
//
//  Created by allen on 16/5/18.
//  Copyright © 2016年 allen. All rights reserved.
//

import UIKit

extension UILabel {
    func boundingRectWithSize(text:String,fontSize:CGFloat) -> CGSize? {
        self.text = text
        numberOfLines = 0
        textAlignment = .Center
        font = UIFont.systemFontOfSize(fontSize)
        let dict = [NSFontAttributeName : font]
        
        
     let nsStr =  NSString(CString: self.text!.cStringUsingEncoding(NSUTF8StringEncoding)!,
                 encoding: NSUTF8StringEncoding)
        
      let mySize = nsStr?.boundingRectWithSize(CGSize(width:320, height: 0), options: .UsesLineFragmentOrigin, attributes: dict, context: nil).size
        
        
        
        return mySize!
    }

}


extension String {
    func boundingRectWithSize(fontSize:CGFloat) -> CGSize? {
        
        
        
       let font = UIFont.systemFontOfSize(fontSize)
        let dict = [NSFontAttributeName : font]
        
        
        let nsStr =  NSString(CString:self.cStringUsingEncoding(NSUTF8StringEncoding)!,
                              encoding: NSUTF8StringEncoding)
        
        let mySize = nsStr?.boundingRectWithSize(CGSize(width:320, height: 0), options: .UsesLineFragmentOrigin, attributes: dict, context: nil).size
        
        
        
        return mySize!
    }




}
