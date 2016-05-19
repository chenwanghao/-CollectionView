//
//  BuyView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/28.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class BuyView: UIView {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    private lazy var subtractBtn:UIButton = {
        let sub = UIButton(type: .Custom)
        sub.setBackgroundImage(UIImage(named: "v2_reduce"), forState: .Normal)
        sub.addTarget(self, action: "subBtnClick:", forControlEvents: .TouchUpInside)
        return sub
    }()
    
    
    private lazy var plusBtn:UIButton = {
        let plus = UIButton(type: .Custom)
        plus.setBackgroundImage(UIImage(named: "v2_increase"), forState: .Normal)
        plus.addTarget(self, action: "plusBtnClick:", forControlEvents: .TouchUpInside)
        return plus
    }()
    
    
    func subBtnClick(btn:UIButton){
        goodNumber!--
        
        if goodNumber <= 0 {
            print("没有添加了...")
            numberLabel.text = nil
            return
        }
        good?.userBuyNumber = goodNumber!
        numberLabel.text = "\(goodNumber)"
        
    }
    
    func plusBtnClick(btn:UIButton){
        if goodNumber >= good?.number {
            print("库存不足")
            return
        }
        goodNumber!++
        
        good?.userBuyNumber = goodNumber!
        
        numberLabel.text = "\(goodNumber)"
        
    }
    
    private lazy var numberLabel:UILabel = {
        let numberL =  UILabel();
        numberL.textAlignment = .Center
        numberL.font = UIFont.systemFontOfSize(13)
        numberL.textColor = UIColor.grayColor()
        return numberL
    }()
    
    
    private lazy var shortSupplyLabel: UILabel = {
        let shortSupplyL = UILabel()
        shortSupplyL.textAlignment = .Center
        shortSupplyL.textColor = UIColor.redColor()
        shortSupplyL.font = UIFont.systemFontOfSize(14)
        return shortSupplyL
    }()
    
    
    var good:Goods?{
        didSet{
            
            //购买数量
            if good?.userBuyNumber <= 0 {
                subtractBtn.hidden = true
                numberLabel.hidden = true
                
                
            }else{
                subtractBtn.hidden = false
                numberLabel.hidden = false
                
            }
            
            if good?.number <= 0 {
                shortSupply()
            } else {
                notShortSupply()
            }
            
        }
        
    }
    
    
    
    private var goodNumber:Int?{
        willSet{
            if newValue > 0 {
                self.subtractBtn.hidden = false
                self.numberLabel.hidden = false
                //self.plusBtn.hidden = false
                
            } else {
                subtractBtn.hidden = true
                numberLabel.hidden = true
                //  plusBtn.hidden = false
            }
        }
    }
    
    
    private  func  shortSupply(){
        shortSupplyLabel.hidden = false
        plusBtn.hidden = true
    }
    
    
    private func notShortSupply(){
        shortSupplyLabel.hidden = true
        plusBtn.hidden = false
    }
    
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(plusBtn)
        addSubview(numberLabel)
        addSubview(subtractBtn)
        addSubview(shortSupplyLabel)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        plusBtn.frame = CGRect(x: 0, y: 0, width: mj_w/3, height: mj_h)
        numberLabel.frame = CGRect(x: mj_w/3, y: 0, width: mj_w/3, height: mj_h)
        subtractBtn.frame = CGRect(x: mj_w*2/3, y: 0, width: mj_w/3, height: mj_h)
        shortSupplyLabel.frame = bounds
        
    }
    
}
