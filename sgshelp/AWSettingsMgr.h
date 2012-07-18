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
@property (nonatomic, assign) BOOL fightOn;//军争篇
@property (nonatomic, assign) BOOL godOn; //神
@property (nonatomic, assign) BOOL spOn; //sp
@property (nonatomic, assign) BOOL sspOn; //☆SP
@property (nonatomic, assign) BOOL generalOn; //神
@property (nonatomic, assign) BOOL general2012On; //神

@end

@interface AWSettingsMgr : NSObject
@property(nonatomic,strong)AWDataSettings* settings;
+(AWSettingsMgr*)shareInstance;
-(void)save;

@end
