//
//  MineData.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/26.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

//"code": 0,
//"msg": "Success",
//"reqid": "85a3960a774fc699c2650edfe75bceb2",
//"data": {
//    "has_new": 0,
//    "has_new_user": 0,
//    "availble_coupon_num": 1
//}


class MineData: NSObject,DictModelProtocol{
//    var code:Int?
//    var msg:String?
//    var reqid:String?
//    var data:MineItemData?
    
     var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: MineItemData?
    
    
    static func customClassMapping() -> [String : String]? {
        return ["data": "\(MineItemData.self)" ]
    }
}

class MineItemData:NSObject {
//    var has_new:Int?
//    var has_new_user:Int?
//    var availble_coupon_num:Int?
    var has_new: Int = -1
    var has_new_user: Int = -1
    var availble_coupon_num = 0
}
