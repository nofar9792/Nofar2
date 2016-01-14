//
//  Trip.m
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Trip.h"

@implementation Trip

-(id)init: (long)id owner:(DogOwner*)owner dog:(Dog*)dog walker:(DogWalker*)walker startOfWalking:(NSDate*)startOfWalking endOfWalking:(NSDate*)endOfWalking dateOfWalking:(NSDate*)dateOfWalking isPaid:(bool)isPaid{
    self = [super init];
    if (self){
        _id = id;
        _owner = owner;
        _walker = walker;
        _startOfWalking = startOfWalking;
        _endOfWalking = endOfWalking;
        _isPaid = isPaid;
    }
    return self;
}
@end
