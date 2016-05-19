//
//  ViewController.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "CollectViewCell.h"
#import "CollectionReusableView.h"
#import "MJRefresh.h"
#import "GifHeader.h"
#import "UIView+MJExtension.h"
#import "HotView.h"

@interface ViewController ()
@property(nonatomic,strong) NSMutableArray *array;
@property(nonatomic,strong) HeaderView *headerView;
@property(nonatomic,weak) HotView *hotView;
@property(nonatomic,weak) UICollectionView *collectionView;
@property(nonatomic,strong) FreshHot *freshHot;
@property(nonatomic,strong) HeaderResource *headerData;
@property(nonatomic,assign)Boolean isAnimation;
@property(nonatomic,assign)CGFloat lastContentOffset;
@end

@implementation ViewController


-(NSMutableArray *)array{
    if (_array==nil) {
        _array = [NSMutableArray arrayWithObjects:@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png",nil];
    }
    
    return _array;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // [self.view addSubview:header];
 
    [self createUI];
    [self createNaviTheme];
    
}




-(void)createUI{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.view.frame),30);
    flowLayout.footerReferenceSize = CGSizeMake(CGRectGetWidth(self.view.frame), 50);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    GifHeader *header=[GifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    header.offsetY = 280;
    //    header.gifView.frame = CGRectMake(0, 0, 100, 100);
    // header.frame =  CGRectMake(0, -170, 100, 100);
    
    collectionView.mj_header = header;
    collectionView.contentInset = UIEdgeInsetsMake(270, 0, 0, 0);
    //    collectionView.contentOffset = CGPointMake(0, -170);
    
    _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0,-270,CGRectGetWidth(self.view.frame), 150)];
    typeof(self) weakSelf = self;
    _headerView.myBlock = ^(NSInteger x){
        //        NSLog(@"block:index==%d",x);
        [weakSelf scrollViewImageClick:x];
    };
    
    // _headerView.datas = self.array;
    
    HotView *hotView =[[HotView alloc] initWithFrame:CGRectMake(0, -100, CGRectGetWidth(self.view.bounds), 100) subImageCount:4];
    _hotView = hotView;
    [collectionView addSubview:hotView];
    [LoadData loadHeaderRecourceData:^(HeaderResource * _Nullable data) {
        _headerView.datas = data;
        _headerData = data;
        hotView.icons = data.data.icons;
    }];
    
    hotView.myBlock = ^(NSInteger x){
        [weakSelf scrollViewHotImageClick:x];
    };
    
    
    [LoadData loadFreshData:^(FreshHot * _Nullable data) {
        _freshHot = data;
    }];
    
    _collectionView = collectionView;
    
    [collectionView addSubview:_headerView];
    
    // collectionView.mj_header = [mjrefresh]
    
    //    let refreshHeadView = LFBRefreshHeader(refreshingTarget: self, refreshingAction: "headRefresh")
    //    refreshHeadView.gifView?.frame = CGRectMake(0, 30, 100, 100)
    //    collectionView.mj_header = refreshHeadView
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[CollectViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"header"];
    



}


-(void)createNaviTheme{
    
       //MinedownTextButton *leftBtn = [MinedownTextButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem * leftMarginBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftMarginBtn.width = -15;

    NaviItemView * leftBtn = [NaviItemView sharenaviViewWithImageAndTitle:@"icon_black_scancode" titleName:@"扫一扫" tag:0];
    //tle:@"icon_black_scancode" titleName:@"扫一扫"];
    
    UIBarButtonItem *leftBarBtn  =[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItems = @[ leftMarginBtn ,leftBarBtn];
    
    
    
    
    
    
    

    
      NaviItemView * rightBtn = [NaviItemView sharenaviViewWithImageAndTitle:@"icon_search" titleName:@"搜索" tag:1];
    //e:@"icon_search" titleName:@"搜索"
     UIBarButtonItem *rightBarBtn  =[[UIBarButtonItem alloc] initWithCustomView:rightBtn];
     self.navigationItem.rightBarButtonItems =  @[leftMarginBtn,rightBarBtn];
//
    
    //导航栏主视图
   NaviView * titleView = [[NaviView alloc] initWithFrame:CGRectMake(0, 0, 100, 30) title:@"人民大会堂"];
    titleView.backgroundColor = [UIColor clearColor];

    self.navigationItem.titleView = titleView;

}


-(void)headRefresh{
    NSLog(@"headRefresh");
    [NSThread sleepForTimeInterval:3];
    [_collectionView.mj_header endRefreshing];
    
}


-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"亮了");
    [super viewDidAppear:animated];
    if (self.array.count>1) {
        [_headerView startTimer];
    }
    
}


-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"熄灭");
    [super viewWillDisappear:animated];
    if (self.array.count>1) {
        [_headerView finishTimer];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark -UIScrollViewDelegate 代理

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [_headerView finishTimer];
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_headerView startTimer];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.isAnimation =  (scrollView.contentOffset.y>self.lastContentOffset);
    self.lastContentOffset = scrollView.contentOffset.y;
}





