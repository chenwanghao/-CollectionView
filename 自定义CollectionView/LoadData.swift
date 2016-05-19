//
//  LoadData.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/19.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class LoadData: NSObject {
    class func loadUrlData(competion:(data:[String])->Void){
        let path = NSBundle.mainBundle().pathForResource("FocusURL", ofType: "plist")
        let array:[String] = NSArray(contentsOfFile: path!) as! [String]
        
        competion(data: array)
        
    }
    
    
    class func loadADData(competion:(data:ADModel?) ->Void){
        let path = NSBundle.mainBundle().pathForResource("AD", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            do{
                let dict = try (NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
              let modelTool = DictModelManager.sharedManager
              let data = modelTool.objectWithDictionary(dict, cls: ADModel.self) as! ADModel
                competion(data: data)
                
            }catch{
                
                print(error)
                
                competion(data: nil)
            }
        }
    }
    
    
    
    class func loadHeaderRecourceData(competion:(data:HeaderResource?)->Void){
        let path = NSBundle.mainBundle().pathForResource("首页焦点按钮", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            do{
                let dict = try (NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
                let modelTool = DictModelManager.sharedManager
                let data = modelTool.objectWithDictionary(dict, cls: HeaderResource.self) as! HeaderResource
                competion(data: data)
            }catch{
                print(error)
                competion(data: nil)
            }
        }
    }
    
    
    class func loadFreshData(competion:(data:FreshHot?)->Void){
        let path = NSBundle.mainBundle().pathForResource("首页新鲜热卖", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            do{
                let dict = try (NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
                let modelTool = DictModelManager.sharedManager
                let data = modelTool.objectWithDictionary(dict, cls: FreshHot.self) as! FreshHot
                competion(data: data)
            }catch{
                print(error)
                competion(data: nil)
            }
        }
        
    }
    
    class func loadMineData(competion:(data:MineData?)->Void) {
        let path = NSBundle.mainBundle().pathForResource("Mine", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            do{
                let dict = try (NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
                let modelTool = DictModelManager.sharedManager
                let data = modelTool.objectWithDictionary(dict, cls: MineData.self) as! MineData
                competion(data: data)
            }catch{
                print(error)
                competion(data: nil)
            }
        }
        
        
    }
    
    class func loadMineModelData(competion:(data:[MineModel]?)->Void) {
        var mines = [MineModel]()
        let path = NSBundle.mainBundle().pathForResource("MinePlist", ofType: "plist")
        let arr = NSArray(contentsOfFile: path!)
        for dic in arr! {
            mines.append(MineModel.createModel(dic as! NSDictionary))
        }
        
        competion(data: mines)
        
    }
    
    
    
    class func loadSuperMarketData(competion:(data:SuperMarket?)->Void){
        let path = NSBundle.mainBundle().pathForResource("supermarket", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            do{
                let dict = try (NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
                let modelTool = DictModelManager.sharedManager
                let data = modelTool.objectWithDictionary(dict, cls: SuperMarket.self) as! SuperMarket
                competion(data: data)
            }catch{
                print(error)
                competion(data: nil)
            }
        }
        
    }
    
    
    class func searchCategoryMatchProducts(supermarketResouce: SuperMarketRecource) -> [[Goods]]? {
        var arr = [[Goods]]()
        
        let products = supermarketResouce.products
        for cate in supermarketResouce.categories! {
            let goodsArr = products!.valueForKey(cate.id!) as! [Goods]
            arr.append(goodsArr)
        }
        return arr
    }
    
    
    
    
}
