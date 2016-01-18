//
//  RequestSql.h
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Consts.h"
#import "Request.h"
#import "RequestStatus.h"

@interface RequestSql : NSObject

+(bool)createTable:(sqlite3*)db;

+(bool)dropTable:(sqlite3*)db;

+(NSArray*)getRequestIdsForDogWalker:(sqlite3*)db dogWalkerId:(long)dogWalkerId;

+(NSArray*)getRequestIdsOfDogOwner:(sqlite3*)db dogOwnerId:(long)dogOwnerId;

+(NSArray*)getOwnersIdsConnectToWalker:(sqlite3*)db dogWalkerId:(long)dogWalkerId;

+(BOOL)addToRequestTable:(sqlite3*)db request:(Request*)request;

@end
