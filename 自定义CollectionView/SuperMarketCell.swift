//
//  SuperMarketCell.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/22.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class SuperMarketCell: UITableViewCell {
    private static let identify = "cell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func tableView(tableView:UITableView)->SuperMarketCell{
        var cell = (tableView.dequeueReusableCellWithIdentifier(identify)) as? SuperMarketCell
        if cell == nil {
            cell = SuperMarketCell(style: .Default, reuseIdentifier: identify)
        }
        
        return cell!
        
    }
    
    
    
    
     lazy var label:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.textColor = tabelLabelColor
        label.font = UIFont.systemFontOfSize(14)
        return label
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = tabelBGColor
        addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }



}
