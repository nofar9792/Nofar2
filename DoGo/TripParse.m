//
//  TripParse.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TripParse.h"

@implementation TripParse

+(long)startTrip:(long)dogOwnerId dogWalkerId:(long)dogWalkerId {
    long tripId = [self getNextId];
    PFObject* parseObject = [PFObject objectWithClassName:TRIPS_TABLE];
    parseObject[TRIP_ID] = [NSNumber numberWithLong:tripId];
    parseObject[DOG_OWNER_ID] = [NSNumber numberWithLong:dogOwnerId];
    parseObject[DOG_WALKER_ID] = [NSNumber numberWithLong:dogWalkerId];
    parseObject[START_OF_WALKING] = [NSDate date];
    parseObject[IS_PAID] = [NSNumber numberWithBool:NO];
    
    [parseObject save];
    return tripId;
}

+(void)endTrip:(long)tripId {
    PFQuery* query = [PFQuery queryWithClassName:TRIPS_TABLE];
    [query whereKey:TRIP_ID equalTo:[NSNumber numberWithLong:tripId]];
    
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        parseObject[END_OF_WALKING] = [NSDate date];
        
        [parseObject save];
    }
}

+(void)changeTripToPaid:(long)tripId {
    PFQuery* query = [PFQuery queryWithClassName:TRIPS_TABLE];
    [query whereKey:TRIP_ID equalTo:[NSNumber numberWithLong:tripId]];
    
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        parseObject[IS_PAID] = [NSNumber numberWithBool:YES];
        
        [parseObject save];
    }
}

+(NSArray*)getTripsDetailsByDogOwnerId:(long)dogOwnerId{
    PFQuery* query = [PFQuery queryWithClassName:TRIPS_TABLE];
    [query whereKey:DOG_OWNER_ID equalTo:[NSNumber numberWithLong:dogOwnerId]];
    
    NSMutableArray* trips = [[NSMutableArray alloc] init];
    NSArray* result = [query findObjects];
    
    for (PFObject* parseObject in result) {
        long tripId = [parseObject[TRIP_ID] longLongValue];
        long dogWalkerId = [parseObject[DOG_WALKER_ID] longLongValue];

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //[dateFormatter setDateFormat:@"dd-MM-yyyy"];
        
        NSDate* startOfWalking = [dateFormatter dateFromString:parseObject[START_OF_WALKING]];
        NSDate* endOfWalking = [dateFormatter dateFromString:parseObject[END_OF_WALKING]];
        bool isPaid = [parseObject[IS_PAID] intValue] == 1;
        
        Trip* trip = [[Trip alloc]init:tripId dogOwnerId:dogOwnerId dogWalkerId:dogWalkerId startOfWalking:startOfWalking endOfWalking:endOfWalking isPaid:isPaid];
        [trips addObject:trip];
    }
    
    return trips;

}

+(NSArray*)getTripsDetailsByDogWalkerId:(long)dogWalkerId{
    PFQuery* query = [PFQuery queryWithClassName:TRIPS_TABLE];
    [query whereKey:DOG_WALKER_ID equalTo:[NSNumber numberWithLong:dogWalkerId]];
    
    NSMutableArray* trips = [[NSMutableArray alloc] init];
    NSArray* result = [query findObjects];
    
    for (PFObject* parseObject in result) {
        long tripId = [parseObject[TRIP_ID] longLongValue];
        long dogOwnerId = [parseObject[DOG_OWNER_ID] longLongValue];
//        
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        
        NSDate* startOfWalking = parseObject[START_OF_WALKING];
        NSDate* endOfWalking = parseObject[END_OF_WALKING];
        bool isPaid = [parseObject[IS_PAID] intValue] == 1;
        
        Trip* trip = [[Trip alloc]init:tripId dogOwnerId:dogOwnerId dogWalkerId:dogWalkerId startOfWalking:startOfWalking endOfWalking:endOfWalking isPaid:isPaid];
        [trips addObject:trip];
    }
    
    return trips;
}


+(long)getNextId{
    PFQuery* query = [[PFQuery queryWithClassName:TRIPS_TABLE] orderByDescending:TRIP_ID];
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        return ([parseObject[TRIP_ID] longLongValue] + 1);
    }
    
    return 1;
}

@end
