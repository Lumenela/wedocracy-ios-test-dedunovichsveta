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
    [self.textField addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
}


- (void)textDidChange:(id)sender
{
    NSString *text= self.textField.text;
    switch (self.type) {
        case InfoTypeGift: {
            self.wish.gift = text;
            break;
        }
        case InfoTypePrice: {
            self.wish.amount = [[NSDecimalNumber alloc] initWithString:text];
            break;
        }
        case InfoTypeStore: {
            self.wish.store = text;
            break;
        }   
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
