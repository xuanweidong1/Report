//
//  SchoolModel.h
//  Report
//
//  Created by test on 2018/1/12.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import <Foundation/Foundation.h>
//学校Model
@interface SchoolModel : NSObject
//学校名称
@property(nonatomic,copy)NSString *name;
//专业
@property(nonatomic,copy)NSString *specialty;
//2018计划招生
@property(nonatomic,copy)NSString *plan_2018;
//2017最高分排名
@property(nonatomic,copy)NSString *maxRanking_2017;
//2017最低分排名
@property(nonatomic,copy)NSString *minRanking_2017;
//排名区间人数
@property(nonatomic,copy)NSString *rankingPeople;

-(void)modelWithDic:(NSDictionary *)dic;
@end
