//
//  Trip.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "DogOwner.h"
#import "DogWalker.h"

@interface Trip : NSObject

@property long tripId;
@property long dogOwnerId;
@property long dogWalkerId;
@property DogOwner* dogOwner;
@property DogWalker* dogWalker;
@property NSDate* startOfWalking;
@property NSDate* endOfWalking;
@property bool isPaid;


-(id)init:(long)tripId dogOwnerId:(long)dogOwnerId dogWalkerId:(long)dogWalkerId startOfWalking:(NSDate*)startOfWalking endOfWalking:(NSDate*)endOfWalking isPaid:(bool)isPaid;
@end
