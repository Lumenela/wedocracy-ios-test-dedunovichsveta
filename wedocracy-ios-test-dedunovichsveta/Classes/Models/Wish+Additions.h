//
//  Wish+Additions.h
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "Wish.h"

@interface Wish (Additions)

+ (Wish *)newFromJson:(NSDictionary *)json;

- (NSDictionary *)json;

@end
