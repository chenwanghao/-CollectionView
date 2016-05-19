//
//  ADModel.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/29.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit
//{
//    "code": 0,
//    "msg": "success",
//    "reqid": "933552221c3e63423e081b932739dba7",
//    "data": {
//        "title": "",
//        "img_name": "http:\/\/img01.bqstatic.com\/upload\/activity\/2016011111271995.jpg",
//        "img_big_name": "http:\/\/img01.bqstatic.com\/upload\/activity\/2016011111271981.jpg",
//        "img_url": "",
//        "starttime": "1450409894",
//        "endtime": "1454255999"
//    }
//}


class ADModel:NSObject,DictModelProtocol {
    var code:Int = -1
    var msg:String?
    var reqid:String?
    var data:ADData?
    static func customClassMapping() -> [String : String]? {
        return ["data":"\(ADData.self)"]
    }
}


class ADData: NSObject {
    var title:String?
    var img_name:String?
    var img_big_name:String?
    var img_url:String?
    var starttime:String?
    var endtime:String?
    
    
}
