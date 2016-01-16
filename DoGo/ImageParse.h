//
//  ImageParse.h
//  DoGo
//
//  Created by Admin on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Consts.h"

@interface ImageParse : NSObject

+(void)saveImage:(UIImage*)image imageName:(NSString*)imageName;

+(UIImage*)getImage:(NSString*)imageName;

@end
