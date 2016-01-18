//
//  UserSql.h
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Consts.h"
#import "User.h"
#import "DogWalker.h"
#import "DogOwner.h"

@interface UserSql : NSObject

+(BOOL)createTable:(sqlite3*)db;

+(BOOL)dropTable:(sqlite3*)db;

+(User*)getUserById:(sqlite3*)db userId:(long)userId;

+(BOOL)addToUsersTable:(sqlite3*)db user:(User*)user;

@end
