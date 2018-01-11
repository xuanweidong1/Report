//
//  ViewController.m
//  Report
//
//  Created by tcx on 2017/11/16.
//  Copyright © 2017年 tcx. All rights reserved.
//

#import "ViewController.h"
#import "XWDAFNManager.h"
#import "WTPayManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//
//    self.title = @"测试";
//    self.navigationController.navigationBar.translucent = NO;
//    self.tabBarController.tabBar.translucent = NO;
    
    
//    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mine-sun-icon"] style:UIBarButtonItemStyleDone target:self action:@selector(weixinPay)];
    
//    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"微信支付" style:UIBarButtonItemStyleDone target:self action:@selector(weixinPay)];
//
//
////    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_coin_icon_click"] style:UIBarButtonItemStyleDone target:self action:@selector(btn2Action)];
//     UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:@"网络请求" style:UIBarButtonItemStyleDone target:self action:@selector(btn2Action)];
//
//    self.navigationItem.rightBarButtonItems = @[btn1, btn2];
    
    
    /*
     [self addLeftBarButtonWithImage:[UIImage imageNamed:@"navigationButtonReturnClick"] action:@selector(backAction)];
     [self addRightTwoBarButtonsWithFirstImage:[UIImage imageNamed:@"mine-sun-icon"] firstAction:@selector(action1) secondImage:[UIImage imageNamed:@"nav_coin_icon_click"] secondAction:@selector(doneAction)];
     [self addRightThreeBarButtonsWithFirstImage:[UIImage imageNamed:@"mine-sun-icon"] firstAction:nil secondImage:[UIImage imageNamed:@"nav_coin_icon_click"] secondAction:nil thirdImage:[UIImage imageNamed:@"shuju"] thirdAction:nil];
     
     */
    
    
    
    
}
- (void)btn1Action{
//    CGRect frame = [CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    
    
    
    NSString *urlStr = @"";
    NSDictionary *dic = nil;
    //get
    [XWDAFNManager getWithUrlStr:urlStr parameters:dic success:^(NSDictionary *data) {
        
    } fail:^(NSError *error) {
        
    }];
    
   
    
}


- (void)btn2Action{
    
    NSString *urlStr = @"";
    NSDictionary *dic = nil;
    //post
    [XWDAFNManager postWithUrlStr:urlStr parameters:dic success:^(NSDictionary *data) {
        
        
    } fail:^(NSError *error) {
        
        
        
    }];
    
    
    
    
}


- (void)weixinPay {
    
    WTPayOrderItem * item = [[WTPayOrderItem alloc]init];
    item.orderName = @"哇哈哈八宝粥一瓶";
    item.orderPrice = @"1";//一分钱
    item.orderOutTradeNO = @"452AFAD3423432";
    item.orderBody = @"喝了以后爽歪歪";
    [WTPayManager wtPayOrderItem:item payType:WTPayTypeWeixin result:^(NSDictionary *payResult, NSString *error) {
        
        if (payResult) {
            NSLog(@"%@", payResult[@"result"]);
        }else{
            NSLog(@"%@", error);
        }
    }];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.hidesBottomBarWhenPushed = YES;
//    Demo1ViewController *demo = [[Demo1ViewController alloc] init];
//    [self.navigationController pushViewController:demo animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
