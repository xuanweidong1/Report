//
//  MarkMessageViewController.m
//  Report
//
//  Created by tcx on 2018/1/10.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "MarkMessageViewController.h"
#import <SDAutoLayout.h>

@interface MarkMessageViewController ()

@end

@implementation MarkMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"分数信息";
    
    NSArray *array = @[@"文科", @"理科"];
    UISegmentedControl *segmentedC = [[UISegmentedControl alloc] initWithItems:array];
    segmentedC.selectedSegmentIndex = 0;
    [segmentedC addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedC];
    segmentedC.sd_layout
    .topSpaceToView(self.view, 99)
    .widthIs(150)
    .heightIs(40)
    .centerXEqualToView(self.view);
    
    
    
    
    
    
    
    
    
}

- (void)segmentedAction:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"文科");
    } else {
        NSLog(@"理科");
    }
    
    
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
