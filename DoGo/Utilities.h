//
//  Utilities.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utilities : NSObject

+ (void) saveImageOnDevice:(NSString*)filename image:(UIImage*)image;
+ (UIImage*) loadImageFromDevice: (NSString*)filename;

@end
