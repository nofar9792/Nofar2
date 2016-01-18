//
//  DogWalkerSql.m
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogWalkerSql.h"

@implementation DogWalkerSql


+(bool)createTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ INTEGER, %@ INTEGER, %@ BOOLEAN, %@ BOOLEAN, %@ BOOLEAN)", DOG_WALKERS_TABLE, USER_ID, AGE, PRICE_FOR_HOUR, IS_COMFORTABLE_ON_MORNING, IS_COMFORTABLE_ON_AFTERNOON, IS_COMFORTABLE_ON_EVENING];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed creating %@ table %s", DOG_WALKERS_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(bool)dropTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"drop table IF EXISTS %@ ", DOG_WALKERS_TABLE];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed droping %@ table %s", DOG_WALKERS_TABLE, errormsg);
        return NO;
    }
    return YES;
}


+(bool)addToDogWalkersTable:(sqlite3*)db dogWalker:(DogWalker*)dogWalker{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@,%@,%@,%@,%@,%@) values (?,?,?,?,?,?,?,?);", DOG_WALKERS_TABLE, USER_ID , AGE, PRICE_FOR_HOUR, IS_COMFORTABLE_ON_MORNING, IS_COMFORTABLE_ON_AFTERNOON, IS_COMFORTABLE_ON_EVENING];


    if (sqlite3_prepare_v2(db,[query UTF8String],-1,&statment,nil) == SQLITE_OK){
        //sqlite3_bind_text(statment, 1, [[NSString stringWithFormat:@"%li",dogWalker.userId] UTF8String], -1, NULL);
        // guess
        sqlite3_bind_int(statment, 1, (int)dogWalker.userId);
        sqlite3_bind_int(statment, 2, (int)dogWalker.age);
        sqlite3_bind_int(statment, 3, dogWalker.priceForHour);

        if(dogWalker.isComfortableOnMorning){
            // guess
            sqlite3_bind_int(statment, 4, (int)[NSNumber numberWithBool:YES]);

        }else{
            // guess
            sqlite3_bind_int(statment, 4, (int)[NSNumber numberWithBool:NO]);
        }
        
        if(dogWalker.isComfortableOnAfternoon){
            // guess
            sqlite3_bind_int(statment, 5, (int)[NSNumber numberWithBool:YES]);
            
        }else{
            // guess
            sqlite3_bind_int(statment, 5, (int)[NSNumber numberWithBool:NO]);
        }
        
        if(dogWalker.isComfortableOnEvening){
            // guess
            sqlite3_bind_int(statment, 6, (int)[NSNumber numberWithBool:YES]);
            
        }else{
            // guess
            sqlite3_bind_int(statment, 6, (int)[NSNumber numberWithBool:NO]);
        }

        if(sqlite3_step(statment) == SQLITE_DONE){
            YES;
        }
    }

    NSLog(@"ERROR: addToDogWalkersTable failed %s",sqlite3_errmsg(db));
    return NO;
}

+(void)addDogWalkerDetails:(sqlite3*)db dogWalker:(DogWalker*)dogWalker{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"SELECT * from %@ where %@ = ?;",DOG_WALKERS_TABLE, USER_ID];

    if (sqlite3_prepare_v2(db,[query UTF8String], -1,&statment,nil) == SQLITE_OK){
        NSString* userIdStr = [NSString stringWithFormat:@"%li", dogWalker.userId];

        sqlite3_bind_text(statment, 1, [userIdStr UTF8String],-1,NULL);

        if(sqlite3_step(statment) == SQLITE_ROW){
            dogWalker.age = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,2)] intValue];
            dogWalker.priceForHour = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,3)] intValue];
            dogWalker.isComfortableOnMorning = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,4)] intValue] == 1;
            dogWalker.isComfortableOnAfternoon = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,5)] intValue] == 1;
            dogWalker.isComfortableOnEvening = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,6)] intValue] == 1;
        }
    }

    NSLog(@"ERROR: addDogWalkerDetails failed %s",sqlite3_errmsg(db));
}

@end
