//
//  RankingTableViewCell.h
//  Report
//
//  Created by test on 2018/1/12.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolModel.h"

@interface RankingTableViewCell : UITableViewCell
///学校名称Label
@property (weak, nonatomic) IBOutlet UILabel *schoolName;
///专业名称Label
@property (weak, nonatomic) IBOutlet UILabel *specialtyName;
///2018计划招生Label
@property (weak, nonatomic) IBOutlet UILabel *plan_2018;
///2017最高分排名Label
@property (weak, nonatomic) IBOutlet UILabel *maxRanking_2017;
///2017最低分排名Label
@property (weak, nonatomic) IBOutlet UILabel *minRanking_2017;
///排名区间人数Label
@property (weak, nonatomic) IBOutlet UILabel *rankingPeople;

-(instancetype)initWithKeySchoolModel:(SchoolModel *)schoolModel;
@end
