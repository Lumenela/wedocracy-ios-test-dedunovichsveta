//
//  GiftInfoCell.h
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wish.h"

typedef NS_ENUM(NSInteger, InfoType) {
    InfoTypeGift = 0,
    InfoTypePrice = 1,
    InfoTypeStore = 2
};

@interface WishInfoCell : UITableViewCell

@property (nonatomic, strong) Wish *wish;
@property (nonatomic, assign) InfoType type;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end
