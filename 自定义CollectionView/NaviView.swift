//
//  NaviView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/18.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class NaviView: UIView {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    
    private lazy var peiSong : UILabel = {
        let peisong = UILabel()
        peisong.layer.borderWidth = 0.5
        peisong.layer.borderColor = UIColor.blackColor().CGColor
        
        
        peisong.mj_origin = CGPoint(x: 0, y: (30 - 13)*0.5)
        peisong.font = UIFont.systemFontOfSize(13)
        
        return peisong
    }()
    
    
    
    private lazy var titleBtn:TitleButton = {
        let titleBtn = TitleButton()
        
        return titleBtn
    }()
    
    
    
    
    convenience init(frame:CGRect,title:String){
        self.init(frame:frame)
        titleBtn.setImage(UIImage(named: "icon_down_arrow"), forState: .Normal)
        titleBtn.setTitle(title, forState: .Normal)
        titleBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        self.userInteractionEnabled = true
        self.backgroundColor = UIColor.clearColor()
        addSubview(peiSong)
        addSubview(titleBtn)
        let recognizer = UITapGestureRecognizer(target: self, action: "navTitleViewClick:")
        self.addGestureRecognizer(recognizer)
       

    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
         let mySize = peiSong.boundingRectWithSize("派送至", fontSize: 11)
        peiSong.frame = CGRect(x: 0, y: (30 - (mySize?.height)! - 4)*0.5, width: (mySize?.width)! + 4, height: (mySize?.height)! + 4)
        titleBtn.frame = CGRect(x: CGRectGetMaxX(peiSong.frame), y: 0, width: bounds.width - CGRectGetMaxX(peiSong.frame) - 5, height: bounds.height)
    }
    
    
    
    func navTitleViewClick(recognizer:UITapGestureRecognizer){
        print("导航栏title被点击")
    }
    
    
}


class TitleButton: UIButton {
    var titleSize:CGSize? = nil
    
    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle(title, forState: state)
        userInteractionEnabled = false
        titleSize = title?.boundingRectWithSize(14)
        
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        
        return CGRect(x: 5, y: 0, width: titleSize!.width, height: contentRect.height)
    }
    
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x:titleSize!.width+10, y: 11.5, width: 13, height: 7)
    }
}
