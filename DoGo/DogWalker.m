//
//  DogWalker.m
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "DogWalker.h"
#import "Consts.h"
#import "Comment.h"

@implementation DogWalker

-(id)init:(long)userId userName:(NSString*)userName firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city

{
    self = [super init];
    if (self){
        self.userId = userId;
        self.userName = userName;
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
        self.address = address;
        self.city = city;
    }
    return self;
}
@end
