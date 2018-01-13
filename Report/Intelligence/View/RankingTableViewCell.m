//
//  RankingTableViewCell.m
//  Report
//
//  Created by test on 2018/1/12.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "RankingTableViewCell.h"
@implementation RankingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithKeySchoolModel:(SchoolModel *)schoolModel
{
    self = [self init];
    self = [[[NSBundle mainBundle] loadNibNamed:@"RankingTableViewCell" owner:self options:nil] lastObject];
    if (self) {
        self.schoolName.text = schoolModel.name;
        self.specialtyName.text = schoolModel.specialty;
        self.plan_2018.text = schoolModel.plan_2018;
        self.maxRanking_2017.text = schoolModel.maxRanking_2017;
        self.minRanking_2017.text = schoolModel.minRanking_2017;
        self.rankingPeople.text = schoolModel.rankingPeople;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
