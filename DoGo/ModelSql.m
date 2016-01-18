//
//  ModelSql.m
//  DoGo
//
//  Created by Admin on 1/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ModelSql.h"

@implementation ModelSql

-(id)init{
    self = [super init];
    if (self) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        
        NSArray* paths = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        
        NSURL* directoryUrl = [paths objectAtIndex:0];
        
        NSURL* fileUrl = [directoryUrl URLByAppendingPathComponent:@"database.db"];
        
        NSString* filePath = [fileUrl path];
        
        const char* cFilePath = [filePath UTF8String];
        
        int res = sqlite3_open(cFilePath,&database);
        
        if(res != SQLITE_OK){
            NSLog(@"ERROR: fail to open db");
            database = nil;
        }
        
        
        [self upgradeTables];
    }
    return self;
}

-(User* )getUserById:(long) userId{
    User* user = [UserSql getUserById:database userId:userId];
    
    if(user){
        if([user isKindOfClass:[DogWalker class]]){
            [DogWalkerSql addDogWalkerDetails:database dogWalker:(DogWalker*)user];
        }else{
            ((DogOwner*)user).dog = [DogSql getDogByUserId:database userId:userId];
        }
    }
    return user;
}

-(bool)addDogWalker:(DogWalker*)dogWalker{
    if([UserSql addToUsersTable:database user:dogWalker]){
         return [DogWalkerSql addToDogWalkersTable:database dogWalker:dogWalker];
    }
    return NO;
}

-(bool)addDogOwner:(DogOwner*)dogOwner{
    if([UserSql addToUsersTable:database user:dogOwner]){
        return [DogSql addToDogsTable:database userId:dogOwner.userId dog:dogOwner.dog];
    }
    return NO;
}

// waiting requests for dog walker
-(NSArray*)getRequestForDogWalker:(long)dogWalkerId{
    NSArray* ids = [RequestSql getRequestIdsForDogWalker:database dogWalkerId:dogWalkerId];
    
    NSMutableArray* dogOwners = [[NSMutableArray alloc]init];
    for (int i = 0; i < ids.count; i++) {
        [dogOwners addObject:[self getUserById:[ids[i] longLongValue]]];
    }
    
    return dogOwners;
}

// waiting requests of dog owner
-(NSArray*)getRequestOfDogOwner:(long)dogOwnerId{
    NSArray* ids = [RequestSql getRequestIdsOfDogOwner:database dogOwnerId:dogOwnerId];
    
    NSMutableArray* dogWalkers = [[NSMutableArray alloc]init];
    for (int i = 0; i < ids.count; i++) {
        [dogWalkers addObject:[self getUserById:[ids[i] longLongValue]]];
    }
    
    return dogWalkers;
}

-(NSArray*)getOwnersConnectToWalker:(long)dogWalkerId {
    NSArray* ids = [RequestSql getOwnersIdsConnectToWalker:database dogWalkerId:dogWalkerId];
    NSMutableArray* dogOwners = [[NSMutableArray alloc]init];
    for (int i = 0; i < ids.count; i++) {
        [dogOwners addObject:[self getUserById:[ids[i] longLongValue]]];
    }
    
    return dogOwners;
}

-(bool)addRequest:(Request*)request {
    return [RequestSql addToRequestTable:database request:request];
}

-(NSString*)getRequestsLastUpdateDate{
    return [LastUpdateSql getLastUpdateDate:database forTable:REQUESTS_TABLE];
}

-(void)setRequestsLastUpdateDate{
    [LastUpdateSql setLastUpdateDate:database forTable:REQUESTS_TABLE];
}


-(void)createTables{
    [LastUpdateSql createTable:database];
    [UserSql createTable:database];
    [DogWalkerSql createTable:database];
    [DogSql createTable:database];
    [RequestSql createTable:database];
}

-(void)upgradeTables{
    [LastUpdateSql dropTable:database];
    [UserSql dropTable:database];
    [DogWalkerSql dropTable:database];
    [DogSql dropTable:database];
    [RequestSql dropTable:database];
    
    [self createTables];
}
@end
