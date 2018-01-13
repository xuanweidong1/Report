//
//  IntelligenceViewController.m
//  Report
//
//  Created by tcx on 2018/1/11.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "IntelligenceViewController.h"
#import <SDAutoLayout.h>
#import "CompetitiveIntelligence.h"
#import "SchoolModel.h"
#import "RankingTableViewCell.h"
@interface IntelligenceViewController ()

@property(nonatomic,retain)CompetitiveIntelligence *compe;
@end

@implementation IntelligenceViewController{
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"竞争情报";
    NSArray *items = @[@"招生计划情报",@"功能使用情报",@"分数情报",@"排名情报"];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:items];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    segment.sd_layout
    .topSpaceToView(self.view, 79)
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .heightIs(40);
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"studentPlan" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    self.compe =[[CompetitiveIntelligence alloc]init];
    self.compe.type = STUDENTPLAN;
    self.compe.competitiveIntelligence = data;
    tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    tableView.sd_layout
    .topSpaceToView(segment, 10)
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .bottomSpaceToView(self.view, 10);
    tableView.delegate = self;
    tableView.dataSource = self;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.compe.competitiveIntelligence.allKeys.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *batch = @"";
    switch (indexPath.section) {
        case 0:
            batch = @"firstBatch";
            break;
            
        default:
            batch = @"secondBatch";
            break;
    }
    NSArray *schoolS = self.compe.competitiveIntelligence[batch];
    SchoolModel *schoolModel = [SchoolModel new];
    [schoolModel modelWithDic:schoolS[indexPath.row]];
    
    RankingTableViewCell *cell = [[RankingTableViewCell alloc]initWithKeySchoolModel:schoolModel];
    return cell;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *batch = @"";
    switch (section) {
        case 0:
            batch = @"firstBatch";
            break;
            
        default:
            batch = @"secondBatch";
            break;
    }
    NSArray *schoolS = self.compe.competitiveIntelligence[batch];
    return schoolS.count;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.sd_layout
    .leftEqualToView(tableView).rightEqualToView(tableView).heightIs(30).yIs(0).widthIs(tableView.frame.size.width);
    UILabel *label = [UILabel new];
    label.sd_layout.leftSpaceToView(headerView, 10).topSpaceToView(headerView, 0).heightIs(30).rightSpaceToView(headerView, 10).widthIs(headerView.frame.size.width);
    switch (section) {
        case 0:
            label.text = @"第一批次";
            break;
        case 1:
            label.text = @"第二批次";
            break;
        case 2:
            label.text = @"第三批次";
            break;
        default:
            label.text = @"其他批次";
            break;
    }
    label.textColor = [UIColor blackColor];
    [headerView addSubview:label];
//    label.backgroundColor = [UIColor blueColor];
//    headerView.backgroundColor = [UIColor redColor];
    return headerView;
}




- (void)segmentedAction:(UISegmentedControl *)sender {
    self.compe.type = (int)sender.selectedSegmentIndex;
    [tableView reloadData];
    //    switch (sender.selectedSegmentIndex) {
    //        case 0:
    //
    //            break;
    //        case 1:
    //
    //            break;
    //        case 2:
    //
    //            break;
    //        case 3:
    //
    //            break;
    //        default:
    //            break;
    //    }
    
    
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
