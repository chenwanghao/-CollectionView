//
//  AnimationBarItem.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/5.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class AnimationBarItem: UITabBarItem {
  convenience init(title: String?, image: UIImage?, selectedImage:UIImage? , tag:Int){
        self.init(title1: title,image1:image,selectedImage1: selectedImage,tag1: tag)
    }
    
     init(title1: String?, image1: UIImage?, selectedImage1:UIImage? , tag1:Int) {
       
        super.init()
        self.image = image1
        self.selectedImage = selectedImage1
        self.title = title1
        self.tag = tag1
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
