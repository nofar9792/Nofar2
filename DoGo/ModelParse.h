//
//  ModelParse.h
//  DoGo
//
//  Created by Admin on 12/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DogConsts.h"
#import "User.h"
#import "UserParse.h"

@interface ModelParse : NSObject

-(User*)getUserById:(long)userId;

-(User*)login:(NSString*)username password:(NSString*)password;

-(void)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city;

@end
