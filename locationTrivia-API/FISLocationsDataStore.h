//
//  FISLocationsDataStore.h
//  locationTrivia-dataStore
//
//  Created by Joe Burgess on 6/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISLocationsDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *locations;

+ (instancetype)sharedLocationsDataStore;
- (instancetype)init;
- (void)getLocationWithCompletion:(void (^)(BOOL success))completionBlock;
- (void)createLocationWithName:(NSString *)name
                      latitude:(NSNumber *)latitude
                     longitude:(NSNumber *)longitude
               completionBlock:(void (^)(BOOL success))completionBlock;
- (void)deleteWithID:(NSNumber *)ID completionBlock:(void (^)(BOOL success))completionBlock;

@end
