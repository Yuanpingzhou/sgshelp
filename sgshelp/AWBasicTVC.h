//
//  AWHeroVCViewController.h
//  sgshelp
//
//  Created by  on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AWBasicTVC : UITableViewController
{
    NSDictionary* _heroDic;
    NSArray* _sortKeyArray;
}
- (id)initWithDic:(NSDictionary*)dic;

@end
