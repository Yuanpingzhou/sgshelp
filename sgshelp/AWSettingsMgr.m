//
//  AWSettingsMgr.m
//  sgshelp
//
//  Created by  on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AWSettingsMgr.h"
@implementation AWDataSettings
@synthesize windOn;
@synthesize forestOn;
@synthesize fireOn;
@synthesize mountainOn;
@synthesize fightOn;


-(id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if (self)
    {
        self.windOn = [(NSNumber*)[decoder decodeObjectForKey:@"windOn"] boolValue];
        self.forestOn = [(NSNumber*)[decoder decodeObjectForKey:@"forestOn"] boolValue];
        self.fireOn = [(NSNumber*)[decoder decodeObjectForKey:@"fireOn"] boolValue];
        self.mountainOn = [(NSNumber*)[decoder decodeObjectForKey:@"mountainOn"] boolValue];
        self.fightOn = [(NSNumber*)[decoder decodeObjectForKey:@"fightOn"] boolValue];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:[NSNumber numberWithBool:self.windOn] forKey:@"windOn"];
    [encoder encodeObject:[NSNumber numberWithBool:self.forestOn] forKey:@"forestOn"];
    [encoder encodeObject:[NSNumber numberWithBool:self.fireOn] forKey:@"fireOn"];
    [encoder encodeObject:[NSNumber numberWithBool:self.mountainOn] forKey:@"mountainOn"];
    [encoder encodeObject:[NSNumber numberWithBool:self.fightOn] forKey:@"fightOn"];
}

@end


@implementation AWSettingsMgr
@synthesize settings;
+(AWSettingsMgr*)shareInstance
{
    static AWSettingsMgr* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AWSettingsMgr alloc] init];
    });
    return manager;
}

-(id)init
{
    self = [super init];
    if (self) {
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* pathFilename = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"settings"];
        settings = [NSKeyedUnarchiver unarchiveObjectWithFile:pathFilename];
        if (settings ==nil) {
            settings = [[AWDataSettings alloc] init];
        }
    }
    return self;
}

-(void)save
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* pathFilename = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"settings"];
    [NSKeyedArchiver archiveRootObject:settings toFile:pathFilename];
}

@end
