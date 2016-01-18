//
//  Request.h
//  DoGo
//
//  Created by Admin on 1/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestStatus.h"
#import "DogOwner.h"
#import "DogWalker.h"

@interface Request : NSObject

@property long dogOwnerId;
@property long dogWalkerId;
@property enum RequestStatus status;
@property DogOwner* dogOwner;
@property DogWalker* dogWalker;

-(id) init:(long)dogOwnerId dogWalkerId:(long)dogWalkerId status:(enum RequestStatus) status;
@end
