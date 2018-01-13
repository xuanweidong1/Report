//
//  CompetitiveIntelligence.h
//  Report
//
//  Created by test on 2018/1/12.
//  Copyright © 2018年 tcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SchoolModel.h"
typedef enum{
    //招生计划
    STUDENTPLAN = 0,
    //功能使用
    FUNCTIONUSED = 1,
    //得分情报
    SCORE,
    //排名情报
    RANKING
}type;

@interface CompetitiveIntelligence : NSObject
///当前类型
@property(nonatomic)type type;
///批次字典
@property(nonatomic,strong)NSDictionary *competitiveIntelligence;


@end
