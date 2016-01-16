//
//  ModelParse.h
//  DoGo
//
//  Created by Admin on 12/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserParse.h"
#import "DogWalkerParse.h"
#import "DogParse.h"
#import "RequestParse.h"
#import "TripParse.h"
#import "ImageParse.h"

@interface ModelParse : NSObject

// User Methods
-(User*)login:(NSString*)username password:(NSString*)password;
-(void)logOut;
-(User*)getUserById:(long)userId;
-(bool)updateUser:(User*)user;

// Dog Methods
-(Dog*)getDogByUserId:(long)userId;
-(bool)addDog:(long)userId dog:(Dog*)dog;

// Dog Walker Methods
-(NSArray*)getAllDogWalkers;
-(long)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city age:(long)age priceForHour:(int)
priceForHour isComfortableOnMorning:(bool)isComfortableOnMorning isComfortableOnAfternoon:(bool)isComfortableOnAfternoon isComfortableOnEvening:(bool)isComfortableOnEvening;

// Dog Owner Methods
-(long)addDogOwner:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city dog:(Dog*)dog;

// Trip Methods
-(NSArray*)getTripsByDogOwnerId:(long)dogOwnerId;
-(NSArray*)getTripsByDogWalkerId:(long)dogWalkerId;
-(long)startTrip:(long)dogOwnerId dogWalkerId:(long)dogWalkerId;
-(void)endTrip:(long)tripId;
-(void)payTrip:(long)tripId;

// Request Methods

// Image Methods
-(void)saveImage:(UIImage*)image imageName:(NSString*)imageName;

-(UIImage*)getImage:(NSString*)imageName;

@end
