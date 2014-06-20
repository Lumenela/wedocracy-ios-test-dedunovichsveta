//
//  WishViewController.m
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "WishViewController.h"
#import "WishInfoCell.h"


typedef NS_ENUM(NSInteger, TableRowIndex) {
    TableRowIndexGift = 0,
    TableRowIndexPrice = 1,
    TableRowIndexStore = 2
};

#define ROW_COUNT 3


@interface WishViewController ()

@end


@implementation WishViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wish ? ROW_COUNT : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"CellId";
    WishInfoCell *cell = (WishInfoCell *)[tableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    if (!cell) {
        cell = [[WishInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


- (void)configureCell:(WishInfoCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row) {
        case TableRowIndexGift: {
            [self configureGiftCell:cell];
            break;
        }
        case TableRowIndexPrice: {
            [self configurePriceCell:cell];
            break;
        }
        case TableRowIndexStore: {
            [self configureStoreCell:cell];
            break;
        }   
        default:
            break;
    }
}


- (void)configureGiftCell:(WishInfoCell *)cell
{
    cell.titleLabel.text = @"Gift";
    cell.textField.text = self.wish.gift;
}


- (void)configurePriceCell:(WishInfoCell *)cell
{
    cell.titleLabel.text = @"Price";
    cell.textField.text = [NSString stringWithFormat:@"%@",self.wish.amount];
}


- (void)configureStoreCell:(WishInfoCell *)cell
{
    cell.titleLabel.text = @"Store";
    cell.textField.text = self.wish.store;
}


- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

@end