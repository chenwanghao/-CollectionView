//
//  BaseView.h
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/20.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView
typedef void(^MyBlock)(NSInteger);
@property(nonatomic,strong) MyBlock myBlock;
@end
