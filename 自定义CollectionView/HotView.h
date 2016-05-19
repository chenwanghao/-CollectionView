//
//  HotView.h
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@interface HotView : BaseView
@property(nonatomic,strong)NSArray * icons;

-(instancetype)initWithFrame:(CGRect)frame subImageCount:(NSInteger)count;
@end
