//
//  UserParse.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Parse/Parse.h>
#import "UserParse.h"
#import "User.h"
#import "DogWalker.h"
#import "DogOwner.h"

@implementation UserParse

// check what happends if username already exist or sign up fails
+(long)addToUsersTable:(NSString*)username password:(NSString*)password firstName:(NSString*)
firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city isDogWalker:(bool)isDogWalker{
    if([self isUsernameAlreadyExist:username]){
        @throw [NSException exceptionWithName:@"invalidUsername" reason:@"username is already exist" userInfo:nil];
    }
    
    long newUserId = [self getNextId];
    PFUser* parseUser = [PFUser user];
    parseUser[USER_ID] = [NSNumber numberWithLong:newUserId];
    parseUser.username = username;
    parseUser.password = password;
    parseUser[FIRST_NAME] = firstName;
    parseUser[LAST_NAME] = lastName;
    parseUser[PHONE_NUMBER] = phoneNumber;
    parseUser[ADDRESS] = address;
    parseUser[CITY] = city;
    
    
    if(isDogWalker){
        parseUser[IS_DOG_WALKER] = [NSNumber numberWithBool:YES];
    }else{
         parseUser[IS_DOG_WALKER] = [NSNumber numberWithBool:NO];
    }
   
    if(![parseUser signUp]){
        return 0;
    }

    // check if throw exception if signup failed
//    -(BOOL)signup:(NSString*)user pwd:(NSString*)pwd{
//        NSError* error;
//        PFUser* puser = [PFUser user];
//        puser.username = user;
//        puser.password = pwd;
//        return [puser signUp:&error];
//    }
    
    return newUserId;
}

+(User*)login:(NSString*)username password:(NSString*)password{
    PFUser* parseUser = [PFUser logInWithUsername:username password:password];
    
    return [self convertFromParseUserToUser:parseUser];
    
}

+(void)logOut{
    [PFUser logOut];
}

+(User*)getUserById:(long)userId{
    PFQuery* query = [[PFUser query] whereKey:USER_ID equalTo:[NSNumber numberWithLong:userId]];
    
    PFUser *parseUser = [query getFirstObject];
    
    return [self convertFromParseUserToUser:parseUser];
}

+(NSArray*)getDogWalkerUsers{
    PFQuery* query = [[PFUser query] whereKey:IS_DOG_WALKER equalTo:[NSNumber numberWithBool:YES]];

    NSMutableArray* dogWalkers = [[NSMutableArray alloc] init];
    
    NSArray* result = [query findObjects];
    for (PFUser* parseUser in result) {
        [dogWalkers addObject:[self convertFromParseUserToUser:parseUser]];
    }
    
    return dogWalkers;
}

+(bool)updateUser:(User*)user{
    PFQuery* query = [[PFUser query] whereKey:USER_ID equalTo:[NSNumber numberWithLong:user.userId]];
    
    PFUser *parseUser = [query getFirstObject];
    if(parseUser) {
        parseUser[FIRST_NAME] = user.firstName;
        parseUser[LAST_NAME] = user.lastName;
        parseUser[PHONE_NUMBER] = user.phoneNumber;
        parseUser[ADDRESS] = user.address;
        parseUser[CITY] = user.city;
        
        return [parseUser save];
    }
    
    return NO;
}

+(long)getNextId{
    PFQuery *query = [[PFUser query]orderByDescending:USER_ID];
    PFUser *user = [query getFirstObject];
    
    if(user){
        return ([user[USER_ID] longLongValue] + 1);
    }
    
    return 1;
}

+(bool)isUsernameAlreadyExist:(NSString*)username{
    PFQuery *query = [[PFUser query] whereKey:USERNAME equalTo:username];
    
    PFUser *parseUser = [query getFirstObject];
    if(parseUser) {
        return YES;
    }
    
    return NO;
    
}

+(User*)convertFromParseUserToUser:(PFUser*)parseUser{
    User* user = nil;
    if(parseUser){
        if([parseUser[IS_DOG_WALKER] intValue] == 1){
            user = [[DogWalker alloc] init:[parseUser[USER_ID] longLongValue] userName:parseUser.username firstName:parseUser[FIRST_NAME] lastName:parseUser[LAST_NAME] phoneNumber:parseUser[PHONE_NUMBER] address:parseUser[ADDRESS] city:parseUser[CITY]];
        }else{
            user = [[DogOwner alloc] init:[parseUser[USER_ID] longLongValue] userName:parseUser.username firstName:parseUser[FIRST_NAME] lastName:parseUser[LAST_NAME] phoneNumber:parseUser[PHONE_NUMBER] address:parseUser[ADDRESS] city:parseUser[CITY]];
        }
    }
    
    return user;
}

@end
