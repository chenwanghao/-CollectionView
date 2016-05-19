//
//  CollectionReusableView.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    _label = [[UILabel alloc] initWithFrame:self.bounds];
    //_label.backgroundColor =[UIColor redColor];
    _label.textColor = [UIColor darkGrayColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:16];
   
    [self addSubview:_label];

    if (self) {
           }
    
    return self;
}

-(void)showLabel{
    _label.hidden = NO;
}

-(void)hideLabel{
    _label.hidden = YES;
}


@end
