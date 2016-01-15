//
//  DogWalker.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface DogWalker : User

@property long age;
@property int priceForHour;
@property bool isComfortableOnMorning;
@property bool isComfortableOnAfternoon;
@property bool isComfortableOnEvening;

-(id)init:(long)userId userName:(NSString*)userName firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city;

@end
