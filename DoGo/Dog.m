//
//  Dog.m
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(id)init:(NSString*)name size:(enum DogSize)size age:(long)age picRef:(NSString*)picRef{
    self = [super init];
    if (self){
        _name = name;
        _size = size;
        _age = age;
        _picRef = picRef;
    }
    return self;
}

@end
