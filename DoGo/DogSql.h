//
//  DogSql.h
//  DoGo
//
//  Created by Admin on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Consts.h"
#import "Dog.h"

@interface DogSql : NSObject

+(bool)createTable:(sqlite3*)db;

+(bool)dropTable:(sqlite3*)db;

+(bool)addToDogsTable:(sqlite3*)db userId:(long)userId dog:(Dog*)dog;

+(Dog*)getDogByUserId:(sqlite3*)db userId:(long)userId;
@end
