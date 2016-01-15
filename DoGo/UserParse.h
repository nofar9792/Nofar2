//
//  UserParse.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "User.h"
#import "Consts.h"
#import <Parse/Parse.h>

@interface UserParse : NSObject

+(long)addToUsersTable:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city isDogWalker:(bool)isDogWalker;

+(User*)login:(NSString*)username password:(NSString*)password;

+(void)logOut;

+(User*)getUserById:(long)userId;

+(NSArray*)getDogWalkerUsers;

+(bool)updateUser:(User*)user;

@end
