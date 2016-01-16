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
+(NSArray*)getOwnersIdsConnectedToWalker:(long)dogWalkerId ;
+(NSArray*)getWalkersIdsConnectedToOwner:(long)dogOwnerId ;
+(NSArray*)getRequestForDogWalker:(long)dogWalkerId;
+(NSArray*)getRequestOfDogOwner:(long)dogOwnerId;
+(bool)updateRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus;


@end
