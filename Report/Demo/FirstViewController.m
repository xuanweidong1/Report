//
//  FirstViewController.m
//  Report
//
//  Created by tcx on 2017/11/21.
//  Copyright © 2017年 tcx. All rights reserved.
//

#import "FirstViewController.h"
#import "MenuScreeningView.h"
#import "XWDAFNManager.h"
#import "SchoolModel.h"
#import <RMMapper.h>
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


@interface FirstViewController ()<ProtocolDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MenuScreeningView *menuScreeningView;  //条件选择器
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sourceArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
//    self.tabBarController.tabBar.translucent = NO;
    self.title = @"报志愿";
    
    self.menuScreeningView = [[MenuScreeningView alloc] initWithFrame:CGRectMake(0, 250, kWidth, 36)];
    self.menuScreeningView.delegate = self;
    [self.view addSubview:self.menuScreeningView];
    self.menuScreeningView.backgroundColor = [UIColor whiteColor];
    
    self.sourceArray = [NSMutableArray array];
    [self getSourceData:@"0"];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 36 + 250, kWidth, kHeight - rectStatus.size.height - 44 - 36 - 250) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    SchoolModel *schoolModel = self.sourceArray[indexPath.row];
    cell.textLabel.text = schoolModel.uni_name;
    
    return cell;
}


//协议回调
- (void)didSelectMenuItem:(NSString *)str {
    [self getSourceData:@"30"];
    [self.tableView reloadData];
}

- (void)getSourceData:(NSString *)countStr {
   NSString *urlStr = [NSString stringWithFormat:@"http://api.gaokaopai.com/university-search?break_count=%@&gkptoken=3c75baf3bb943989a08b943cee0f451b&pagesize=30&uid=5011419",countStr];
    [XWDAFNManager getWithUrlStr:urlStr parameters:nil success:^(NSDictionary *data) {
        
        _sourceArray = [RMMapper mutableArrayOfClass:[SchoolModel class]
                               fromArrayOfDictionary:data[@"res"]];
        
        
        [self.tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
    
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
