//
//  AWPokerMgr.h
//  sgshelp
//
//  Created by  on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    EPokerTypeHero,
    EPokerTypeMagic,
    EPokerTypeWeapon,
}TPokerType;

@interface AWPokerMgr : NSObject
+(NSDictionary*)getPokerDic:(TPokerType)type;
+(NSDictionary*)getDetailDic:(TPokerType)type;

@end