#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource 代理


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section==0) {
        
        return CGSizeZero;
    }else{
        return CGSizeMake(self.view.frame.size.width, 60);
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeZero;
    }else{
        return CGSizeMake(self.view.frame.size.width, 30);
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_headerData.data.activities.count<=0||_freshHot.data.count<=0) {
        return 0;
    }
    
    if (section==0) {
        return _headerData.data.activities.count;
    }else if(section ==1){
        return  _freshHot.data.count;
    }
    
    return 0;
    
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (_headerData.data.activities.count<=0||_freshHot.data.count<=0) {
        return 0;
    }
    
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section==0) {
        //[cell.imageVIew sd_setImageWithURL:[NSURL URLWithString:[_headerData.data.activities[indexPath.item] img] ] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
        // cell.imageVIew.image = [UIImage imageNamed:@"cat.png"];
      //  cell.label.text = [NSString stringWithFormat:@"cat%ld",(long)indexPath.item];
        [cell setGoods:_headerData.data.activities[indexPath.item] withType:CollectViewCellTypeBack];
    }else if(indexPath.section ==1){
        [cell setGoods:_freshHot.data[indexPath.item] withType:CollectViewCellSqure];
       // [cell.imageVIew sd_setImageWithURL:[NSURL URLWithString:[_freshHot.data[indexPath.item] img]] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
        // cell.imageVIew.image = [UIImage imageNamed:@"cat.png"];
       // cell.label.text = [NSString stringWithFormat:@"cat%ld",(long)indexPath.item];
        
        
    }
   // [cell.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
   // [cell.sureBtn setTitle:@"点击" forState:UIControlStateHighlighted];
    //cell.backgroundColor =[UIColor redColor];
    // NSLog(@"%@",NSStringFromCGRect(cell.bounds));
    return  cell;
}


-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isAnimation) {
        
        [self startanimation:cell];
    }
    
}


-(void)startanimation:(UICollectionViewCell*)cell{
    cell.transform = CGAffineTransformMakeTranslation(0, 100);
    
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // NSLog(@"第%ld被选中..",(long)indexPath.item);
   // SuperViewController *VC = [[SuperViewController alloc] init];
    //[self presentViewController:VC animated:YES completion:nil];
    if (indexPath.section == 0) {
        
        WebViewController *vc= [[WebViewController alloc] initWithName:@"xixi" url:[_headerData.data.activities[indexPath.item] customURL]];
        [self presentViewController:vc animated:YES completion:nil];
    }else {
        ProductDetailViewController *vc = [[ProductDetailViewController alloc] initWithGoods:_freshHot.data[indexPath.item] ];
        vc.good = _freshHot.data[indexPath.item];
        
        [self presentViewController:vc animated:YES completion:nil ];
    
    }
    
    
    
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return  YES;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    
    if (indexPath.section ==1) {
        
        CGFloat width =SRCEEN_WIDTH;
        
        CGFloat w = (width - 20)*0.5;
        CGFloat h = w + 80;
        
        return  CGSizeMake(w, h);
    }else{
        CGFloat width =SRCEEN_WIDTH;
        
        CGFloat w = width - 20;
        CGFloat h = 150;
        
        return  CGSizeMake(w, h);
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}





-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    // NSLog(@"%@,%d",kind,indexPath.section);
    // UICollectionReusableView *reusableView =[[UICollectionReusableView alloc] init];
    //[reusableView addSubview:_headerView];
    CollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    //    reusableView.backgroundColor = [UIColor grayColor];
    //        if (indexPath.section==0) {
    //        [reusableView hideLabel];
    //    }else {
    //        [reusableView showLabel];
    //    }
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        reusableView.label.text =@"热门商品";
    }else{
        reusableView.label.text = @"底部";
    }
    
    
    //    if ([kind isEqualToString:UICollectionElementKindSectionHeader]&&indexPath.section==1) {
    //        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    //        [reusableView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    //
    //        reusableView.backgroundColor = [UIColor grayColor];
    //        [reusableView setFrame:CGRectMake(0,0, self.view.bounds.size.width,20)];
    //    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]&&indexPath.section==1){
    //         reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
    //        [reusableView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    //    }else{
    //
    //    }
    
    
    
    return reusableView;
}


-(void)scrollViewImageClick:(NSInteger)index{
    // NSLog(@"%d",index);
    
    [LoadData loadUrlData:^(NSArray<NSString *> * _Nonnull data) {
        
        WebViewController *webVC = [[WebViewController alloc] initWithName:@"几级"  url:data[index]];
        [self presentViewController:webVC animated:YES completion:nil];
        
    }];
}


-(void)scrollViewHotImageClick:(NSInteger)index{
    // NSLog(@"%d",index);
    
    //[LoadData loadUrlData:^(NSArray<NSString *> * _Nonnull data) {
    
    WebViewController *webVC = [[WebViewController alloc] initWithName:@"几级"  url:[self.hotView.icons[index] customURL]];
    [self presentViewController:webVC animated:YES completion:nil];
    
    // }];
}





@end
