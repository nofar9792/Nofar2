//
//  DogConsts.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Consts : NSObject
 
//User
extern NSString *const USER_TABLE;
extern NSString *const USER_ID;
extern NSString *const USERNAME;
extern NSString *const FIRST_NAME;
extern NSString *const LAST_NAME;
extern NSString *const PHONE_NUMBER;
extern NSString *const ADDRESS;
extern NSString *const CITY;
extern NSString *const IS_DOG_WALKER;

// Dog Walker
extern NSString *const DOG_WALKERS_TABLE;
//extern NSString *const USER_ID;
extern NSString *const AGE;
extern NSString *const PRICE_FOR_HOUR;
extern NSString *const IS_COMFORTABLE_ON_MORNING;
extern NSString *const IS_COMFORTABLE_ON_AFTERNOON;
extern NSString *const IS_COMFORTABLE_ON_EVENING;

// Dog
extern NSString *const DOGS_TABLE;
//extern NSString *const USER_ID;
extern NSString *const NAME;
//extern NSString *const AGE;
extern NSString *const PIC_REF;

// Trip
extern NSString *const TRIPS_TABLE;
extern NSString *const TRIP_ID;
extern NSString *const DOG_OWNER_ID;
extern NSString *const DOG_WALKER_ID;
extern NSString *const START_OF_WALKING;
extern NSString *const END_OF_WALKING;
extern NSString *const IS_PAID;

// Request
extern NSString *const REQUESTS_TABLE;
//extern NSString *const DOG_OWNER_ID;
//extern NSString *const DOG_WALKER_ID;
extern NSString *const REQUEST_STATUS;

@end
