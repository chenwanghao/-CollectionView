//
//  MineTableHeaderView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/26.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class MineTableHeaderView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    private lazy var lineView1:UIView = {
      let line = UIView()
        line.backgroundColor = lineViewColor
        line.alpha = lineAlpha
        return line
    }()
    
    private lazy var lineView2:UIView = {
        let line = UIView()
        line.backgroundColor = lineViewColor
        line.alpha = lineAlpha
        return line
    }()
    
    
    private lazy var orderButton:MinedownTextButton = {
      let mineBtn = MinedownTextButton(type: .Custom)
        //mineBtn.backgroundColor = UIColor.greenColor()
        mineBtn.setImage(UIImage(named: "v2_my_order_icon"), forState: .Normal)
//        mineBtn.imageView?.contentMode = .Center
        mineBtn.setTitle("我的订单", forState: .Normal)
        mineBtn.titleLabel?.textAlignment = .Center
        return mineBtn
    }()
    
    private lazy var couponButton:MinedownTextButton = {
        let couponBtn = MinedownTextButton(type: .Custom)
        //couponBtn.backgroundColor = UIColor.blueColor()
        couponBtn.setImage(UIImage(named: "v2_my_coupon_icon"), forState: .Normal)
        
        couponBtn.setTitle("优惠劵", forState: .Normal)
        return couponBtn
    }()
    
    
    
    //v2_my_message_icon
    
    private lazy var messageButton:MinedownTextButton = {
        let messageBtn = MinedownTextButton(type: .Custom)
       // messageBtn.backgroundColor = UIColor.yellowColor()
        messageBtn.setImage(UIImage(named: "v2_my_message_icon"), forState: .Normal)
        
        messageBtn.setTitle("我的消息", forState: .Normal)
        return messageBtn
    }()


    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(orderButton)
        addSubview(lineView1)
        addSubview(couponButton)
        addSubview(lineView2)
        addSubview(messageButton)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        orderButton.frame = CGRect(x: 0, y: 0, width: mj_w/3, height: mj_h)
        lineView1.frame = CGRect(x: mj_w/3, y: 10, width: 1, height: mj_h-20)
        couponButton.frame = CGRect(x: mj_w/3+1, y: 0, width: mj_w/3, height: mj_h)
        lineView2.frame = CGRect(x: mj_w*2/3, y: 10, width: 1, height: mj_h-20)
        messageButton.frame = CGRect(x: mj_w*2/3+1, y: 0, width: mj_w/3, height: mj_h)
    }

}
