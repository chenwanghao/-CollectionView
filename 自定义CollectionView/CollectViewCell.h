//
//  CollectViewCell.h
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    CollectViewCellTypeBack,
    CollectViewCellSqure
}CollectViewCellType;


@interface CollectViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView * backView;
@property(nonatomic,strong)UIImageView * picView;
@property(nonatomic,strong)UIImageView * buyOneView;
@property(nonatomic,strong)UIImageView * fineView;
@property(nonatomic,strong)UILabel * nameLabel;
@property(nonatomic,strong)UILabel *specialLabel;
@property(nonatomic,strong)DiscountView * discountView;
@property(nonatomic,strong)id  goods;
@property(nonatomic,assign)CGFloat cellH;
-(void)setGoods:(id)goods withType:(CollectViewCellType)type;
@end
