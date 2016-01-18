//
//  ModelParse.m
//  DoGo
//
//  Created by Admin on 12/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Parse/Parse.h>
#import "ModelParse.h"

@implementation ModelParse

-(id)init{
    self = [super init];
    if (self) {
        [Parse setApplicationId:@"ClCDxIalYQPR6IrVXUHtHQW99tazxTZOAFUnanLB"
                      clientKey:@"8EqrsIlUMqsfx8yxs9FjUndl0AO58cDHIJFp6wyY"];
        
    }
    return self;
}

// User Methods

-(User*)login:(NSString*)username password:(NSString*)password{
    User* user = [UserParse login:username password:password];
    
    if(user){
        [self addDetailsByInstance:user];
    }
    return user;
}

-(void)addDetailsByInstance:(User*)user{
    if([user isKindOfClass:[DogWalker class]]){
        //no comments
        [DogWalkerParse addDogWalkerDetails:(DogWalker*)user];
    }else{
        Dog* dog = [DogParse getDogByUserId:user.userId];
        ((DogOwner*)user).dog = dog;
    }
}

-(void)logOut{
    [UserParse logOut];
}

-(User*)getUserById:(long)userId{
    User* user = [UserParse getUserById:userId];
    
    if(user){
        [self addDetailsByInstance:user];
    }
    return user;
}

-(bool)updateUser:(User*)user{
    if([UserParse updateUser:user]){
        if([user isKindOfClass:[DogWalker class]]){
            return [DogWalkerParse updateDogWalker:(DogWalker*)user];
        }else{
            return [DogParse updateDog:user.userId dog:((DogOwner*)user).dog];
        }
    }
    
    return NO;
}

// Dog Methods

-(Dog*)getDogByUserId:(long)userId{
    return [DogParse getDogByUserId:userId];
}

-(bool)addDog:(long)userId dog:(Dog*)dog{
    return [DogParse addToDogsTable:userId dog:dog];
}


// Dog Walker Methods

-(NSArray*)getAllDogWalkers{
    NSArray* dogWalkers = [UserParse getDogWalkerUsers];
    for (DogWalker* dogWalker in dogWalkers) {
        [self addDetailsByInstance:dogWalker];
    }
    
    return dogWalkers;
}

-(long)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city age:(long)age priceForHour:(int)
priceForHour isComfortableOnMorning:(bool)isComfortableOnMorning isComfortableOnAfternoon:(bool)isComfortableOnAfternoon isComfortableOnEvening:(bool)isComfortableOnEvening{
    long userId = [UserParse addToUsersTable:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city isDogWalker:YES];
    [DogWalkerParse addToDogWalkersTable:userId age: age priceForHour:priceForHour isComfortableOnMorning:isComfortableOnMorning isComfortableOnAfternoon:isComfortableOnAfternoon isComfortableOnEvening:isComfortableOnEvening];
    return userId;
}

// Dog Owner Methods

-(long)addDogOwner:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city dog:(Dog*)dog{
    long userId = [UserParse addToUsersTable:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city isDogWalker:NO];
    [DogParse addToDogsTable:userId dog:dog];
    return userId;
}


// Trip Methods

-(NSArray*)getTripsByDogOwnerId:(long)dogOwnerId{
    NSArray* trips = [TripParse getTripsDetailsByDogOwnerId:dogOwnerId];
    
    for (Trip* trip in trips) {
        trip.dogWalker = (DogWalker*)[self getUserById:trip.dogWalkerId];
    }
    
    return trips;
}

-(NSArray*)getTripsByDogWalkerId:(long)dogWalkerId{
    NSArray* trips = [TripParse getTripsDetailsByDogWalkerId:dogWalkerId];
    
    for (Trip* trip in trips) {
        trip.dogOwner = (DogOwner*)[self getUserById:trip.dogOwnerId];
    }
    
    return trips;
}

-(long)startTrip:(long)dogOwnerId dogWalkerId:(long)dogWalkerId{
    return [TripParse startTrip:dogOwnerId dogWalkerId:dogWalkerId];
}

-(void)endTrip:(long)tripId{
    [TripParse endTrip:tripId];
}

-(void)payTrip:(long)tripId{
    [TripParse changeTripToPaid:tripId];
}

// Request Methods

-(bool)addRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus{
    return [RequestParse addToRequestsTable:dogOwnerId dogWalkerId:dogWalkerId requestStatus:requestStatus];
}

-(bool)acceptRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId{
    return [RequestParse updateRequest:dogOwnerId dogWalkerId:dogWalkerId requestStatus:Accepted];
}

-(bool)declineRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId{
    return [RequestParse updateRequest:dogOwnerId dogWalkerId:dogWalkerId requestStatus:Declined];
}

// waiting requests for dog walker
-(NSArray*)getRequestForDogWalker:(long)dogWalkerId {
    NSArray* ids = [RequestParse getRequestIdsForDogWalker:dogWalkerId];
    NSMutableArray* dogOwners = [[NSMutableArray alloc]init];
    for (int i = 0; i < ids.count; i++) {
        [dogOwners addObject:[self getUserById:[ids[i] longLongValue]]];
    }
    
    return dogOwners;
}

// waiting requests of dog owner
-(NSArray*)getRequestOfDogOwner:(long)dogOwnerId {
    NSArray* ids = [RequestParse getRequestIdsOfDogOwner:dogOwnerId];
    NSMutableArray* dogWalkers = [[NSMutableArray alloc]init];
    for (int i = 0; i < ids.count; i++) {
        [dogWalkers addObject:[self getUserById:[ids[i] longLongValue]]];
    }
    
    return dogWalkers;
}

// connections
-(NSArray*)getOwnersConnectToWalker:(long)dogWalkerId {
    NSArray* ids = [RequestParse getOwnersIdsConnectedToWalker:dogWalkerId];
    NSMutableArray* dogOwners = [[NSMutableArray alloc]init];
    for (int i = 0; i < ids.count; i++) {
        [dogOwners addObject:[self getUserById:[ids[i] longLongValue]]];
    }
    
    return dogOwners;
}

// get all status requests of dog walker
-(NSArray*)getRequestByDogWalker:(long)dogWalkerId fromDate:(NSString*)fromDate{
    NSMutableArray* requests = (NSMutableArray*)[RequestParse getRequestByDogWalker:dogWalkerId fromDate:fromDate];
    
    for (Request* request in requests) {
        request.dogOwner = (DogOwner*)[self getUserById:request.dogOwnerId];
    }
    
    return  requests;
}

// get all status requests of dog owner
-(NSArray*)getRequestByDogOwner:(long)dogOwnerId fromDate:(NSString*)fromDate{
    NSMutableArray* requests = (NSMutableArray*)[RequestParse getRequestByDogOwner:dogOwnerId fromDate:fromDate];
    for (Request* request in requests) {
        request.dogWalker = (DogWalker*)[self getUserById:request.dogWalkerId];
    }
    
    return requests;
}

// Image Methods

-(void)saveImage:(UIImage*)image imageName:(NSString*)imageName{
    [ImageParse saveImage:image imageName:imageName];
}

-(UIImage*)getImage:(NSString*)imageName{
    return [ImageParse getImage:imageName];
}

@end
