//
//  AppDelegate.m
//  Report
//
//  Created by tcx on 2017/11/16.
//  Copyright © 2017年 tcx. All rights reserved.
//

#import "AppDelegate.h"
#import <WXApi.h>
#import "WTPayManager.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    ViewController *vc = [[ViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    self.window.rootViewController = nav;
         [self setTabbarController];
    
    return YES;

}


 
 - (void)setTabbarController {
 //1.创建标签控制器
 UITabBarController *tab = [[UITabBarController alloc]init];
 
 //2.创建相应的子控制器（viewcontroller）
 
 FirstViewController *firstVC = [FirstViewController new];
 [self addChildVc:firstVC title:@"报志愿" image:@"icon_home_tab_one_gray" selectedImage:@"icon_home_tab_one_blue"];
 UINavigationController *firstNC = [[UINavigationController alloc] initWithRootViewController:firstVC];
 
 ThreeViewController *threeVC = [ThreeViewController new];
 [self addChildVc:threeVC title:@"高考攻略" image:@"icon_home_tab_two_gray" selectedImage:@"icon_home_tab_two_blue"];
 
 UINavigationController *threeNC = [[UINavigationController alloc]initWithRootViewController:threeVC];
 
 
 SecondViewController *secondVC = [SecondViewController new];
 [self addChildVc:secondVC title:@"我的" image:@"icon_home_tab_three_gray" selectedImage:@"icon_home_tab_three_blue"];
 
 UINavigationController *secondNC = [[UINavigationController alloc]initWithRootViewController:secondVC];
 
 //3.添加到控制器
 //特别注意：管理一组的控制器(最多显示五个,多余五个的话,包括第五个全部在更多模块里面,并且可以通过拖拽方式进行顺序编辑);
 NSArray *array = @[firstNC,threeNC,secondNC];
 tab.viewControllers = array;
 self.window.rootViewController = tab;
 
 }

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置标题
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //需要设置照片的模式，用照片原图，默认是蓝色的
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //创建修改字体颜色的字典，同时可以设置字体的内边距；
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    
    if ([url.host isEqualToString:@"safepay"]) {
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url
//                                                  standbyCallback:^(NSDictionary *resultDic){
//                                                      [[WTPayManager shareWTPayManager] handleAlipayResponse:resultDic];
//
//                                                  }];
        return YES;
    }
    else if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
//        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
//
//            [[WTPayManager shareWTPayManager] handleAlipayResponse:resultDic];
//        }];
        return YES;
    }else if ([options[UIApplicationOpenURLOptionsSourceApplicationKey] isEqualToString:@"com.tencent.xin"]){
        
        return [WXApi handleOpenURL:url delegate:[WTPayManager shareWTPayManager]];
        
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    if ([url.host isEqualToString:@"safepay"]) {
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url
//                                                  standbyCallback:^(NSDictionary *resultDic){
//                                                      [[WTPayManager shareWTPayManager] handleAlipayResponse:resultDic];
//
//                                                  }];
        return YES;
    }
    else if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
//        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
//            
//            [[WTPayManager shareWTPayManager] handleAlipayResponse:resultDic];
//        }];
        return YES;
    }else if ([sourceApplication isEqualToString:@"com.tencent.xin"]){
        
        return [WXApi handleOpenURL:url delegate:[WTPayManager shareWTPayManager]];
        
    }
    
    return YES;
}

@end
