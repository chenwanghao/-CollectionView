//
//  SuperMarket.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/22.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class SuperMarket: NSObject,DictModelProtocol {
    var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: SuperMarketRecource?
    
    static func customClassMapping() -> [String : String]? {
        return ["data":"\(SuperMarketRecource.self)"]
    }
}


class SuperMarketRecource:NSObject,DictModelProtocol {
    var categories:[Categorie]?
    var products:Products?
    var trackid:String?
    
    static func customClassMapping() -> [String : String]? {
        return ["categories":"\(Categorie.self)","products":"\(Products.self)"]
    }
    
}


class Products: NSObject, DictModelProtocol {
    var a82: [Goods]?
    var a96: [Goods]?
    var a99: [Goods]?
    var a106: [Goods]?
    var a134: [Goods]?
    var a135: [Goods]?
    var a136: [Goods]?
    var a137: [Goods]?
    var a141: [Goods]?
    var a143: [Goods]?
    var a147: [Goods]?
    var a151: [Goods]?
    var a152: [Goods]?
    var a158: [Goods]?
    
    static func customClassMapping() -> [String : String]? {
        return ["a82" : "\(Goods.self)", "a96" : "\(Goods.self)", "a99" : "\(Goods.self)", "a106" : "\(Goods.self)", "a134" : "\(Goods.self)", "a135" : "\(Goods.self)", "a136" : "\(Goods.self)", "a141" : "\(Goods.self)", "a143" : "\(Goods.self)", "a147" : "\(Goods.self)", "a151" : "\(Goods.self)", "a152" : "\(Goods.self)", "a158" : "\(Goods.self)", "a137" : "\(Goods.self)"]
    }
}



class Categorie: NSObject {
    var id:String?
    var name:String?
    var sort:String?
}
