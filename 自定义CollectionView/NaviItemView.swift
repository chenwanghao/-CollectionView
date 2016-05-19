//
//  NaviItemView.swift
//  自定义CollectionView
//
//  Created by allen on 16/5/18.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class NaviItemView: UIView {
    enum NaviItemViewType:Int{
        // enumeration definition goes here
        case NaviItemViewTypeLeft = 0
        case NaviItemViewTypeRight = 1
    }
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    public class func sharenaviViewWithImageAndTitle(imageName:String , titleName:String,tag:Int) -> NaviItemView {
      let itemView = NSBundle.mainBundle().loadNibNamed("NaviItemView", owner: nil, options: nil).last as! NaviItemView
        itemView.userInteractionEnabled = true
        itemView.tag = tag
       let recognizer = UITapGestureRecognizer(target: itemView, action: "itemClick:")
        itemView.addGestureRecognizer(recognizer)
        itemView.imageView.image = UIImage(named: imageName)
        itemView.label.text = titleName
      return itemView
    }
    
    
    func itemClick(recognizer:UITapGestureRecognizer){
        let id = recognizer.view?.tag
        switch id! {
        case NaviItemViewType.NaviItemViewTypeLeft.rawValue:
            print(0)
        case NaviItemViewType.NaviItemViewTypeRight.rawValue:
            print(1)
        default:
            print("其他")
        }
    }

}
