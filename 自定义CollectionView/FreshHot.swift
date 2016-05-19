//
//  FreshHot.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/20.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class FreshHot: NSObject ,DictModelProtocol{
    var page:Int?
    var code:Int?
    var msg:String?
    var data:[Goods]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(Goods.self)"]
    }
    
}



class Goods: NSObject {
    //*************************商品模型默认属性**********************************
    /// 商品ID
    var id: String?
    /// 商品姓名
    var name: String?
    var brand_id: String?
    /// 超市价格
    var market_price: String?
    var cid: String?
    var category_id: String?
    /// 当前价格
    var partner_price: String?
    var brand_name: String?
    var pre_img: String?
    
    var pre_imgs: String?
    /// 参数
    var specifics: String?
    var product_id: String?
    var dealer_id: String?
    /// 当前价格
    var price: String?
    /// 库存
    var number: Int = -1
    /// 买一赠一
    var pm_desc: String?
    var had_pm: Int = -1
    /// urlStr
    var img: String?
    /// 是不是精选 0 : 不是, 1 : 是
    var is_xf: Int = 0
    
    //*************************商品模型辅助属性**********************************
    // 记录用户对商品添加次数
    var userBuyNumber: Int = 0
}
