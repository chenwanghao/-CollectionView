//
//  BaseView.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/20.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)imageViewClick:(UITapGestureRecognizer*)tap{
      NSLog(@"%ld",tap.view.tag);
    if (_myBlock) {
        _myBlock(tap.view.tag);
    }
}


@end
