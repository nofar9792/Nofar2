//
//  ModelSql.h
//  DoGo
//
//  Created by Admin on 1/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "LastUpdateSql.h"
#import "UserSql.h"
#import "DogSql.h"
#import "DogWalkerSql.h"
#import "RequestSql.h"
#import "Consts.h"

@interface ModelSql : NSObject{
    sqlite3* database;
}

-(User* )getUserById:(long) userId;

-(bool)addDogWalker:(DogWalker*)dogWalker;

-(bool)addDogOwner:(DogOwner*)dogOwner;

// waiting requests for dog walker
-(NSArray*)getRequestForDogWalker:(long)dogWalkerId;

// waiting requests of dog owner
-(NSArray*)getRequestOfDogOwner:(long)dogOwnerId;

-(NSArray*)getOwnersConnectToWalker:(long)dogWalkerId;

-(bool)addRequest:(Request*)request ;

-(NSString*)getRequestsLastUpdateDate;

-(void)setRequestsLastUpdateDate;

@end
