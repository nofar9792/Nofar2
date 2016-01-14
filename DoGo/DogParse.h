//
//  DogOwnerParse.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Dog.h"
#import "DogOwner.h"
#import "DogConsts.h"
#import "DogSize.h"

@interface DogParse : NSObject

+(bool)addToDogsTable:(long)userId dog:(Dog*)dog;

+(Dog*)getDogByUserId:(long)userId ;

+(bool)updateDog:(long)userId dog:(Dog*)dog;

@end
