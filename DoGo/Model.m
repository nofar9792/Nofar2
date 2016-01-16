//
//  Model.m
//  DoGo
//
//  Created by Admin on 12/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Model.h"
#import "ModelParse.h"
#import "ModelSql.h"
#import "DogOwner.h"
#import "DogWalker.h"
#import "Dog.h"
#import "Trip.h"
#import "Request.h"

@implementation Model

static Model* instance = nil;

+(Model*)instance{
    @synchronized(self){
        if (instance == nil) {
            instance = [[Model alloc] init];
        }
    }
    return instance;
}

-(id)init{
    self = [super init];
    if (self) {
        self.modelSql = [[ModelSql alloc] init];
        self.modelParse = [[ModelParse alloc] init];
    }
    return self;
}

// User Methods

-(User*)login:(NSString*)username password:(NSString*)password{
    return [self.modelParse login:username password:password];
}

-(void)logOut{
    [self.modelParse logOut];
}
-(User*)getUserById:(long)userId{
    return [self.modelParse getUserById:userId];
}

-(bool)updateUser:(User*)user{
    return [self.modelParse updateUser:user];
}

// Dog Waslker Methods

-(NSArray*)getAllDogWalkers{
    return [self.modelParse getAllDogWalkers];
}

-(long)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city age:(long)age priceForHour:(int)
priceForHour isComfortableOnMorning:(bool)isComfortableOnMorning isComfortableOnAfternoon:(bool)isComfortableOnAfternoon isComfortableOnEvening:(bool)isComfortableOnEvening{
    return [self.modelParse addDogWalker:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city age:age priceForHour:priceForHour isComfortableOnMorning:isComfortableOnMorning isComfortableOnAfternoon:isComfortableOnAfternoon isComfortableOnEvening:isComfortableOnEvening];
}

//region Dog Owner Methods

-(long)addDogOwner:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city dog:(Dog*)dog{
    return [self.modelParse addDogOwner:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city dog:dog];
}

// Trip Methods

-(NSArray*)getTripsByDogOwnerId:(long)dogOwnerId{
    return [self.modelParse getTripsByDogOwnerId:dogOwnerId];
}

-(NSArray*)getTripsByDogWalkerId:(long)dogWalkerId{
    return [self.modelParse getTripsByDogWalkerId:dogWalkerId];
}

-(long)startTrip:(long)dogOwnerId dogWalkerId:(long)dogWalkerId{
    return [self.modelParse startTrip:dogOwnerId dogWalkerId:dogWalkerId];
}

-(void)endTrip:(long)tripId{
    [self.modelParse endTrip:tripId];
}

-(void)payTrip:(long)tripId{
    [self.modelParse payTrip:tripId];
}

// Request Methods
-(bool)addRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId requestStatus:(enum RequestStatus)requestStatus{
    return [self.modelParse addRequest:dogOwnerId dogWalkerId:dogWalkerId requestStatus:requestStatus];
}

-(bool)acceptRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId{
    return [self.modelParse acceptRequest:dogOwnerId dogWalkerId:dogWalkerId];
}

-(bool)declineRequest:(long)dogOwnerId dogWalkerId:(long)dogWalkerId{
    return [self.modelParse declineRequest:dogOwnerId dogWalkerId:dogWalkerId];
}

-(NSArray*)getOwnersConnectToWalker:(long)dogWalkerId{
    return [self.modelParse getOwnersConnectToWalker:dogWalkerId];
}

-(NSArray*)getRequestForDogWalker:(long)dogWalkerId{
    return [self.modelParse getRequestForDogWalker:dogWalkerId];
}

-(NSArray*)getRequestOfDogOwner:(long)dogOwnerId{
    return [self.modelParse getRequestOfDogOwner:dogOwnerId];
}

// Image Methods


-(void)saveImage:(UIImage*)image imageName:(NSString*)imageName{
    [self.modelParse saveImage:image imageName:imageName];
}

-(UIImage*)getImage:(NSString*)imageName{
    return [self.modelParse getImage:imageName];
}

@end
