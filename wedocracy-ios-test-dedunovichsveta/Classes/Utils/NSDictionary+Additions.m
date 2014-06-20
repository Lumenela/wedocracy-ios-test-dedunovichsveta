//
//  NSDictionary+Additions.m
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (NSString *)stringForKey:(NSString *)key
{
    NSString *string = [self objectForKey:key];
    if (string && ![string isEqual:[NSNull null]]) {
        return string;
    }
    return nil;
}


- (NSNumber *)boolForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (object && ![object isEqual:[NSNull null]]) {
        return @([object boolValue]);
    }
    return nil;
}

- (NSNumber *)integerNumberForKey:(NSString *)key
{
    NSString *numberString = [self objectForKey:key];
    if (numberString && ![numberString isEqual:[NSNull null]]) {
        return @([numberString integerValue]);
    }
    return nil;
}


- (NSDecimalNumber *)decimalNumberForKey:(NSString *)key
{
    NSString *numberString = [self objectForKey:key];
    if (numberString && ![numberString isEqual:[NSNull null]]) {
        return [NSDecimalNumber decimalNumberWithString:numberString];
    }
    return nil;
}

@end
