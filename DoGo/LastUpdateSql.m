//
//  LastUpdateSql.m
//  DoGo
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LastUpdateSql.h"

@implementation LastUpdateSql

+(bool)createTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ TEXT PRIMARY KEY, %@ TEXT)",LAST_UPDATE_TABLE,TABLE_NAME,LAST_UPDATE_DATE];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed creating %@ table %s", LAST_UPDATE_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(bool)dropTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"drop table IF EXISTS %@ ",LAST_UPDATE_TABLE];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed droping %@ table %s", LAST_UPDATE_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(NSString*)getLastUpdateDate:(sqlite3*)db forTable:(NSString*)tableName{
    sqlite3_stmt *statment;
    
    NSString* query = [NSString stringWithFormat:@"SELECT %@ from %@ where %@ = ?;",LAST_UPDATE_DATE,LAST_UPDATE_TABLE,TABLE_NAME];
    
    if (sqlite3_prepare_v2(db,[query UTF8String], -1, &statment, nil) == SQLITE_OK){
        sqlite3_bind_text(statment, 1, [tableName UTF8String], -1, NULL);
        if(sqlite3_step(statment) == SQLITE_ROW){
            NSString* lastUpdate = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,0)];
            return lastUpdate;
        }
    }else{
        NSLog(@"ERROR: getLastUpdateDate failed %s",sqlite3_errmsg(db));
        return nil;
    }
    return nil;
}

+(void)setLastUpdateDate:(sqlite3*)db forTable:(NSString*)tableName{
    sqlite3_stmt *statment;
    NSString* date =[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
    
    NSString* query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO  %@ (%@,%@) values (?,?);",LAST_UPDATE_TABLE,TABLE_NAME,LAST_UPDATE_DATE];
    
    if (sqlite3_prepare_v2(db,[query UTF8String], -1, &statment, nil) == SQLITE_OK){
        sqlite3_bind_text(statment, 1, [tableName UTF8String], -1, NULL);
        sqlite3_bind_text(statment, 2, [date UTF8String], -1, NULL);
        if(sqlite3_step(statment) == SQLITE_DONE){
            return;
        }
        NSLog(@"failed update last update date");
    }else{
        NSLog(@"ERROR: failed setLastUpdateDate %s",sqlite3_errmsg(db));
    }
}

@end