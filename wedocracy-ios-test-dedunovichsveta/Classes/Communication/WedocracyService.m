//
//  WedocracyService.m
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import "WedocracyService.h"
#import "Wish+Additions.h"


NSString * const BaseURLString = @"http://wedocracy-ios-test.herokuapp.com/client/";
NSString * const AllWishlistsURL = @"request_index";
NSString * const EditWishUrl = @"request_edit/";
NSString * const DeleteWishUrl = @"request_delete/";
NSString * const AddWishUrl = @"request_add/";

NSString * const WishesKey = @"wishes";


@implementation WedocracyService

+ (instancetype)sharedInstance
{
    static WedocracyService *service;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:BaseURLString];
        service = [[WedocracyService alloc] initWithBaseURL:baseURL];
    });
    return service;
}

- (void)getWishlistsWithCompletionHandler:(WedCompletionHandler)handler
{
    AFHTTPRequestOperation *allWishlistsOperation = [self GET:AllWishlistsURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSManagedObjectContext *context = [NSManagedObjectContext MR_contextForCurrentThread];
        NSArray *wishes = [responseObject objectForKey:WishesKey];
        for (NSDictionary *json in wishes) {
            [Wish newFromJson:json];
        }
        [context MR_saveToPersistentStoreAndWait];
        handler(YES, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(NO, error);
    }];
    allWishlistsOperation.responseSerializer = [WedocracyService defaultResponseSerializer];

}


- (void)updateWish:(Wish *)wish withCompletionHandler:(WedCompletionHandler)handler
{
    NSString *url = [NSString stringWithFormat:@"%@%@", EditWishUrl, wish.wishId];
    NSDictionary *params = [wish json];
    AFHTTPRequestOperation *updateWish = [self PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(YES, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(NO, error);
    }];
    updateWish.responseSerializer = [WedocracyService defaultResponseSerializer];
}


- (void)deleteWish:(Wish *)wish withCompletionHandler:(WedCompletionHandler)handler
{
    NSString *url = [NSString stringWithFormat:@"%@%@", DeleteWishUrl, wish.wishId];
    AFHTTPRequestOperation *deleteWish = [self DELETE:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(YES, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(NO, error);
    }];
    deleteWish.responseSerializer = [WedocracyService defaultResponseSerializer];
}


- (void)newWishWithCompletionHandler:(WedCompletionHandler)handler
{
    AFHTTPRequestOperation *addWithOperation = [self POST:AddWishUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(YES, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(NO, error);
    }];
    addWithOperation.responseSerializer = [WedocracyService defaultResponseSerializer];
}


+ (AFJSONResponseSerializer *)defaultResponseSerializer
{
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    serializer.acceptableContentTypes = [WedocracyService acceptableContentTypes];
    return serializer;
}


+ (NSSet *)acceptableContentTypes
{
    static NSSet *contentTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        contentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", nil];
    });
    return contentTypes;
}

@end
