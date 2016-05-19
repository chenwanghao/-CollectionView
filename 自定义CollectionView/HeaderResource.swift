//
//  HeaderResource.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/20.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class HeaderResource: NSObject,DictModelProtocol {
    var msg:String?
    var reqid:String?
    var data:HeaderData?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(HeaderData.self)"]
    }
    
}

class HeaderData: NSObject,DictModelProtocol {
    var focus:[Activities]?
    var icons:[Activities]?
    var activities:[Activities]?
    
    static func customClassMapping() -> [String : String]? {
        return ["focus" : "\(Activities.self)","icons" : "\(Activities.self)","activities" : "\(Activities.self)"]
    }
}

class Activities: NSObject {
    var id:String?
    var name:String?
    var img:String?
    var topimg:String?
    var jptype:String?
    var trackid:String?
    var mimg:String?
    var customURL:String?
    
    
}
