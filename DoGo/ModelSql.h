//
//  ModelSql.h
//  DoGo
//
//  Created by Admin on 1/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ModelSql : NSObject{
    sqlite3* database;
}

@end
