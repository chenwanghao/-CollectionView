//
//  MineHeaderView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/25.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    private lazy var settingBtn:UIButton = {
        let settingBtn =  UIButton(type: .Custom)
        settingBtn.setBackgroundImage(UIImage(named: "v2_my_settings_icon"), forState: .Normal)
        return settingBtn
        
    }()
    
    private lazy var avatarImage:UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "v2_my_avatar")
        
        return iconImage
    }()
    
    private lazy var telLabel:UILabel = {
        let telLabel = UILabel()
        telLabel.text = "13243789563"
        telLabel.textColor = UIColor.grayColor()
        telLabel.textAlignment = .Center
        telLabel.font = UIFont.systemFontOfSize(20)
        return telLabel
    }()
    
    
    
    
    convenience init(myframe: CGRect) {
        self.init(frame:myframe)
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(patternImage: UIImage(named: "v2_my_avatar_bg")!)
        addSubview(avatarImage)
        addSubview(settingBtn)
        addSubview(telLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        settingBtn.frame = CGRect(x:ScreenWidth - 40, y: 20, width: 20, height: 20)
        avatarImage.center = CGPointMake(mj_w*0.5, mj_h*0.5)
        avatarImage.frame.size = CGSize(width: 50, height: 50)
        telLabel.center = CGPointMake(mj_w*0.5, CGRectGetMaxY(avatarImage.frame)+30)
        telLabel.mj_size = CGSize(width: ScreenWidth, height: 20)
    }
    
}
