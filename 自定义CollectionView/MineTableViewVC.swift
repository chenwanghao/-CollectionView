//
//  MineTableViewVC.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/25.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class MineTableViewVC: UIViewController {
    var cellModel:[MineModel]?
     private let ID:String = "MineCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
               createUI()
    }
    
    
    
    func createUI(){
        //headerView
     let headerView = MineHeaderView(myframe: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        view.addSubview(headerView)
        
        
        //tableHeaderView
        
        //tableview 
     // let tableView = SuperMarketTableView(frame: CGRect(x:CGFloat(0), y: CGRectGetMaxY(headerView.frame), width: ScreenWidth, height: ScreenHeight - CGRectGetHeight(headerView.frame), style: .Grouped))
        
        let tableView = SuperMarketTableView(frame: CGRect(x: 0, y: CGRectGetMaxY(headerView.frame), width: ScreenWidth, height: ScreenHeight - CGRectGetMaxY(headerView.frame)), style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
//        LoadData.loadMineData { (data) in
//            
//        }
        
        tableView.tableHeaderView = MineTableHeaderView(frame: CGRect(x: 0, y: 0, width:ScreenWidth , height: 70))
        
        LoadData.loadMineModelData { (data) in
            self.cellModel = data
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

extension MineTableViewVC:UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 2
        }else if section == 1 {
            return 1
        }else{
            return 2
        }
        
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
      var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        
        cell?.accessoryType = .DisclosureIndicator

        
        if indexPath.section == 0 {
            
            
            cell?.textLabel?.text = cellModel![indexPath.row].title
            cell?.imageView?.image = UIImage(named: cellModel![indexPath.row].iconName!)
            return cell!
        }else if indexPath.section == 1 {
            
            cell?.textLabel?.text = cellModel![indexPath.row+2].title
            cell?.imageView?.image = UIImage(named: cellModel![indexPath.row+3].iconName!)
            return cell!

        
        } else {
            cell?.textLabel?.text = cellModel![indexPath.row+3].title
            cell?.imageView?.image = UIImage(named: cellModel![indexPath.row+3].iconName!)
            return cell!
        }
    }

}
