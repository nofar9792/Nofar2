//
//  DogSql.m
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogSql.h"

@implementation DogSql

+(bool)createTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ TEXT, %@ INTEGER, %@ TEXT)", DOGS_TABLE, USER_ID, NAME, AGE, PIC_REF];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed creating %@ table %s", DOGS_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(bool)dropTable:(sqlite3*)db{
    char* errormsg;
    
    NSString* sql = [NSString stringWithFormat:@"drop table IF EXISTS %@ ", DOGS_TABLE];
    int res = sqlite3_exec(db, [sql UTF8String], NULL, NULL, &errormsg);
    if(res != SQLITE_OK){
        NSLog(@"ERROR: failed droping %@ table %s", DOGS_TABLE, errormsg);
        return NO;
    }
    return YES;
}

+(bool)addToDogsTable:(sqlite3*)db userId:(long)userId dog:(Dog*)dog{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@,%@,%@,%@) values (?,?,?,?);", DOGS_TABLE, USER_ID, NAME, AGE, PIC_REF];

    if (sqlite3_prepare_v2(db,[query UTF8String],-1,&statment,nil) == SQLITE_OK){
        //sqlite3_bind_text(statment, 1, [[NSString stringWithFormat:@"%li",dogWalker.userId] UTF8String], -1, NULL);
        // guess
        sqlite3_bind_int(statment, 1, (int)userId);
        sqlite3_bind_text(statment, 2, [dog.name UTF8String], -1, NULL);
        sqlite3_bind_int(statment, 3, (int)dog.age);
        sqlite3_bind_text(statment, 4, [dog.picRef UTF8String], -1, NULL);
        
        if(sqlite3_step(statment) == SQLITE_DONE){
            return YES;
        }
    }

    NSLog(@"ERROR: addToDogWalkersTable failed %s",sqlite3_errmsg(db));
    return NO;
}

+(Dog*)getDogByUserId:(sqlite3*)db userId:(long)userId{
    sqlite3_stmt *statment;
    NSString* query = [NSString stringWithFormat:@"SELECT * from %@ where %@ = ?;",DOGS_TABLE, USER_ID];
    
    if (sqlite3_prepare_v2(db,[query UTF8String], -1,&statment,nil) == SQLITE_OK){
        NSString* userIdStr = [NSString stringWithFormat:@"%li", userId];
        
        sqlite3_bind_text(statment, 1, [userIdStr UTF8String],-1,NULL);
        
        if(sqlite3_step(statment) == SQLITE_ROW){
            NSString* name = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,2)];
            long age = [[NSString stringWithFormat:@"%s",sqlite3_column_text(statment,3)] longLongValue];
            NSString* picRef = [NSString stringWithFormat:@"%s",sqlite3_column_text(statment,4)];
            
            return [[Dog alloc]init:name age:age picRef:picRef];
        }
    }
    
    NSLog(@"ERROR: getUserById failed %s",sqlite3_errmsg(db));
    
    return nil;
}

@end
