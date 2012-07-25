//
//  AWHeroVCViewController.m
//  sgshelp
//
//  Created by  on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AWBasicTVC.h"
#import "AWPokerMgr.h"

NSComparisonResult compare(id a,id b,void *context){
    return [a localizedCaseInsensitiveCompare:b];
}

@interface AWBasicTVC ()

@end

@implementation AWBasicTVC

- (id)initWithType:(TPokerType)type;
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // Custom initialization
        _type = type;
        _heroDic = [AWPokerMgr getPokerDic:type];
        _sortKeyArray = [[_heroDic allKeys] sortedArrayUsingFunction:compare context:nil];
        
        _heroSearchDic = [[NSMutableDictionary alloc] init];
        _sortKeySearchArray = [[NSMutableArray alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dicChanged:) name:[NSString stringWithFormat:@"notify_dic_changed_%d",_type] object:nil];
    }
    return self;
}

-(void)dicChanged:(NSNotification *)notification
{
    [self reset];
}

-(void)reset;
{
    _heroDic = [AWPokerMgr getPokerDic:_type];
    _sortKeyArray = [[_heroDic allKeys] sortedArrayUsingFunction:compare context:nil];
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UISearchBar *searchBar = [[UISearchBar alloc] init] ;
    _searchCtr =[[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    _searchCtr.searchResultsDelegate = self;
    _searchCtr.searchResultsDataSource = self;
    _searchCtr.delegate = self;
    searchBar.frame = CGRectMake(0, 0, 0, 38);
    searchBar.placeholder = @"搜索";
    self.tableView.tableHeaderView = searchBar;
    self.tableView.contentOffset = CGPointMake(0, 38);
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (tableView == _searchCtr.searchResultsTableView) {
        return [_sortKeySearchArray count];
    }else {
        return [_sortKeyArray count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (tableView == _searchCtr.searchResultsTableView) {
        cell.textLabel.text = [_heroSearchDic objectForKey:[_sortKeySearchArray objectAtIndex:indexPath.section]];
    }else {
        cell.textLabel.text = [_heroDic objectForKey:[_sortKeyArray objectAtIndex:indexPath.section]];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellText;
    if (tableView == _searchCtr.searchResultsTableView) {
        cellText = [_heroSearchDic objectForKey:[_sortKeySearchArray objectAtIndex:indexPath.section]];
    }else {
        cellText = [_heroDic objectForKey:[_sortKeyArray objectAtIndex:indexPath.section]];
    }
    UIFont *cellFont = [UIFont systemFontOfSize:14];
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    return labelSize.height + 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == _searchCtr.searchResultsTableView) {
        return [_sortKeySearchArray objectAtIndex:section];
    }else {
        return [_sortKeyArray objectAtIndex:section];
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (tableView == _searchCtr.searchResultsTableView) {
        return _sortKeySearchArray;
    }else {
        return _sortKeyArray;
    }
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
    NSString* key;
    if (tableView == _searchCtr.searchResultsTableView) {
        key = [_sortKeySearchArray objectAtIndex:indexPath.section];
    }else {
        key =  [_sortKeyArray objectAtIndex:indexPath.section];
    }
    NSString* value = [[AWPokerMgr getDetailDic] objectForKey:key];
    if (value!=nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:key 
                                                        message:value 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
#pragma mark - UISearchDisplayDelegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [_sortKeySearchArray removeAllObjects];
    [_heroSearchDic removeAllObjects];
    for (NSString* key in _sortKeyArray) {
        NSArray* keyComp = [key componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString* keyCombine =[keyComp componentsJoinedByString:@""];
        if ([keyCombine rangeOfString:searchString].location!=NSNotFound) {
            [_sortKeySearchArray addObject:key];
            [_heroSearchDic setObject:[_heroDic objectForKey:key] forKey:key];
        }
    }
    for (NSString* key in _sortKeyArray) {
        if ([_heroSearchDic objectForKey:key]==nil) {
            NSString* value = (NSString*)[_heroDic objectForKey:key];
            if ([value rangeOfString:searchString].location!=NSNotFound) {
                [_sortKeySearchArray addObject:key];
                [_heroSearchDic setObject:[_heroDic objectForKey:key] forKey:key];
            }
        }
    }
    return YES;
}
@end
