//
//  AWHeroVCViewController.h
//  sgshelp
//
//  Created by  on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWPokerMgr.h"

@interface AWBasicTVC : UITableViewController<UISearchDisplayDelegate, UISearchBarDelegate>
{
    TPokerType _type;
    NSDictionary* _heroDic;
    NSArray* _sortKeyArray;
    
    UISearchDisplayController* _searchCtr;
    NSMutableDictionary* _heroSearchDic;
    NSMutableArray* _sortKeySearchArray;
    
}
- (id)initWithType:(TPokerType)type;
-(void)reset;
@end
