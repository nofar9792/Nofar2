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

@property long id;
@property long dogOwnerId;
@property long dogWalkerId;
@property DogOwner* owner;

@property DogWalker* walker;
@property NSDate* startOfWalking;
@property NSDate* endOfWalking;
@property bool isPaid;


-(id)init: (long)id owner:(DogOwner*)owner dog:(Dog*)dog walker:(DogWalker*)walker startOfWalking:(NSDate*)startOfWalking endOfWalking:(NSDate*)endOfWalking dateOfWalking:(NSDate*)dateOfWalking isPaid:(bool)isPaid;
@end
