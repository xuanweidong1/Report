//
//  SecondViewController.m
//  Report
//
//  Created by tcx on 2017/11/21.
//  Copyright © 2017年 tcx. All rights reserved.
//

#import "SecondViewController.h"
#import <SDAutoLayout.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的";
    self.navigationController.navigationBar.translucent = NO;
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"2017年最新企业开发者账号申请流程，用时不超过两个小时，现将申请流程及注意事项整理如下，供有需要的人参考。";
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"打开地址https://developer.apple.com,点击右上角的Account。";
    [self.view sd_addSubviews:@[label1,label2]];
    
    label1.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 150)
    .rightSpaceToView(self.view, 20)
    .autoHeightRatio(0);
    
  
    label2.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(label1, 20)
    .rightSpaceToView(self.view, 20)
    .autoHeightRatio(0);
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
