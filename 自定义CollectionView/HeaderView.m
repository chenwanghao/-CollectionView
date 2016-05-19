//
//  HeaderView.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.backgroundColor = [UIColor greenColor];
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = YES;
        scrollView.showsVerticalScrollIndicator = YES;
        scrollView.pagingEnabled = YES;
        scrollView.canCancelContentTouches = NO;
        scrollView.alwaysBounceHorizontal = YES;
        _scrollView = scrollView;
        //scrollView.contentSize = CGSizeMake(3000, CGRectGetHeight(self.frame));
        [self addSubview:scrollView];
        
        
        UIView *containView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bounds) - 20, CGRectGetWidth(self.frame),20)];
        [self addSubview:containView];
        containView.backgroundColor = [UIColor orangeColor];
        
        UIPageControl * pageControl = [[UIPageControl alloc] init];
        pageControl.frame = CGRectMake(10, 0, CGRectGetWidth(containView.frame)-200, 20);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(containView.frame)-50, 0, 40, CGRectGetHeight(containView.frame))];
        //label.backgroundColor = [UIColor redColor];
        _label = label;
        [containView addSubview:label];
        pageControl.currentPage = 0;
        pageControl.pageIndicatorTintColor = [UIColor blueColor];
        _pageControl = pageControl;
        [containView addSubview:pageControl];
       // pageControl.numberOfPages = 6;
        
//        _timer= [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(doSomeTing:) userInfo:nil repeats:YES];
        _timer =[NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(doSomeTing:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [self finishTimer];
    }
    
    return self;

}



-(void)setDatas:(HeaderResource *)datas{
    _datas =datas;
    _scrollView.contentSize =CGSizeMake(datas.data.focus.count*CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
    [datas.data.focus enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(idx*CGRectGetWidth(_scrollView.frame), 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame))];
        //imageview.image = [UIImage imageNamed:obj];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[obj img]]
                                        placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
      //  imageview.contentMode = UIViewContentModeScaleAspectFill;
        imageview.tag = idx;
        imageview.userInteractionEnabled = YES;
        
       // NSLog(@"鸡巴%@",NSStringFromCGRect(imageview.frame));
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
        [imageview addGestureRecognizer:tap];
        [_scrollView addSubview:imageview];
        
        
    }];
    _pageControl.numberOfPages =datas.data.focus.count;
    _label.text = [NSString stringWithFormat:@"%ld/%lu",(long)_pageControl.currentPage+1,(unsigned long)datas.data.focus.count];
    

}




-(void)doSomeTing:(id)ting{
    
   NSInteger pageCount= _pageControl.currentPage;
    pageCount++;
    if (pageCount>=_pageControl.numberOfPages) {
        pageCount = 0;
    }
    
    [_scrollView  setContentOffset:CGPointMake(CGRectGetWidth(_scrollView.frame)*pageCount, 0) animated:YES];
     _label.text = [NSString stringWithFormat:@"%ld/%lu",(long)_pageControl.currentPage+1,(unsigned long)_pageControl.numberOfPages];
   // _pageControl.currentPage =pageCount;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    double v= fabs(_scrollView.contentOffset.x)/_scrollView.frame.size.width;
    _pageControl.currentPage = v;
     _label.text = [NSString stringWithFormat:@"%ld/%lu",(long)_pageControl.currentPage+1,(unsigned long)_pageControl.numberOfPages];
  //  NSLog(@"....%f",v);
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
   
}




-(void)startTimer{
    [_timer setFireDate:[NSDate distantPast]];

}

-(void)finishTimer{
    [_timer setFireDate:[NSDate distantFuture]];
}

@end
