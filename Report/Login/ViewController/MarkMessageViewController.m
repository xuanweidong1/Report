//
//  MarkMessageViewController.m
//  Report
//
//  Created by tcx on 2018/1/10.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "MarkMessageViewController.h"
#import <SDAutoLayout.h>

@interface MarkMessageViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *examinationCode;//准考证号
@property (nonatomic, strong) UITextField * language;
@property (nonatomic, strong) UITextField *english;
@property (nonatomic, strong) UITextField *math;
@property (nonatomic, strong) UITextField *synthesize;//综合




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
    
    
    
    self.examinationCode = [[UITextField alloc] init];
    _examinationCode.borderStyle = UITextBorderStyleRoundedRect;
    _examinationCode.font = [UIFont systemFontOfSize:17];
    _examinationCode.delegate = self;
    _examinationCode.placeholder = @"准考证号";
    [self.view addSubview:_examinationCode];
    
    
    _examinationCode.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(segmentedC, 30)
    .heightIs(40);
    
    self.language = [[UITextField alloc] init];
    _language.borderStyle = UITextBorderStyleRoundedRect;
    _language.font = [UIFont systemFontOfSize:17];
    _language.delegate = self;
    _language.placeholder = @"语文";
    [self.view addSubview:_language];
    
    
    _language.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(_examinationCode, 30)
    .heightIs(40);
    
    
    
    self.english = [[UITextField alloc] init];
    _english.borderStyle = UITextBorderStyleRoundedRect;
    _english.font = [UIFont systemFontOfSize:17];
    _english.delegate = self;
    _english.placeholder = @"英语";
    [self.view addSubview:_english];
    
    
    _english.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(_language, 30)
    .heightIs(40);
    
    self.math = [[UITextField alloc] init];
    _math.borderStyle = UITextBorderStyleRoundedRect;
    _math.font = [UIFont systemFontOfSize:17];
    _math.delegate = self;
    _math.placeholder = @"英语";
    [self.view addSubview:_math];
    
    
    _math.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(_english, 30)
    .heightIs(40);
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    nextBtn.backgroundColor = [UIColor blueColor];
    [nextBtn setTintColor: [UIColor whiteColor]];
    nextBtn.clipsToBounds = YES;
    nextBtn.layer.cornerRadius = 5;
    [self.view addSubview:nextBtn];
    
    [nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    nextBtn.sd_layout
    .leftSpaceToView(self.view, 55)
    .rightSpaceToView(self.view, 55)
    .topSpaceToView(_math, 30)
    .heightIs(40);
    
    
}

- (void)segmentedAction:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"文科");
    } else {
        NSLog(@"理科");
    }
    
    
}

- (void)nextBtnAction {
    
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
