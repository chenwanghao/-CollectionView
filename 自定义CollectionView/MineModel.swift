//
//  MineModel.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/26.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class MineModel: NSObject {
    var iconName:String?
    var title:String?
    
    class func createModel(dict:NSDictionary)->MineModel{
          let model = MineModel()
          model.iconName = dict["iconName"] as? String
          model.title = dict["title"] as? String
        return model
    }
}
