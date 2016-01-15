//
//  Trip.m
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Trip.h"

@implementation Trip

-(id)init:(long)tripId dogOwnerId:(long)dogOwnerId dogWalkerId:(long)dogWalkerId startOfWalking:(NSDate*)startOfWalking endOfWalking:(NSDate*)endOfWalking isPaid:(bool)isPaid{
    self = [super init];
    if (self){
        _tripId = tripId;
        _dogOwnerId = dogOwnerId;
        _dogWalkerId = dogWalkerId;
        _startOfWalking = startOfWalking;
        _endOfWalking = endOfWalking;
        _isPaid = isPaid;
    }
    return self;
}
@end
