//
//  DogWalkerParse.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogWalkerParse.h"

@implementation DogWalkerParse

+(bool)addToDogWalkersTable:(long)userId age:(long)age priceForHour:(int)
priceForHour isComfortableOnMorning:(bool)isComfortableOnMorning isComfortableOnAfternoon:(bool)isComfortableOnAfternoon isComfortableOnEvening:(bool)isComfortableOnEvening {
    
    PFObject* parseObject = [PFObject objectWithClassName:DOG_WALKERS_TABLE];
    parseObject[USER_ID] = [NSNumber numberWithLong:userId];
    parseObject[AGE] = [NSNumber numberWithLong:age];
    parseObject[PRICE_FOR_HOUR] = [NSNumber numberWithInt:priceForHour];
   
    if(isComfortableOnMorning){
        parseObject[IS_COMFORTABLE_ON_MORNING] = [NSNumber numberWithBool:YES];
    }else{
        parseObject[IS_COMFORTABLE_ON_MORNING] = [NSNumber numberWithBool:NO];
    }
    
    if(isComfortableOnAfternoon){
        parseObject[IS_COMFORTABLE_ON_AFTERNOON] = [NSNumber numberWithBool:YES];
    }else{
        parseObject[IS_COMFORTABLE_ON_AFTERNOON] = [NSNumber numberWithBool:NO];
    }
    
    if(isComfortableOnEvening){
        parseObject[IS_COMFORTABLE_ON_EVENING] = [NSNumber numberWithBool:YES];
    }else{
        parseObject[IS_COMFORTABLE_ON_EVENING] = [NSNumber numberWithBool:NO];
    }
    
    return [parseObject save];
}

+(void)addDogWalkerDetails:(DogWalker*)dogWalker {
    PFQuery* query = [PFQuery queryWithClassName:DOG_WALKERS_TABLE];
    [query whereKey:USER_ID equalTo:[NSNumber numberWithLong:dogWalker.userId]];
    
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        dogWalker.age = [parseObject[AGE] longLongValue];
        dogWalker.priceForHour = [parseObject[PRICE_FOR_HOUR] intValue];
        dogWalker.isComfortableOnMorning = [parseObject[IS_COMFORTABLE_ON_MORNING] boolValue];
        dogWalker.isComfortableOnAfternoon = [parseObject[IS_COMFORTABLE_ON_AFTERNOON] boolValue];
         dogWalker.isComfortableOnEvening = [parseObject[IS_COMFORTABLE_ON_EVENING] boolValue];
    }
}

+(bool)updateDogWalker:(DogWalker*)dogWalker{
    PFQuery* query = [PFQuery queryWithClassName:DOG_WALKERS_TABLE];
    [query whereKey:USER_ID equalTo:[NSNumber numberWithLong:dogWalker.userId]];
    
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        parseObject[AGE] = [NSNumber numberWithLong:dogWalker.age];
        parseObject[PRICE_FOR_HOUR] = [NSNumber numberWithInt:dogWalker.priceForHour];
        
        if(dogWalker.isComfortableOnMorning){
            parseObject[IS_COMFORTABLE_ON_MORNING] = [NSNumber numberWithBool:YES];
        }else{
            parseObject[IS_COMFORTABLE_ON_MORNING] = [NSNumber numberWithBool:NO];
        }
        
        if(dogWalker.isComfortableOnAfternoon){
            parseObject[IS_COMFORTABLE_ON_AFTERNOON] = [NSNumber numberWithBool:YES];
        }else{
            parseObject[IS_COMFORTABLE_ON_AFTERNOON] = [NSNumber numberWithBool:NO];
        }
        
        if(dogWalker.isComfortableOnEvening){
            parseObject[IS_COMFORTABLE_ON_EVENING] = [NSNumber numberWithBool:YES];
        }else{
            parseObject[IS_COMFORTABLE_ON_EVENING] = [NSNumber numberWithBool:NO];
        }

        return [parseObject save];

    }
    
    return NO;
}

@end
