//
//  SeaElectionViewController.m
//  Report
//
//  Created by tcx on 2018/1/11.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "SeaElectionViewController.h"
#import "MenuScreeningView.h"
#import "XWDAFNManager.h"
#import <SDAutoLayout.h>

@interface SeaElectionViewController ()<ProtocolDelegate>
@property (nonatomic, strong) MenuScreeningView *menuScreeningView;  //条件选择器
@end

@implementation SeaElectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"海选院校";
     CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    self.menuScreeningView = [[MenuScreeningView alloc] init];
    self.menuScreeningView.delegate = self;
    [self.view addSubview:self.menuScreeningView];
    self.menuScreeningView.backgroundColor = [UIColor whiteColor];
    
    _menuScreeningView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, rectStatus.size.height + 49)
    .heightIs(40);
    
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
