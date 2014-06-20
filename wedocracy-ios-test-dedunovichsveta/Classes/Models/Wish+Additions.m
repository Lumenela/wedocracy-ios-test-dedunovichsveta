//
//  Wish+Additions.m
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "Wish+Additions.h"
#import "NSDictionary+Additions.h"

NSString * const WishWrapper = @"Wish";
NSString * const WishKeyId = @"id";
NSString * const WishKeyGift = @"gift";
NSString * const WishKeyIsCash = @"is_cash";
NSString * const WishKeyAmount = @"amount";
NSString * const WishKeyStore = @"store";
NSString * const WishKeyPhoto = @"photo";
NSString * const WishKeyItemUrl = @"item_url";
NSString * const WishKeyNotes = @"notes";
NSString * const WishKeyCreated = @"created";
NSString * const WishKeyModified = @"modified";

NSString * const WishAttributeNameWishId = @"wishId";

@implementation Wish (Additions)

+ (Wish *)newFromJson:(NSDictionary *)json
{
    json = [json objectForKey:WishWrapper];
    
    NSString *wishIdString = [json stringForKey:WishKeyId];
    Wish *wish = [Wish wishWithId:wishIdString];
    
    wish.gift = [json stringForKey:WishKeyGift];
    wish.isCash = [json boolForKey:WishKeyIsCash];
    wish.amount = [json decimalNumberForKey:WishKeyAmount];
    wish.store = [json stringForKey:WishKeyStore];
    wish.notes = [json stringForKey:WishKeyNotes];
    wish.itemUrl = [json stringForKey:WishKeyItemUrl];
    wish.photo = [json stringForKey:WishKeyPhoto];
    return wish;
}


+ (Wish *)wishWithId:(NSString *)wishIdString
{
    Wish *wish = nil;
    NSNumber *wishId = @([wishIdString integerValue]);
    NSArray *wishesWithThisId = [Wish MR_findByAttribute:WishAttributeNameWishId withValue:wishId];
    if (wishesWithThisId.count > 0) {
        wish = [wishesWithThisId objectAtIndex:0];
    } else {
        wish = [Wish MR_createEntity];
        wish.wishId = wishId;
    }
    return wish;
}

@end

/*
 {
 "Wish":{
 "id":"21",
 "gift":"",
 "is_cash":false,
 "amount":null,
 "store":null,
 "photo":null,
 "item_url":null,
 "notes":null,
 "created":"2014-06-19 08:39:40",
 "modified":"2014-06-19 08:39:40"
 }
 }
*/