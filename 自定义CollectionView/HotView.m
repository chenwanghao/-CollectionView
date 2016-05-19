//
//  HotView.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HotView.h"

@implementation HotView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame subImageCount:(NSInteger)count{
    self = [super initWithFrame:frame];
    
    if (self) {
       CGFloat width= CGRectGetWidth(frame);
        CGFloat subImageW = width/count;
        CGFloat subImageH = CGRectGetHeight(frame);
//        for (int i =0 ; i<count; i++) {
//            CGFloat subImageX = subImageW*i;
//            CGFloat subImageY = 0;
//            UIImageView *imageView = [[UIImageView alloc] init];
//            imageView.image = [UIImage imageNamed:@"cat.png"];
//            imageView.frame = CGRectMake(subImageX, subImageY, subImageW, subImageH);
//            [self addSubview:imageView];
//        }
        
    }
    
    return  self;

}

-(void)setIcons:(NSArray *)icons{
    _icons = icons;
    CGFloat width= CGRectGetWidth(self.frame);
    CGFloat subImageW = width/icons.count;
    CGFloat subImageH = CGRectGetHeight(self.frame);
    for (int i = 0; i<icons.count; i++) {
        CGFloat subImageX = subImageW*i;
                    CGFloat subImageY = 0;
                    UIImageView *imageView = [[UIImageView alloc] init];
                   // imageView.image = [UIImage imageNamed:[icons[i] img]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
                    imageView.frame = CGRectMake(subImageX, subImageY, subImageW, subImageH);
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
        [imageView addGestureRecognizer:tap];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[icons[i] img]] placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
                    [self addSubview:imageView];
    }

}





@end
