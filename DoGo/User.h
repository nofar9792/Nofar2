//
//  User.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Consts.h"

@interface User : NSObject

@property long userId;
@property NSString* userName;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* phoneNumber;
@property NSString* address;
@property NSString* city;

@end