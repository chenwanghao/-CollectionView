//
//  ProductViewController.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/21.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    var superMarket:SuperMarket?{
        willSet{
            self.arrGoods = LoadData.searchCategoryMatchProducts(newValue!.data!)
        }
    }
    
    
    var arrGoods:[[Goods]]?{
        didSet{
        
        }
    
    }
    
    
     init(){
        super.init(nibName: nil, bundle: nil)
        let tableView = SuperMarketProductTableView(frame: CGRect(x: ScreenWidth*0.25, y: 44, width: ScreenWidth*0.75, height: ScreenHeight), style: .Plain)
        tableView.delegate = self
        tableView.sectionFooterHeight = 0
        tableView.dataSource = self
        tableView.rowHeight = 100
        view = tableView
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            
    }
    
    
    
}

extension ProductViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (superMarket?.data?.categories?.count)!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGoods![section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let productCell = ProductCell.tableView(tableView)
        productCell.goodsArr = arrGoods![indexPath.section][indexPath.row]
    
        return productCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let vc = ProductDetailViewController(goods:arrGoods![indexPath.section][indexPath.row] )
        vc.good = arrGoods![indexPath.section][indexPath.row]
         self.navigationController?.pushViewController(vc , animated: true)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 114
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return superMarket?.data?.categories![section].name
    }



}
