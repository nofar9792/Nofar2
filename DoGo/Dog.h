//
//  Dog.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DogOwner.h"

@interface Dog : NSObject

@property NSString* name;
//@property enum DogSize size;
@property long age;
@property NSString* picRef;


//-(id)init:(NSString*)name size:(enum DogSize)size age:(long)age picRef:(NSString*)picRef;

-(id)init:(NSString*)name age:(long)age picRef:(NSString*)picRef;

@end