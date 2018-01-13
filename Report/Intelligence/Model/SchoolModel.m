//
//  SchoolModel.m
//  Report
//
//  Created by test on 2018/1/12.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import "SchoolModel.h"

@implementation SchoolModel
-(void)modelWithDic:(NSDictionary *)dic{
    self.name = dic[@"school"];
    self.specialty = dic[@"specialty"];
    self.plan_2018 = dic[@"2018Plan"];
    self.maxRanking_2017 = dic[@"2017MaxRanking"];
    self.minRanking_2017 = dic[@"2017MinRanking"];
    self.rankingPeople = dic[@"RankingPeople"];
}
@end
