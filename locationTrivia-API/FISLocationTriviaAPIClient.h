//
//  FISLocationTriviaAPIClient.h
//  locationTrivia-API
//
//  Created by Gan Chau on 7/14/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISLocationTriviaAPIClient : NSObject

//+ (void)starRepoWithFullName:(NSString *)fullName CompletionBlock:(void (^)(BOOL success))completionBlock;


+ (void)getLocationWithCompletion:(void (^)(NSArray *locationDictionary))completionBlock;
+ (void)createLocationWithName:(NSString *)name
                      latitude:(NSNumber *)latitude
                     longitude:(NSNumber *)longitude
               completionBlock:(void (^)(BOOL success))completionBlock;
+ (void)deleteLocationWithID:(NSNumber *)ID completionBlock:(void (^)(BOOL success))completionBlock;

@end
