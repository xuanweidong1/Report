//
//  LoginViewController.m
//  Report
//
//  Created by tcx on 2018/1/9.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "LoginViewController.h"
#import <SDAutoLayout.h>
#import "RegisterViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *password;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.text = @"龙考志愿";
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.font = [UIFont systemFontOfSize:34];
    titleL.textColor = [UIColor redColor];
    [self.view addSubview:titleL];
    titleL.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 140)
    .rightSpaceToView(self.view, 20)
    .heightIs(40);
    
    
    self.userName = [[UITextField alloc] init];
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.font = [UIFont systemFontOfSize:18];
    _userName.delegate = self;
    _userName.placeholder = @"手机号/邮箱/准考证号";
    [self.view addSubview:_userName];
    
    _userName.sd_layout
    .leftSpaceToView(self.view, 36)
    .rightSpaceToView(self.view, 36)
    .topSpaceToView(titleL, 100)
    .heightIs(40);
    
    
    
    self.password = [[UITextField alloc] init];
    _password.borderStyle = UITextBorderStyleRoundedRect;
    _password.font = [UIFont systemFontOfSize:18];
    _password.delegate = self;
    _password.placeholder = @"密码";
    [self.view addSubview:_password];
    
    _password.sd_layout
    .leftSpaceToView(self.view, 36)
    .rightSpaceToView(self.view, 36)
    .topSpaceToView(_userName, 30)
    .heightIs(40);
    
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn setTintColor: [UIColor whiteColor]];
    [self.view addSubview:loginBtn];
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 5;
    [loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];

    loginBtn.sd_layout
    .leftSpaceToView(self.view, 55)
    .rightSpaceToView(self.view, 55)
    .topSpaceToView(_password, 120)
    .heightIs(40);
    
    
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:forgetBtn];
    forgetBtn.sd_layout
    .leftSpaceToView(self.view, 36)
    .widthIs(70)
    .topSpaceToView(_password, 40)
    .heightIs(20);
    
     [forgetBtn addTarget:self action:@selector(forgetBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setTitle:@"邮箱注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:registerBtn];
    registerBtn.sd_layout
    .rightSpaceToView(self.view, 36)
    .widthIs(70)
    .topSpaceToView(_password, 40)
    .heightIs(20);
    
     [registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)loginBtnAction {
    NSLog(@"登录");
}
- (void)forgetBtnAction {
    NSLog(@"忘记密码");
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    registerVC.title = @"找回密码";
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)registerBtnAction {
    NSLog(@"邮箱注册");
    
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    registerVC.title = @"注册";
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
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
