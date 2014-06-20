//
//  WedocracyService.h
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void (^WedCompletionHandlerWithData)(id data, NSError *error);
typedef void (^WedCompletionHandler)(BOOL success,NSError *error);

@interface WedocracyService : AFHTTPRequestOperationManager

+ (instancetype)sharedInstance;

- (void)getWishlistsWithCompletionHandler:(WedCompletionHandler)handler;

- (void)updateWish:(id)wish withCompletionHandler:(WedCompletionHandler)handler;

@end
