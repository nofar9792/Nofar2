//
//  ModelParse.m
//  DoGo
//
//  Created by Admin on 12/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Parse/Parse.h>
#import "ModelParse.h"
#import "UserParse.h"
#import "DogWalkerParse.h"
#import "DogParse.h"
#import "RequestParse.h"
#import "TripParse.h"

@implementation ModelParse

-(id)init{
    self = [super init];
    if (self) {
        [Parse setApplicationId:@"ClCDxIalYQPR6IrVXUHtHQW99tazxTZOAFUnanLB"
                      clientKey:@"8EqrsIlUMqsfx8yxs9FjUndl0AO58cDHIJFp6wyY"];
        
    }
    return self;
}

-(User*)getUserById:(long)userId{
    return [UserParse getUserById:userId];
}

-(User*)login:(NSString*)username password:(NSString*)password{
    return [UserParse login:username password:password];
}

-(void)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city{
    [UserParse addToUsersTable:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city isDogWalker:YES];
}

@end
