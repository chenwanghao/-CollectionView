//
//  CollectViewCell.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "CollectViewCell.h"

@implementation CollectViewCell



-(UIImageView *)backView{
    if (_backView == nil) {
        _backView = [[UIImageView alloc] init];
        
    }
    return _backView;
    
}

-(UIImageView *)picView{
    if (_picView == nil) {
        _picView = [[UIImageView alloc] init];
    }
    return _picView;
}


-(UIImageView *)buyOneView{
    if (_buyOneView == nil) {
        _buyOneView = [[UIImageView alloc] init];
        _buyOneView.image = [UIImage imageNamed:@"buyOne.png"];
    }
    
    return _buyOneView;
}

-(UIImageView *)fineView{
    if (_fineView == nil) {
        _fineView = [[UIImageView alloc] init];
        _fineView.image = [UIImage imageNamed:@"jingxuan.png"];
    }
    
    return _fineView;
    
}

-(UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    
    return _nameLabel;
}

-(UILabel *)specialLabel{
    if (_specialLabel == nil) {
        
        _specialLabel = [[UILabel alloc] init];
        _specialLabel.font = [UIFont systemFontOfSize:13];
    }
    return _specialLabel;
    
}






-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.backgroundColor = [UIColor purpleColor];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backView];
        [self addSubview:self.picView];
        [self addSubview:self.buyOneView];
        [self addSubview:self.fineView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.specialLabel];
    }
    
    return  self;
    
}

-(void)setGoods:(id)goods withType:(CollectViewCellType)type{
    
    _goods = goods;
    self.backView.hidden = !(type == CollectViewCellTypeBack);
    self.picView.hidden = (type == CollectViewCellTypeBack);
    self.buyOneView.hidden = (type == CollectViewCellTypeBack);
    self.fineView.hidden = (type == CollectViewCellTypeBack);
    self.nameLabel.hidden = (type == CollectViewCellTypeBack);
    self.specialLabel.hidden = (type == CollectViewCellTypeBack);
    if (type == CollectViewCellTypeBack) {
        
        [self.backView sd_setImageWithURL:[NSURL URLWithString:[goods img]] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
        if (self.discountView != nil) {
            [self.discountView removeFromSuperview];
        }
    }else {
        self.nameLabel.text = [goods name];
        [self.picView sd_setImageWithURL:[NSURL URLWithString:[goods img]] placeholderImage:[UIImage imageNamed:@"v2_placeholder_half_size"]];
        self.buyOneView.hidden = ![[goods pm_desc] isEqualToString:@"买一赠一"];
        self.fineView.hidden = !([goods is_xf] == 1);
        self.specialLabel.text = [goods specifics];
        if (self.discountView != nil) {
            [self.discountView removeFromSuperview];
        }
        self.discountView = [[DiscountView alloc] initWithOrigin:[goods market_price] discount:[goods price]] ;
        self.discountView.hidden = (type == CollectViewCellTypeBack);
        [self addSubview:self.discountView];
    }
}


-(CGFloat)cellH{
    if (_cellH<=0) {
        CGFloat width =SRCEEN_WIDTH;
        CGFloat w = (width - 20)*0.5;
        _cellH = w + 80;
    }
    return  _cellH;
}




-(void)layoutSubviews{
    [super layoutSubviews];
    self.backView.frame = self.bounds;
    self.picView.frame = CGRectMake(0, 0, self.mj_w, self.mj_w);
    self.nameLabel.frame = CGRectMake(5, self.mj_w, self.mj_w-10, 25);
    self.fineView.frame = CGRectMake(5, CGRectGetMaxY(self.nameLabel.frame), 40, 16);
    self.buyOneView.frame = CGRectMake(CGRectGetMaxX(self.fineView.frame)+5, self.fineView.mj_y, 40, 16);
    self.specialLabel.frame = CGRectMake(5, CGRectGetMaxY(self.fineView.frame), self.mj_w-10, 25);
    self.discountView.frame = CGRectMake(0, CGRectGetMaxY(self.specialLabel.frame), self.mj_w, self.cellH - CGRectGetMaxY(self.specialLabel.frame));
    
}
@end
