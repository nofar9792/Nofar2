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

-(User*)getUserById:(long)userId{
    return [self.modelParse getUserById:userId];
}


-(User*)login:(NSString*)username password:(NSString*)password{
    return [self.modelParse login:username password:password];
}

-(void)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city{
    [self.modelParse addDogWalker:username password:password firstName:firstName lastName:lastName phoneNumber:phoneNumber address:address city:city];
}

@end
