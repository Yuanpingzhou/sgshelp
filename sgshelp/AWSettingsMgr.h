//
//  AWSettingsMgr.h
//  sgshelp
//
//  Created by  on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AWDataSettings : NSObject <NSCoding>

@property (nonatomic, assign) BOOL windOn;
@property (nonatomic, assign) BOOL forestOn;
@property (nonatomic, assign) BOOL fireOn;
@property (nonatomic, assign) BOOL mountainOn;
@property (nonatomic, assign) BOOL fightOn;

@end

@interface AWSettingsMgr : NSObject
@property(nonatomic,strong)AWDataSettings* settings;
+(AWSettingsMgr*)shareInstance;
-(void)save;

@end
