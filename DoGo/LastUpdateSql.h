//
//  LastUpdateSql.h
//  DoGo
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Consts.h"

@interface LastUpdateSql : NSObject

+(bool)createTable:(sqlite3*)db;
+(bool)dropTable:(sqlite3*)db;
+(NSString*)getLastUpdateDate:(sqlite3*)db forTable:(NSString*)table;
+(void)setLastUpdateDate:(sqlite3*)db forTable:(NSString*)table;

@end
