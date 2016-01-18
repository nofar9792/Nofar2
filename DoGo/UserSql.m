//
//  UserSql.m
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UserSql.h"

@implementation UserSql

+(BOOL)createTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ BOOLEAN)", USER_TABLE, USER_ID, USERNAME, FIRST_NAME, LAST_NAME, PHONE_NUMBER, ADDRESS, CITY, IS_DOG_WALKER];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed creating %@ table %s", USER_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(BOOL)dropTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"drop table IF EXISTS %@ ", USER_TABLE];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed droping %@ table %s", USER_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(User*)getUserById:(sqlite3*)db userId:(long)userId{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"SELECT * from %@ where %@ = ?;",USER_TABLE, USER_ID];
    
    if (sqlite3_prepare_v2(db,[query UTF8String], -1,&statment,nil) == SQLITE_OK){
        NSString* userIdStr = [NSString stringWithFormat:@"%li", userId];
                            
        sqlite3_bind_text(statment, 1, [userIdStr UTF8String],-1,NULL);
        
        if(sqlite3_step(statment) == SQLITE_ROW){
            NSString* userName = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,2)];
            NSString* firstName = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,3)];
            NSString* lastName = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,4)];
            NSString* phoneNumber = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,5)];
            NSString* address = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,6)];
            NSString* city = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,7)];
            bool isDogWalker = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,8)] intValue] == 1;
            
            User* user = nil;
            
            if(isDogWalker){
                user = [[DogWalker alloc]init:userId userName:userName firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city];
            }
            else{
                user = [[DogOwner alloc]init:userId userName:userName firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city];
            }
            
            
            return user;
        }
    }
    
    NSLog(@"ERROR: getUserById failed %s",sqlite3_errmsg(db));
    
    return nil;
}

+(BOOL)addToUsersTable:(sqlite3*)db user:(User*)user{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@) values (?,?,?,?,?,?,?,?);", USER_TABLE, USER_ID ,USERNAME, FIRST_NAME, LAST_NAME, PHONE_NUMBER, ADDRESS, CITY, IS_DOG_WALKER];

    
    if (sqlite3_prepare_v2(db,[query UTF8String],-1,&statment,nil) == SQLITE_OK){
        //sqlite3_bind_text(statment, 1, [[NSString stringWithFormat:@"%li",user.userId] UTF8String], -1, NULL);
             // guess
        //sqlite3_bind_int(statment, 1, (int)user.userId);
        sqlite3_bind_text(statment, 2, [user.userName UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 3, [user.firstName UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 4, [user.lastName UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 5, [user.phoneNumber UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 6, [user.address UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 7, [user.city  UTF8String], -1, NULL);
        
        if([user isKindOfClass:[DogWalker class]]){
           // guess
            sqlite3_bind_int(statment, 8, (int)[NSNumber numberWithBool:YES]);

        }else{
            // guess
            sqlite3_bind_int(statment, 8, (int)[NSNumber numberWithBool:NO]);
        }
        
        if(sqlite3_step(statment) == SQLITE_DONE){
            YES;
        }
    }

    NSLog(@"ERROR: addToUsersTable failed %s",sqlite3_errmsg(db));
    return NO;
}

@end
