//
//  AWMoreTVC.m
//  sgshelp
//
//  Created by  on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AWMoreTVC.h"
#import "AWSettingsMgr.h"
#import "AWPokerMgr.h"

@interface AWMoreTVC ()

@end

typedef enum
{
    EVCTagWindSwitch=200,
    EVCTagFireSwitch,
    EVCTagForestSwitch,
    EVCTagMontainSwitch,
    EVCTagFightSwitch,
    
}TVCTag;

@implementation AWMoreTVC

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different
{
    switch (section) {
        case 0:
            return @"启用";
        case 1:   
            return @"关于";
        default:
            break;
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 5;
        case 1:  
            return 2;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell ;//= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section==0) {
        UISwitch* sw = [[UISwitch alloc] init];
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"风";
                sw.on = [AWSettingsMgr shareInstance].settings.windOn;
                sw.tag = EVCTagWindSwitch;
                break;
            case 1:
                cell.textLabel.text = @"林";
                sw.tag = EVCTagForestSwitch;
                sw.on = [AWSettingsMgr shareInstance].settings.forestOn;
                break;
            case 2:
                cell.textLabel.text = @"火";
                sw.tag = EVCTagFireSwitch;
                sw.on = [AWSettingsMgr shareInstance].settings.fireOn;
                break;
            case 3:
                cell.textLabel.text = @"山";
                sw.tag = EVCTagMontainSwitch;
                sw.on = [AWSettingsMgr shareInstance].settings.mountainOn;
                break;
            case 4:
                cell.textLabel.text = @"军争篇";
                sw.on = [AWSettingsMgr shareInstance].settings.fightOn;
                sw.tag = EVCTagFightSwitch;
                break;
                
            default:
                break;
        }
        [sw addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = sw;
    }
    else if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"v1.1 官方微博@sgshelp";
                break;
            case 1:
                cell.textLabel.text = @"分享到微博";
                break;
            default:
                break;
        }
        
    }
    return cell;
}

- (void)switchChanged:(id)sender
{
    UISwitch* sw = (UISwitch*)sender;
    switch (sw.tag) {
        case EVCTagWindSwitch:
            [AWSettingsMgr shareInstance].settings.windOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagFireSwitch:
            [AWSettingsMgr shareInstance].settings.fireOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagForestSwitch:
            [AWSettingsMgr shareInstance].settings.forestOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagMontainSwitch:
            [AWSettingsMgr shareInstance].settings.mountainOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagFightSwitch:
            [AWSettingsMgr shareInstance].settings.fightOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeWeapon] object:nil];
            break;
        default:
            break;
    }
    [[AWSettingsMgr shareInstance] save];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://t.qq.com/sgshelp"]];
                break;
            case 1:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://share.v.t.qq.com/index.php?c=share&a=index&url=&title=%E8%87%AA%E4%BB%8E%E6%9C%89%E4%BA%86%E4%B8%89%E5%9B%BD%E6%9D%80%E5%85%B5%E6%B3%95%EF%BC%8C%E8%85%B0%E4%B8%8D%E9%85%B8%EF%BC%8C%E8%85%BF%E4%B8%8D%E7%97%9B%E4%BA%86%20@sgshelp&pic="]];
                break;
            default:
                break;
        }
        
    }
}

@end
