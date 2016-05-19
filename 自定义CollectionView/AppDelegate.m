//
//  AppDelegate.m
//  自定义CollectionView
//
//  Created by 王浩 on 16/4/14.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
 //   [UIViewController per]

    [NSThread sleepForTimeInterval:3];
    
    [self createNotification];
    
    
    
    [self  makeVisible];
    
    [self  loadADData];
    
    return YES;
}



-(void)loadADData{
    typeof(self) weakSelf = self;
    [LoadData loadADData:^(ADModel * _Nullable data) {
        //NSLog(data.data.img_name);
      ADViewController *vc = [[ADViewController alloc] init];
        vc.adImageStr = data.data.img_name;

        weakSelf.window.rootViewController = vc;
    }];

}


-(void)makeVisible{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
}


-(void)createNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adLoadFail:) name:ADLoadFail object:nil];
    [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(adLoadSuccess:) name:ADLoadSuccess object:nil];
    
}


-(void)adLoadFail:(NSNotification*)notify{
    
}


-(void)adLoadSuccess:(NSNotification*)notify{
    _window.rootViewController = [[MainViewController alloc] init];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





@end
