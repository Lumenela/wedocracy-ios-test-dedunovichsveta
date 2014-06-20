//
//  Wish.h
//  wedocracy-ios-test-dedunovichsveta
//
//  Created by Sveta Dedunovich on 6/20/14.
//  Copyright (c) 2014 Lumenela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Wish : NSManagedObject

@property (nonatomic, retain) NSNumber * wishId;
@property (nonatomic, retain) NSString * gift;
@property (nonatomic, retain) NSNumber * isCash;
@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSString * store;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSString * itemUrl;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSDate * modified;
@property (nonatomic, retain) NSString * pathToPhoto;

@end
