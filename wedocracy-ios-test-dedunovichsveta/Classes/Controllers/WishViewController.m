//
//  WishViewController.m
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "WishViewController.h"
#import "WishInfoCell.h"
#import "WedocracyService.h"
#import "AppDelegate.h"
#import <MBProgressHUD/MBProgressHUD.h>


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
}

- (Wish *)wish
{
    if (_wish) {
        return _wish;
    }
    _wish = [Wish MR_createEntity];
    return _wish;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ROW_COUNT;
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
    cell.type = InfoTypeGift;
    cell.wish = self.wish;
}


- (void)configurePriceCell:(WishInfoCell *)cell
{
    cell.titleLabel.text = @"Price";
    cell.textField.text = [NSString stringWithFormat:@"%@",self.wish.amount];
    cell.type = InfoTypePrice;
    cell.wish = self.wish;
}


- (void)configureStoreCell:(WishInfoCell *)cell
{
    cell.titleLabel.text = @"Store";
    cell.textField.text = self.wish.store;
    cell.type = InfoTypeStore;
    cell.wish = self.wish;
}


- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}


- (IBAction)save:(id)sender
{
    [self.view endEditing:YES];
    [MBProgressHUD showHUDAddedTo:ApplicationDelegate.window animated:YES];
    [[WedocracyService sharedInstance] updateWish:self.wish withCompletionHandler:^(BOOL success, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:ApplicationDelegate.window animated:YES];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        if (success) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            NSString *errorText = [NSString stringWithFormat:@"Error has occured. %@", error.localizedDescription];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:errorText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

@end
