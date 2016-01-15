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

-(User*)getUserById:(long)userId{
    return [self.modelParse getUserById:userId];
}

-(User*)login:(NSString*)username password:(NSString*)password{
    return [self.modelParse login:username password:password];
}

-(void)logOut{
    [self.modelParse logOut];
}

// Dog Waslker Methods

-(NSArray*)getAllDogWalkers{
    return [self.modelParse getAllDogWalkers];
}

-(long)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city age:(long)age priceForHour:(int)
priceForHour isComfortableOnMorning:(bool)isComfortableOnMorning isComfortableOnAfternoon:(bool)isComfortableOnAfternoon isComfortableOnEvening:(bool)isComfortableOnEvening{
    return [self.modelParse addDogWalker:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city age:age priceForHour:priceForHour isComfortableOnMorning:isComfortableOnMorning isComfortableOnAfternoon:isComfortableOnAfternoon isComfortableOnEvening:isComfortableOnEvening];
}

-(void)updateDogWalker:(DogWalker*)dogWalker{
    [self.modelParse updateDogWalker:dogWalker];
}

//region Dog Owner Methods
-(long)addDogOwner:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city dog:(Dog*)dog{
    return [self.modelParse addDogOwner:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city dog:dog];
}
-(void)updateDogOwner:(DogOwner*)dogOwner{
    [self.modelParse updateDogOwner:dogOwner];
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

//
//
//-(NSArray*)getTripByDogWalkerId:(long)dogWalkerId{
//    NSMutableArray* array = [[NSMutableArray alloc] init];
//    DogOwner* dogOwner = [[DogOwner alloc]init:1 userName:@"a" firstName:@"a" lastName:@"as" phoneNumber:@"05" address:@"tel" city:@"aviv"];
//    dogOwner.dog = [[Dog alloc]init:@"dogg" age:5 picRef:@"aa.png"];
//    DogWalker* dogWalker = [[DogWalker alloc] init:2 userName:@"aa" firstName:@"asas" lastName:@"as" phoneNumber:@"33" address:@"asas" city:@"ddd"];
//    
//    NSDate* start = [NSDate date];
//    NSDate* end = [[NSDate alloc]init];
//    Trip* trip = [[Trip alloc] init:1 dogOwnerId:1 dogWalkerId:2 startOfWalking:start endOfWalking:end isPaid:YES];
//    trip.dogWalker = dogWalker;
//    trip.dogOwner = dogOwner;
//    [array addObject:trip];
//    
//    return array;
//}

@end
