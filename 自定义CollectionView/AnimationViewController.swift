//
//  AnimationViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/5.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class AnimationViewController: UITabBarController ,UITabBarControllerDelegate{
     var tabBarDict:[String : UIView ]?
     var tabBarData:[AnyObject]? = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func  createContainView(datas:[AnyObject]) ->[String : UIView]? {
        var containDict = [String : UIView]()
        
        guard let items = tabBar.items as? [AnimationBarItem] else{
            return containDict
        }
        
        for index in 0 ..< items.count {
            guard let tabView = createV(CGFloat(index),datas: datas[index] as! [AnyObject]) as? TabBarView else {
                continue
            }
            containDict["\(index)"] = tabView
            items[index].tag = index
            
        }
        
      
        
        //        let s:String? = "dede得得"
        //        if let ss = s  where 3 == 4 {
        //            print(ss)
        //        }
        //
        //        guard let sss = s else {
        //            print("计算机")
        //            return containDict
        //        }
        //        print("sss = \(sss)")
        //
        //        guard 2 < 0 else {
        //            print("傻逼")
        //            return containDict
        //        }
        
        return containDict
    }
    
    func createV(index:CGFloat,datas:[AnyObject]) -> UIView? {
        let H:CGFloat = tabBar.bounds.height
        let W:CGFloat = tabBar.bounds.width / 4
        
        let tabBarView: TabBarView = TabBarView(frame: CGRect(x: index * W, y: 0, width: W, height: H), normalImag: UIImage(named:datas[1] as! String)!, selectedImg:UIImage(named:datas[2] as! String)!, title: datas[0] as! String)
        // let recognizer = UITapGestureRecognizer(target: self, action: "tabBarItemClick:")
        //  tabBar.addGestureRecognizer(recognizer)
        
        
        tabBar.addSubview(tabBarView)
        
        return tabBarView
        
    }
    
    
    
    func removeOrginal(){
        for item in tabBar.items! {
            item.image = nil
            item.title = nil
        }
        
        
        
    }
    
    
    //  itemClick点击
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        
        
        for(key,value) in tabBarDict! {
            let tabView = value as? TabBarView
            guard key == "\(item.tag)" else {
                tabView?.showNormalImage()
                continue
            }
            tabView?.showSelectedImage()
            
     }
        
    }
    
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        let childArr = tabBarController.childViewControllers as NSArray
        let index = childArr.indexOfObject(viewController)
        if index == 2 {
            return false
        }
        
        
        
        return true
    }
    
    
}
