//
//  ProtocolDelegate.h
//  Report
//
//  Created by tcx on 2017/11/21.
//  Copyright © 2017年 tcx. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ProtocolDelegate <NSObject>


@required//必须实现的方法

@optional//可选实现的方法
//下拉菜单选择确定后的回调 
- (void)didSelectMenuItem:(NSString *)str;




@end
