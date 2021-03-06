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
    EVCTagGodSwitch,
    EVCTagSpSwitch,
    EVCTagSspSwitch,
    EVCTagGeneralSwitch,
    EVCTagGeneral2012Switch,
    
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
            return @"启用扩展";
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
            return 10;
        case 1:  
            return 3;
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
            case 5:
                cell.textLabel.text = @"神";
                sw.on = [AWSettingsMgr shareInstance].settings.godOn;
                sw.tag = EVCTagGodSwitch;
                break;
            case 6:
                cell.textLabel.text = @"SP武将";
                sw.on = [AWSettingsMgr shareInstance].settings.spOn;
                sw.tag = EVCTagSpSwitch;
                break;
            case 7:
                cell.textLabel.text = @"☆SP武将";
                sw.on = [AWSettingsMgr shareInstance].settings.sspOn;
                sw.tag = EVCTagSspSwitch;
                break;
            case 8:
                cell.textLabel.text = @"一将成名";
                sw.on = [AWSettingsMgr shareInstance].settings.generalOn;
                sw.tag = EVCTagGeneralSwitch;
                break;
            case 9:
                cell.textLabel.text = @"2012一将成名";
                sw.on = [AWSettingsMgr shareInstance].settings.general2012On;
                sw.tag = EVCTagGeneral2012Switch;
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
                cell.textLabel.text = @"v1.1 点击反馈意见 收听@sgshelp";
                break;
            case 1:
                cell.textLabel.text = @"去微博分享给朋友们";
                break;
            case 2:
                cell.textLabel.text = @"内容来源: www.sanguosha.com";
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
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeMagic] object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeWeapon] object:nil];
            break;
        case EVCTagGodSwitch:
            [AWSettingsMgr shareInstance].settings.godOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagSpSwitch:
            [AWSettingsMgr shareInstance].settings.spOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagSspSwitch:
            [AWSettingsMgr shareInstance].settings.sspOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagGeneralSwitch:
            [AWSettingsMgr shareInstance].settings.generalOn = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
            break;
        case EVCTagGeneral2012Switch:
            [AWSettingsMgr shareInstance].settings.general2012On = sw.on;
            [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"notify_dic_changed_%d",EPokerTypeHero] object:nil];
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
                //http://share.v.t.qq.com/index.php?c=share&a=index&url=http://itunes.apple.com/us/app/san-guo-sha-bing-fa/id530081917&title=点兵点将，他们都是我的好兵好将。@sgshelp，有最详尽的武将介绍、锦囊说明、武器功能，选将出牌了如指掌，用了都说好。快到AppStore下载&pic=http://t2.qlogo.cn/mbloghead/863875589d2288c695c6/180
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://share.v.t.qq.com/index.php?c=share&a=index&url=http://itunes.apple.com/us/app/san-guo-sha-bing-fa/id530081917&title=%E7%82%B9%E5%85%B5%E7%82%B9%E5%B0%86%EF%BC%8C%E4%BB%96%E4%BB%AC%E9%83%BD%E6%98%AF%E6%88%91%E7%9A%84%E5%A5%BD%E5%85%B5%E5%A5%BD%E5%B0%86%E3%80%82@sgshelp%EF%BC%8C%E6%9C%89%E6%9C%80%E8%AF%A6%E5%B0%BD%E7%9A%84%E6%AD%A6%E5%B0%86%E4%BB%8B%E7%BB%8D%E3%80%81%E9%94%A6%E5%9B%8A%E8%AF%B4%E6%98%8E%E3%80%81%E6%AD%A6%E5%99%A8%E5%8A%9F%E8%83%BD%EF%BC%8C%E9%80%89%E5%B0%86%E5%87%BA%E7%89%8C%E4%BA%86%E5%A6%82%E6%8C%87%E6%8E%8C%EF%BC%8C%E7%94%A8%E4%BA%86%E9%83%BD%E8%AF%B4%E5%A5%BD%E3%80%82%E5%BF%AB%E5%88%B0AppStore%E4%B8%8B%E8%BD%BD&pic=http://t2.qlogo.cn/mbloghead/863875589d2288c695c6/180"]];
                break;
            case 2:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sanguosha.com?from=@sgshelp"]];
                break;
            default:
                break;
        }
        
    }
}

@end
