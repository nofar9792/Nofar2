//
//  DogOwner.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Dog.h"

@interface DogOwner : User

//@property Dog* dog;

-(id)init:(long)id userName:(NSString*)userName firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city;

@end
