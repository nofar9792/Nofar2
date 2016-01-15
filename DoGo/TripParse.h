//
//  TripParse.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Trip.h"
#import "Consts.h"

@interface TripParse : NSObject

+(long)startTrip:(long)dogOwnerId dogWalkerId:(long)dogWalkerId ;
+(void)endTrip:(long)tripId;
+(void)changeTripToPaid:(long)tripId;
+(NSArray*)getTripsDetailsByDogOwnerId:(long)dogOwnerId;
+(NSArray*)getTripsDetailsByDogWalkerId:(long)dogWalkerId;

@end
