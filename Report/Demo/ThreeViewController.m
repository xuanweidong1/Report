//
//  ThreeViewController.m
//  Report
//
//  Created by tcx on 2017/11/20.
//  Copyright © 2017年 tcx. All rights reserved.
//

#import "ThreeViewController.h"
#import "XWDAFNManager.h"
#import "SchoolModel.h"
#import <RMMapper.h>
#import "ThreeCollectionViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


@interface ThreeViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sourceArray;
@property(nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
//    self.tabBarController.tabBar.translucent = NO;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(ScreenWidth/4, 75);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
//    [self.collectionView registerClass:[ThreeCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ThreeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
    
    [self.view addSubview:self.collectionView];
    
    
    
    
    self.title = @"高考攻略";
    self.sourceArray = [NSMutableArray array];
   
    [self getSourceData];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, ScreenWidth, ScreenHeight - rectStatus.size.height - 44 - 150) style:UITableViewStylePlain];
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
//    cell.textLabel.text = schoolModel.tips;
    
    return cell;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ThreeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];

    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
}


- (void)getSourceData {
     NSString *urlStr = @"http://api.gaokaopai.com/university-search?break_count=0&gkptoken=3c75baf3bb943989a08b943cee0f451b&pagesize=30&uid=5011419";
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
