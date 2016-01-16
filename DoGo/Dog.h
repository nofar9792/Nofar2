//
//  Dog.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property NSString* name;
@property long age;
@property NSString* picRef;


-(id)init:(NSString*)name age:(long)age picRef:(NSString*)picRef;

@end