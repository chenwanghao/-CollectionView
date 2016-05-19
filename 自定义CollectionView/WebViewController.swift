//
//  WebViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/19.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    let webView:UIWebView = UIWebView()
    var urlStr:String?
    var loadProgress:LoadProgressAnimationView?
    
    convenience init(name anyName: String?, url urlStr: String?) {
        self.init(nibName:nil,bundle:nil)
        webView.loadRequest(NSURLRequest(URL: NSURL(string: urlStr!)!))
        self.urlStr = urlStr
        
    }
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.bounds
        view.addSubview(webView)
        loadProgress = LoadProgressAnimationView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(view.bounds), height: 5))
        webView.addSubview(loadProgress!)
        webView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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


extension WebViewController:UIWebViewDelegate{
    func webViewDidStartLoad(webView: UIWebView) {
        print("start")
        loadProgress?.startAnimationDidStart()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("end")
        loadProgress?.endAnimationDidEnd()
    }


}
