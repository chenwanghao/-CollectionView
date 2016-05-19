//
//  SuperViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/21.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {
    var superMarket:SuperMarket?
    var superTableView:SuperMarketTableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        
        createSubVC()
        // Do any additional setup after loading the view.
    }
//    init() {
//        super.init()
//    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func creatUI(){
    superTableView = SuperMarketTableView(frame: CGRect(x: 0, y: 0, width:CGRectGetWidth(view.bounds)*0.25, height: CGRectGetHeight(view.bounds)), style: .Plain)
        superTableView?.delegate = self
        superTableView?.dataSource = self
        view.addSubview(superTableView!)
        
    }
    
    
    func createSubVC(){
       let productVC = ProductViewController()
        addChildViewController(productVC)
        view.addSubview(productVC.view)
        LoadData.loadSuperMarketData { (data) in
            self.superMarket = data
            productVC.superMarket = data
           // self.superTableView?.reloadData()
        }

        
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


extension SuperViewController :UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (superMarket?.data?.categories?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = SuperMarketCell.tableView(tableView)
        cell.label.text = superMarket?.data?.categories![indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    
    
}
