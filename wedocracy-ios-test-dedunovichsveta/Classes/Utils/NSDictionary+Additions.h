//
//  NSDictionary+Additions.h
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

- (NSString *)stringForKey:(NSString *)key;
- (NSNumber *)boolForKey:(NSString *)key;
- (NSNumber *)integerNumberForKey:(NSString *)key;
- (NSDecimalNumber *)decimalNumberForKey:(NSString *)key;


@end
