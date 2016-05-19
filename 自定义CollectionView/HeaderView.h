//
//  HeaderView.h
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@interface HeaderView : BaseView<UIScrollViewDelegate>
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)HeaderResource * datas;
@property(nonatomic,weak)UIScrollView *scrollView;
@property(nonatomic,weak)UIPageControl *pageControl;
@property(nonatomic,weak)UILabel *label;


-(void)startTimer;
-(void)finishTimer;

@end
