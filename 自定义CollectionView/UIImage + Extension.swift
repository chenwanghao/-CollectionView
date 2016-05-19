//
//  UIImage + Extension.swift
//  自定义CollectionView
//
//  Created by 王浩 on 16/5/18.
//  Copyright © 2016年 cc. All rights reserved.
//

import UIKit

extension UIImage {
    class func resizeImage(imageName:String) ->UIImage {
        return (UIImage(named: imageName)?.resizeImage())!
    }
    
    func resizeImage() -> UIImage {
       let leftCap :CGFloat = size.width * 0.5
        let topCap:CGFloat = size.height * 0.5
        return stretchableImageWithLeftCapWidth(Int(leftCap), topCapHeight: Int(topCap))

    }
    
    
//    + (UIImage *)resizeImage:(NSString *)imgName {
//    return [[UIImage imageNamed:imgName] resizeImage];
//    }
//    
//    - (UIImage *)resizeImage
//    {
//    CGFloat leftCap = self.size.width * 0.5f;
//    CGFloat topCap = self.size.height * 0.5f;
//    return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
//    }
//    
//    - (UIImage *)cut:(CGSize)sizeScale
//    {
//    CGFloat width = self.size.width * sizeScale.width;
//    CGFloat height = self.size.height * sizeScale.height;
//    CGFloat x = (self.size.width -  width) * 0.5;
//    CGFloat y = (self.size.height - height) * 0.5;
//    CGRect rect = CGRectMake(x, y, width, height);
//    CGImageRef ref = CGImageCreateWithImageInRect(self.CGImage, rect);
//    return [UIImage imageWithCGImage:ref];
//    }
//    
//    @end

}
