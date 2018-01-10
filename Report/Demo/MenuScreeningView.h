//
//  MenuScreeningView.h
//  LinkageMenu
//
//  Created by mango on 2017/3/4.
//  Copyright © 2017年 mango. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocolDelegate.h"

@interface MenuScreeningView : UIView


@property (nonatomic, assign) id<ProtocolDelegate> delegate;

-(void)menuScreeningViewDismiss;

@end
