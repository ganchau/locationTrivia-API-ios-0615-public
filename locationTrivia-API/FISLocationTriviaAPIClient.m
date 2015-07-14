//
//  FISLocationTriviaAPIClient.m
//  locationTrivia-API
//
//  Created by Gan Chau on 7/14/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISLocationTriviaAPIClient.h"
#import "AFNetworking.h"


@implementation FISLocationTriviaAPIClient

NSString *const LOCATION_TRIVIA_API_URL = @"http://locationtrivia.herokuapp.com";
NSString *const API_KEY = @"d5497e28cc91765fe1366c862c7254d5fac3f3a9";

+ (void)getLocationWithCompletion:(void (^)(NSArray *))completionBlock
{
    NSString *locationTriviaURL = [NSString stringWithFormat:@"%@/locations.json?key=%@",LOCATION_TRIVIA_API_URL, API_KEY];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:locationTriviaURL
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"%@", responseObject);
             completionBlock(responseObject);
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Fail: %@",error.localizedDescription);
         }];
}

+ (void)createLocationWithName:(NSString *)name latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude completionBlock:(void (^)(BOOL))completionBlock
{
    NSString *locationTriviaURL = [NSString stringWithFormat:@"%@/locations.json?key=%@",LOCATION_TRIVIA_API_URL, API_KEY];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{ @"location[name]" : name,
                              @"location[latitude]" : latitude,
                              @"location[longitude]" : longitude};
    
    [manager POST:locationTriviaURL
       parameters:params
          success:^(NSURLSessionDataTask *task, id responseObject) {
              completionBlock(YES);
          } failure:^(NSURLSessionDataTask *task, NSError *error) {
              completionBlock(NO);
          }];
}

+ (void)deleteLocationWithID:(NSNumber *)ID completionBlock:(void (^)(BOOL))completionBlock
{
    NSString *locationTriviaURL = [NSString stringWithFormat:@"%@/locations/%@.json?key=%@",LOCATION_TRIVIA_API_URL, ID, API_KEY];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager DELETE:locationTriviaURL
       parameters:nil
          success:^(NSURLSessionDataTask *task, id responseObject) {
              completionBlock(YES);
          } failure:^(NSURLSessionDataTask *task, NSError *error) {
              completionBlock(NO);
          }];
}

@end
