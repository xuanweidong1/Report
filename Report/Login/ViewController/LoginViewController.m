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
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"

#import "SeaElectionViewController.h"
#import "CollectionViewController.h"
#import "IntelligenceViewController.h"
#import "ExpertViewController.h"
#import "MineViewController.h"



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
    [self setTabbarController];
}

- (void)setTabbarController {
    //1.创建标签控制器
    UITabBarController *tab = [[UITabBarController alloc]init];
    
    //2.创建相应的子控制器（viewcontroller）
    
    SeaElectionViewController *seaVC = [SeaElectionViewController new];
    [self addChildVc:seaVC title:@"海选院校" image:@"搜索" selectedImage:@""];
    UINavigationController *seaNC = [[UINavigationController alloc] initWithRootViewController:seaVC];
    
    CollectionViewController *collVC = [CollectionViewController new];
    [self addChildVc:collVC title:@"志愿收藏" image:@"收藏" selectedImage:@""];
    
    UINavigationController *collNC = [[UINavigationController alloc]initWithRootViewController:collVC];
    
    
    IntelligenceViewController *intVC = [IntelligenceViewController new];
    [self addChildVc:intVC title:@"竞争情报" image:@"情报" selectedImage:@""];
    
    UINavigationController *intNC = [[UINavigationController alloc]initWithRootViewController:intVC];
    
    
    ExpertViewController *expVC = [[ExpertViewController alloc] init];
    [self addChildVc:expVC title:@"专家咨询" image:@"专家" selectedImage:@""];
    UINavigationController *expNC = [[UINavigationController alloc]initWithRootViewController:expVC];
    
    MineViewController *minVC = [[MineViewController alloc] init];
    [self addChildVc:minVC title:@"个人中心" image:@"个人中心" selectedImage:@""];
    UINavigationController *minNC = [[UINavigationController alloc]initWithRootViewController:minVC];
    
    
    
    //3.添加到控制器
    //特别注意：管理一组的控制器(最多显示五个,多余五个的话,包括第五个全部在更多模块里面,并且可以通过拖拽方式进行顺序编辑);
    NSArray *array = @[seaNC,collNC,intNC, expNC, minNC];
    tab.viewControllers = array;
    // self.window.rootViewController = tab;
    [UIApplication sharedApplication].delegate.window.rootViewController = tab;
    
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
