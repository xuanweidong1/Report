//
//  RegisterViewController.m
//  Report
//
//  Created by tcx on 2018/1/9.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "RegisterViewController.h"
#import <SDAutoLayout.h>
#import "MarkMessageViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *mailName;
@property (nonatomic, strong) UITextField *testCode;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UITextField *repassword;
@property (nonatomic, strong) UIButton *codeBtn;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"免费注册";
    
    
    self.mailName = [[UITextField alloc] init];
    _mailName.placeholder = @"邮箱";
    _mailName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_mailName];
    
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _codeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _codeBtn.backgroundColor = [UIColor blueColor];
    _codeBtn.clipsToBounds = YES;
    _codeBtn.layer.cornerRadius = 5;
    [_codeBtn addTarget:self action:@selector(codeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_codeBtn];

    
    
    _mailName.sd_layout
    .topSpaceToView(self.view, 99)
    .leftSpaceToView(self.view, 20)
    .widthIs(230)
    .heightIs(40);
    
    _codeBtn.sd_layout
    .topEqualToView(_mailName)
    .leftSpaceToView(_mailName, 5)
    .rightSpaceToView(self.view, 20)
    .heightIs(40);

    
    
    
    self.testCode = [[UITextField alloc] init];
    _testCode.borderStyle = UITextBorderStyleRoundedRect;
    _testCode.font = [UIFont systemFontOfSize:17];
    _testCode.delegate = self;
    _testCode.placeholder = @"输入验证码";
    [self.view addSubview:_testCode];
    
    
    _testCode.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(_mailName, 30)
    .heightIs(40);
    
    
    
    self.password = [[UITextField alloc] init];
    _password.borderStyle = UITextBorderStyleRoundedRect;
    _password.font = [UIFont systemFontOfSize:17];
    _password.delegate = self;
    _password.placeholder = @"设置密码";
    [self.view addSubview:_password];
    
    _password.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(_testCode, 30)
    .heightIs(40);
    
    
    
    self.repassword = [[UITextField alloc] init];
    _repassword.borderStyle = UITextBorderStyleRoundedRect;
    _repassword.font = [UIFont systemFontOfSize:17];
    _repassword.delegate = self;
    _repassword.placeholder = @"确认密码";
    [self.view addSubview:_repassword];
    
    _repassword.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(_password, 30)
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
    .topSpaceToView(_repassword, 30)
    .heightIs(40);
    
    
    
}

- (void)codeBtnAction {
    
}

- (void)nextBtnAction {
    NSLog(@"下一步");
    MarkMessageViewController *markMessageVC = [[MarkMessageViewController alloc] init];
    [self.navigationController pushViewController:markMessageVC animated:YES];
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
