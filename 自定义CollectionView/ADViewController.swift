//
//  ADViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/29.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class ADViewController: UIViewController {
    var adImageView:UIImageView = {
        let imageView = UIImageView(frame: ScreenBounds)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    var adImageStr:String?{
        didSet{
            adImageView.sd_setImageWithURL(NSURL(string: adImageStr!), placeholderImage: UIImage(named: "iphone6s")) { (image, error, _, _) in
                self.view.addSubview(self.adImageView)
                if error != nil {
                    notificationCenter.postNotificationName(ADLoadFail, object: self, userInfo: nil)
                    
                    return
                }
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
                          notificationCenter.postNotificationName(ADLoadSuccess, object: self, userInfo: nil)
                    self.adImageView.removeFromSuperview()
                }
            }
            
        }
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
