//
//  ProductDetailViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/28.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var scrollView:UIScrollView?
    var picImageView:UIImageView = UIImageView()
    var nameView:UIView = UIView()
    var promotion:UIView = UIView()
    var contentView:UIView = UIView()
    var bottomImageView:UIImageView?
    var tipView:UIView = UIView()
    var brandNameLabel:UILabel?
    var specificNameLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpSubViewFrame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpSubViewFrame(){
        //顶部主图
        picImageView.frame = CGRect(x: 0, y: 0, width: view.mj_w, height: view.mj_w)
        buildLine(addView: picImageView)
        
        //产品名称
        nameView.frame = CGRect(x: 0, y: CGRectGetMaxY(picImageView.frame), width: view.mj_w, height: 60)
       let titleLabel = UILabel(frame: CGRect(x: 5, y: 0, width: view.mj_w-10, height: 30))
        titleLabel.font = UIFont.systemFontOfSize(13)
        nameView.addSubview(titleLabel)
        buildLine(addView: nameView)
       
        //折扣活动
        promotion.frame = CGRect(x: 0, y: CGRectGetMaxY(nameView.frame), width: view.mj_w, height: 40)
        let buyOne = UIImageView()
        buyOne.image = UIImage(named: "zengsong.png")
        buyOne.frame = CGRect(x: 5, y: 11, width: 38, height: 18)
        promotion.addSubview(buyOne)
        let descriptionLabel = UILabel()
        descriptionLabel.text = "买一赠一(赠品有限,赠完为止)"
        descriptionLabel.font = UIFont.systemFontOfSize(13)
        descriptionLabel.frame = CGRect(x: CGRectGetMaxX(buyOne.frame)+5, y: 11, width: view.mj_w - CGRectGetMaxX(buyOne.frame)-5, height: 18)
        promotion.addSubview(descriptionLabel)
        buildLine(addView: promotion)
        
        //简介
        contentView.frame = CGRect(x: 0, y: CGRectGetMaxY(promotion.frame), width: view.mj_w, height: 120)
        
        //
        let brandLabel = UILabel()
        brandLabel.text = "品    牌"
        setUplabelLayout(label: brandLabel)
        brandLabel.mj_y = 0
        brandNameLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(brandLabel.frame)+15, y: 0, width: view.mj_w - CGRectGetMaxX(brandLabel.frame)-15, height: 40))
        brandNameLabel!.textColor = UIColor.blackColor()
        brandNameLabel!.font = UIFont.systemFontOfSize(13)
        contentView.addSubview(brandLabel)
        contentView.addSubview(brandNameLabel!)
        buildLine(addView: contentView, height: 39)
        //
        let specificLabel = UILabel()
        specificLabel.text = "产品规格"
        setUplabelLayout(label: specificLabel)
        specificLabel.mj_y = 40
        specificNameLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(specificLabel.frame)+15, y: 40, width: view.mj_w - CGRectGetMaxX(specificLabel.frame)-15, height: 40))
        specificNameLabel!.textColor = UIColor.blackColor()
        specificNameLabel!.font = UIFont.systemFontOfSize(13)
        contentView.addSubview(specificLabel)
        contentView.addSubview(specificNameLabel!)
        buildLine(addView: contentView, height: 79)
        //
        let picTextLabel = UILabel()
        picTextLabel.text = "图文详情"
        setUplabelLayout(label: picTextLabel)
        picTextLabel.mj_y = 80
        let picTextNameLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(picTextLabel.frame)+5, y: 0, width: view.mj_w - CGRectGetMaxX(picTextLabel.frame)-5, height: 40))
        picTextNameLabel.textColor = UIColor.blackColor()
        picTextNameLabel.font = UIFont.systemFontOfSize(13)
        contentView.addSubview(picTextLabel)
        contentView.addSubview(picTextNameLabel)
       
        
        //提示
        tipView.frame = CGRect(x: 0, y: CGRectGetMaxY(contentView.frame), width: view.mj_w, height: 80)
        tipView.backgroundColor = UIColor.whiteColor()
        let tipLabel = UILabel()
        tipLabel.text = "温馨提醒:"
        tipLabel.font = UIFont.systemFontOfSize(13)
        tipLabel.sizeToFit()
        tipLabel.mj_x = 5
        tipView.addSubview(tipLabel)
        
        let tipContentLabel = UILabel()
        tipContentLabel.text = "商品签收后, 如有问题请您在24小时内联系4008484842,并将商品及包装保留好,拍照发给客服"
        
        tipContentLabel.font = UIFont.systemFontOfSize(11)
        tipContentLabel.textColor = UIColor.redColor()
        tipContentLabel.numberOfLines = 2
      
        tipContentLabel.mj_x = 5
        tipContentLabel.mj_y = CGRectGetMaxY(tipLabel.frame) + 5
        tipContentLabel.mj_w = view.mj_w - 10
        tipContentLabel.mj_h = tipView.mj_h - (CGRectGetMaxY(tipLabel.frame) + 5)
          tipContentLabel.sizeToFit()
        tipView.addSubview(tipContentLabel)
        

        

        
        
        
        //底部图片
        bottomImageView = UIImageView(image: UIImage(named: "aaaa"))
        
        let scale =   320 / ScreenWidth
        let bottomH = (bottomImageView?.mj_h)! / scale
        bottomImageView?.frame = CGRect(x: 0, y: CGRectGetMaxY(tipView.frame), width: view.mj_w, height: bottomH)
        
        //scrollView
        scrollView?.contentSize = CGSize(width: view.mj_w, height: CGRectGetMaxY((bottomImageView?.frame)!)+50)
        
        
        //添加子控件
        scrollView!.addSubview(picImageView)
        scrollView!.addSubview(nameView)
        scrollView?.addSubview(promotion)
        scrollView?.addSubview(contentView)
        scrollView?.addSubview(tipView)
        scrollView?.addSubview(bottomImageView!)
        
        
        
        
        
    }
    
    
    func buildLine(addView view:UIView){
      let lineView = UIView(frame: CGRect(x: 0, y: view.mj_h - 1, width: view.mj_w, height: 1))
        lineView.backgroundColor = UIColor.blackColor()
        lineView.alpha = 0.1
        view.addSubview(lineView)
        
    }
    
    
    func buildLine(addView view:UIView , height h:CGFloat){
        let lineView = UIView(frame: CGRect(x: 0, y: h, width: view.mj_w, height: 1))
        lineView.backgroundColor = UIColor.blackColor()
        lineView.alpha = 0.1
        view.addSubview(lineView)
    }
    
    
    func setUplabelLayout(label labelName:UILabel){
        labelName.textColor = UIColor.grayColor()
        labelName.font = UIFont.systemFontOfSize(13)
        
        labelName.sizeToFit()
        labelName.mj_h = 40
        labelName.mj_x = 5
    
    
    }
    
    
    
    convenience init(goods:Goods){
        self.init()
        
       
        
    }
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        scrollView = UIScrollView(frame:CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        scrollView?.bounces = false
        scrollView?.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        
        
        
        view.addSubview(scrollView!)
    }
    
    var good:Goods?{
                
        didSet{
           picImageView.sd_setImageWithURL(NSURL(string: (good?.img)!), placeholderImage: UIImage(named: "v2_placeholder_full_size"))
            (nameView.subviews[0] as! UILabel).text = good?.name
            
            if good?.pm_desc == "买一赠一" {
                promotion.hidden = false
            
            }else{
                promotion.hidden = true
                contentView.mj_y -= 40
                
            }
            
          let priceView = DiscountView(origin:good!.market_price, discount: good!.price)
            priceView.frame = CGRect(x: 0, y: 30, width: view.mj_w, height: 20)
            nameView.addSubview(priceView)
            brandNameLabel?.text = good?.brand_name
            specificNameLabel?.text = good?.specifics
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
