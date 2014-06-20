//
//  GiftInfoCell.m
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "WishInfoCell.h"

@interface WishInfoCell()<UITextFieldDelegate>

@end


@implementation WishInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
