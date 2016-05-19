//
//  MainViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/5.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class MainViewController: AnimationViewController{
   
   
   private lazy var adimageView:UIImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
        addChildVC()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarDict = createContainView(tabBarData!)
        if let data = self.tabBarDict {
              tabBar(tabBar, didSelectItem: tabBar.items![0])
            removeOrginal()
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    var adImage:UIImage? {
        willSet{
            
            adimageView.transform = CGAffineTransformMakeScale(1, 1)
            weak var weakSelf = self
            UIView.animateWithDuration(2) {
            
                weakSelf!.adimageView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }
        }
    
    }
    
    
    func addChildVC(){
        
        addChildViewController(ViewController(),item: AnimationBarItem(title: "首页", image: UIImage(named: "v2_home"), selectedImage: UIImage(named: "v2_home_r"),tag:0))
       addChildViewController(SuperViewController(), item: AnimationBarItem(title: "闪电超市", image: UIImage(named: "v2_order"), selectedImage: UIImage(named: "v2_order_r"),tag:1))
        
        addChildViewController(UIViewController(), item:AnimationBarItem(title: "购物车", image: UIImage(named: "shopCart"), selectedImage: UIImage(named: "shopCart_r"), tag: 2))
        
        
        addChildViewController(MineTableViewVC(), item: AnimationBarItem(title1: "我的", image1: UIImage(named: "v2_my"), selectedImage1: UIImage(named: "v2_my_r"), tag1: 3))
        tabBarData?.append(["首页","v2_home","v2_home_r"])
        tabBarData?.append(["闪电超市","v2_order","v2_order_r"])
        tabBarData?.append(["购物车","shopCart","shopCart_r"])
        tabBarData?.append(["我的","v2_my","v2_my_r"])
        
    }
    
    func addChildViewController(vc:UIViewController,item:UITabBarItem) {
        vc.tabBarItem = item
        let naVC = NavigaViewController(rootViewController: vc)
        addChildViewController(naVC)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //    tabBarControllerAddChildViewController(HomeViewController(), title: "首页", imageName: "v2_home", selectedImageName: "v2_home_r", tag: 0)
    //    tabBarControllerAddChildViewController(SupermarketViewController(), title: "闪电超市", imageName: "v2_order", selectedImageName: "v2_order_r", tag: 1)
    //    tabBarControllerAddChildViewController(ShopCartViewController(), title: "购物车", imageName: "shopCart", selectedImageName: "shopCart", tag: 2)
    //    tabBarControllerAddChildViewController(MineViewController(), title: "我的", imageName: "v2_my", selectedImageName: "v2_my_r", tag: 3)
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if item.tag == 2 {
            presentViewController(ShopCartController(), animated: true, completion: nil)
        }
        super.tabBar(tabBar, didSelectItem: item)
    }
    
}
