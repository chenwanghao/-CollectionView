//
//  CollectionReusableView.h
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionReusableView : UICollectionReusableView
@property(nonatomic,strong)UILabel *label;
-(void)showLabel;
-(void)hideLabel;
@end
