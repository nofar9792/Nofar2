//
//  DogOwnerParse.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogParse.h"

@implementation DogParse

+(bool)addToDogsTable:(long)userId dog:(Dog*)dog {
    PFObject* parseObject = [PFObject objectWithClassName:DOGS_TABLE];
    parseObject[USER_ID] = [NSNumber numberWithLong:userId];
    parseObject[NAME] = dog.name;
    parseObject[AGE] = [NSNumber numberWithLongLong:dog.age];
    if(dog.picRef){
     parseObject[PIC_REF] = dog.picRef;
    }
    
    return [parseObject save];
}

+(Dog*)getDogByUserId:(long)userId {
    PFQuery* query = [PFQuery queryWithClassName:DOGS_TABLE];
    [query whereKey:USER_ID equalTo:[NSNumber numberWithLong:userId]];
    
    Dog* dog = nil;
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        
        dog = [[Dog alloc]init:parseObject[NAME] age:[parseObject[AGE] longLongValue]  picRef:parseObject[PIC_REF]];
    }
    
    return dog;
}

+(bool)updateDog:(long)userId dog:(Dog*)dog{
    PFQuery* query = [PFQuery queryWithClassName:DOGS_TABLE];
    [query whereKey:USER_ID equalTo:[NSNumber numberWithLong:userId]];
    
    PFObject* parseObject = [query getFirstObject];
    if (parseObject) {
        parseObject[NAME] = dog.name;
        parseObject[AGE] = [NSNumber numberWithLong:dog.age];
        parseObject[PIC_REF] = dog.picRef;
       
        return [parseObject save];
        
    }
    
    return NO;
}


@end
