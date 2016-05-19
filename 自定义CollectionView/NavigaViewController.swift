//
//  NavigaViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/17.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class NavigaViewController: UINavigationController {

     override class func initialize(){
          let navigationBar = UINavigationBar.appearance()
        // navigationBar.setBackgroundImage(UIImage.resizeImage("v2_my_avatar_bg"), forBarMetrics: .Default)
        navigationBar.barTintColor = UIColor.colorWithCustom(254, g: 213, b: 3)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

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

}
