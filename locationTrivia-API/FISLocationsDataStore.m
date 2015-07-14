//
//  FISLocationsDataStore.m
//  locationTrivia-dataStore
//
//  Created by Joe Burgess on 6/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISLocationsDataStore.h"
#import "FISLocationTriviaAPIClient.h"
#import "FISLocation.h"

@implementation FISLocationsDataStore


+ (instancetype)sharedLocationsDataStore {
    static FISLocationsDataStore *_sharedLocationsDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLocationsDataStore = [[FISLocationsDataStore alloc] init];
    });

    return _sharedLocationsDataStore;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locations = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)getLocationWithCompletion:(void (^)(BOOL))completionBlock
{
    [FISLocationTriviaAPIClient getLocationWithCompletion:^(NSArray *locationDictionary) {
        [self.locations removeAllObjects];
        for (NSDictionary *location in locationDictionary) {
            [self.locations addObject:[FISLocation locationFromDictionary:location]];
        }
        completionBlock(YES);
    }];
}

- (void)createLocationWithName:(NSString *)name
                      latitude:(NSNumber *)latitude
                     longitude:(NSNumber *)longitude
               completionBlock:(void (^)(BOOL))completionBlock
{
    [FISLocationTriviaAPIClient createLocationWithName:name
                                              latitude:latitude
                                             longitude:longitude
                                       completionBlock:^(BOOL success) {
                                           if (success) {
                                               completionBlock(YES);
                                           }
                                       }];
}

- (void)deleteWithID:(NSNumber *)ID completionBlock:(void (^)(BOOL))completionBlock
{
    [FISLocationTriviaAPIClient deleteLocationWithID:ID
                                     completionBlock:^(BOOL success) {
                                         if (success) {
                                             completionBlock(YES);
                                         }
                                     }];
}

@end
