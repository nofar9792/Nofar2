//
//  DogWalkerParse.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DogWalker.h"
#import "Consts.h"
#import <Parse/Parse.h>

@interface DogWalkerParse : NSObject

+(bool)addToDogWalkersTable:(long)userId age:(long)age priceForHour:(int)
priceForHour isComfortableOnMorning:(bool)isComfortableOnMorning isComfortableOnAfternoon:(bool)isComfortableOnAfternoon isComfortableOnEvening:(bool)isComfortableOnEvening;

+(void)addDogWalkerDetails:(DogWalker*)dogWalker;

+(bool)updateDogWalker:(DogWalker*)dogWalker;

@end
