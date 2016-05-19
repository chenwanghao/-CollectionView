//
//  TabBarView.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/16.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    private lazy var selectedImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.hidden = true
        imageView.contentMode = .ScaleAspectFit
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        self.addSubview(imageView)
        return imageView
    }()
    
    
    private lazy var textLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(11)
        label.alpha = 0.5
        label.textAlignment = .Center

        self.addSubview(label)
        return label
    }()

    
    
    
      var selectedImage:UIImage?{
        didSet{
            self.selectedImageView.image = selectedImage
            
        }
    
    }
    
     var image:UIImage?{
        didSet{
            self.imageView.image = image
        }
    
    }
    
     var title:String?{
        willSet{
            self.textLabel.text = newValue
        }
    
    }
    
    
    func showSelectedImage() {
        selectedImageView.hidden = false
        imageView.hidden = true
        playImageViewAnimation()
        textLabel.alpha = 0.8
    }
    
    func showNormalImage(){
        selectedImageView.hidden = true
        imageView.hidden = false
        textLabel.alpha = 0.5

    }
    
    
    private func playImageViewAnimation(){
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = NSTimeInterval(0.5)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        selectedImageView.layer.addAnimation(bounceAnimation, forKey: "bounceAnimation")

    }
    
//    convenience init(frame: CGRect,normalImag:UIImage,selectedImg:UIImage,title:String) {
//        self.
//        self.selectedImage = selectedImg
//        self.image = normalImag
//        self.title = title
//    }
    
     init(frame: CGRect,normalImag:UIImage,selectedImg:UIImage,title:String) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
                
                self.selectedImageView.image = selectedImg
                self.imageView.image = normalImag
                self.textLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
  
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x:(ScreenWidth/4 - 25)*0.5, y:5, width: 25, height: 25)
        selectedImageView.frame = CGRect(x:(ScreenWidth/4 - 25)*0.5, y:5, width: 25, height: 25)
        textLabel.frame = CGRect(x: 0, y: 30, width: ScreenWidth/4 , height: 49 - 30)
        
    }
}
