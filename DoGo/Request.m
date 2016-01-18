//
//  Request.m
//  DoGo
//
//  Created by Admin on 1/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Request.h"

@implementation Request

-(id)init:(long)dogOwnerId dogWalkerId:(long)dogWalkerId status:(enum RequestStatus) status{
    {
        self = [super init];
        if (self){
            self.dogOwnerId = dogOwnerId;
            self.dogWalkerId = dogWalkerId;
            self.status = status;
        }
        return self;
    }
}

@end
