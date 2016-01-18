//
//  DogWalkerSql.h
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Consts.h"
#import "DogWalker.h"

@interface DogWalkerSql : NSObject

+(bool)createTable:(sqlite3*)db;

+(bool)dropTable:(sqlite3*)db;

+(bool)addToDogWalkersTable:(sqlite3*)db dogWalker:(DogWalker*)dogWalker;

+(void)addDogWalkerDetails:(sqlite3*)db dogWalker:(DogWalker*)dogWalker;

@end
