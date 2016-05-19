//
//  LoadProgressAnimationView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/19.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class LoadProgressAnimationView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var viewWidth:CGFloat = 0
    
    override var frame: CGRect{
        willSet{
            if viewWidth == frame.size.width {
                hidden = true
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewWidth = frame.size.width
        backgroundColor = UIColor.orangeColor()
        
        self.frame.size.width = 0
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimationDidStart(){
        self.frame.size.width = 0
        hidden = false
        
        weak var selfWeak = self
        
        UIView.animateWithDuration(0.2, animations: {
            selfWeak?.frame.size.width = selfWeak!.viewWidth*0.6
            }) { (finish) in
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                    UIView.animateWithDuration(2, animations: { 
                        selfWeak?.frame.size.width = (selfWeak?.viewWidth)!*0.8
                    })
                })
        }
        
    }
    
    
    
    func endAnimationDidEnd(){
        weak var selfWeak = self

        UIView.animateWithDuration(0.1, animations: {
            selfWeak?.frame.size.width = (selfWeak?.viewWidth)!
            }) { (finish) in
                selfWeak!.hidden = true
        }
    }

}
