//
//  RequestParse.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Request.h"
#import "Consts.h"
#import "RequestStatus.h"

@interface RequestParse : NSObject

+(bool)addToRequestsTable:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus;
+(NSArray*)getOwnersIdsConnectedToWalker:(long)dogWalkerId;
+(NSArray*)getRequestIdsForDogWalker:(long)dogWalkerId;
+(NSArray*)getRequestIdsOfDogOwner:(long)dogOwnerId;
+(NSArray*)getRequestByDogWalker:(long)dogWalkerId fromDate:(NSString*)fromDate;
+(NSArray*)getRequestByDogOwner:(long)dogOwnerId fromDate:(NSString*)fromDate;
+(bool)updateRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus;


@end
