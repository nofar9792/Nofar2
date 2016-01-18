//
//  RequestSql.m
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RequestSql.h"

@implementation RequestSql

+(bool)createTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER , %@ INTEGER, %@ TEXT)", REQUESTS_TABLE, DOG_OWNER_ID, DOG_WALKER_ID, REQUEST_STATUS];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed creating %@ table", REQUESTS_TABLE);
        return NO;
    }
    return YES;
}

+(bool)dropTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"drop table IF EXISTS %@ )", REQUESTS_TABLE];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed droping %@ table", REQUESTS_TABLE);
        return NO;
    }
    return YES;
}

+(NSArray*)getRequestIdsForDogWalker:(sqlite3*)db dogWalkerId:(long)dogWalkerId{
    NSString* query = [NSString stringWithFormat:@"SELECT * from %@ where %@ = ? and %@ = ?;",REQUESTS_TABLE, DOG_WALKER_ID, REQUEST_STATUS];
    
    NSMutableArray* data = [[NSMutableArray alloc] init];
    sqlite3_stmt *statment;
    if (sqlite3_prepare_v2(db,[query UTF8String], -1,&statment,nil) == SQLITE_OK){
        NSString* dogWalkerIdStr = [NSString stringWithFormat:@"%li", dogWalkerId];
        sqlite3_bind_text(statment, 1, [dogWalkerIdStr UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 2, [[self convertToString:Waiting] UTF8String], -1, NULL);
            
         while(sqlite3_step(statment) == SQLITE_ROW){
            [data addObject:[NSNumber numberWithLong:[[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,2)] longLongValue]]];
        }
    }else{
        NSLog(@"ERROR: getStudents failed %s",sqlite3_errmsg(db));
    }
    
    return data;
}

+(NSArray*)getRequestIdsOfDogOwner:(sqlite3*)db dogOwnerId:(long)dogOwnerId{
    NSString* query = [NSString stringWithFormat:@"SELECT * from %@ where %@ = ? and %@ = ?;",REQUESTS_TABLE, DOG_OWNER_ID, REQUEST_STATUS];
    
    NSMutableArray* data = [[NSMutableArray alloc] init];
    sqlite3_stmt *statment;
    if (sqlite3_prepare_v2(db,[query UTF8String], -1,&statment,nil) == SQLITE_OK){
        NSString* dogOwnerIdStr = [NSString stringWithFormat:@"%li", dogOwnerId];
        sqlite3_bind_text(statment, 1, [dogOwnerIdStr UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 2, [[self convertToString:Waiting] UTF8String], -1, NULL);
        
        while(sqlite3_step(statment) == SQLITE_ROW){
            [data addObject:[NSNumber numberWithLong:[[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,1)] longLongValue]]];
        }
    }else{
        NSLog(@"ERROR: getStudents failed %s",sqlite3_errmsg(db));
    }
    
    return data;
}


+(NSArray*)getOwnersIdsConnectToWalker:(sqlite3*)db dogWalkerId:(long)dogWalkerId{
    NSString* query = [NSString stringWithFormat:@"SELECT * from %@ where %@ = ? and %@ = ?;",REQUESTS_TABLE, DOG_WALKER_ID, REQUEST_STATUS];
    
    NSMutableArray* data = [[NSMutableArray alloc] init];
    sqlite3_stmt *statment;
    if (sqlite3_prepare_v2(db,[query UTF8String], -1,&statment,nil) == SQLITE_OK){
        NSString* dogWalkerIdStr = [NSString stringWithFormat:@"%li", dogWalkerId];
        sqlite3_bind_text(statment, 1, [dogWalkerIdStr UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 2, [[self convertToString:Accepted] UTF8String], -1, NULL);
        
        while(sqlite3_step(statment) == SQLITE_ROW){
            [data addObject:[NSNumber numberWithLong:[[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,1)] longLongValue]]];
        }
    }else{
        NSLog(@"ERROR: getStudents failed %s",sqlite3_errmsg(db));
    }
    
    return data;
}

+(BOOL)addToRequestTable:(sqlite3*)db request:(Request*)request{
    sqlite3_stmt *statment;
    
    NSString* updateQuery = [NSString stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? and %@ = ?", REQUESTS_TABLE, REQUEST_STATUS ,DOG_OWNER_ID, DOG_WALKER_ID];
    
    if (sqlite3_prepare_v2(db,[updateQuery UTF8String],-1,&statment,nil) == SQLITE_OK){
        sqlite3_bind_text(statment, 1,[[self convertToString:request.status] UTF8String], -1, NULL);
        sqlite3_bind_int(statment, 2, (int)request.dogOwnerId);
        sqlite3_bind_int(statment, 3, (int)request.dogWalkerId);
        
        if(sqlite3_step(statment) == SQLITE_DONE){
            YES;
        }
    }

    
    NSString* insertQuery = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@) values (?,?,?);", REQUESTS_TABLE, DOG_OWNER_ID, DOG_WALKER_ID, REQUEST_STATUS];
    
    
    if (sqlite3_prepare_v2(db,[insertQuery UTF8String],-1,&statment,nil) == SQLITE_OK){
        sqlite3_bind_int(statment, 1, (int)request.dogOwnerId);
        sqlite3_bind_int(statment, 2, (int)request.dogWalkerId);
        sqlite3_bind_text(statment, 3, [[self convertToString:request.status] UTF8String], -1, NULL);
        
        if(sqlite3_step(statment) == SQLITE_DONE){
            YES;
        }
    }
    
    NSLog(@"ERROR: addToRequestTable failed %s",sqlite3_errmsg(db));
    return NO;
}

+(NSString*)convertToString:(enum RequestStatus)requestStatus{
    NSString* result = nil;
    
    switch (requestStatus) {
        case Waiting:
            result = @"Waiting";
            break;
        case Accepted:
            result = @"Accepted";
            break;
        case Declined:
            result = @"Declined";
            break;
    }
    return result;
}

@end
