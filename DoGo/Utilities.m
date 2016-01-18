//
//  Utilities.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/18/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities


+ (void) saveImageOnDevice:(NSString*)filename image:(UIImage*)image
{
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          [NSString stringWithString: filename] ];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
    
}

+ (UIImage*)loadImageFromDevice:(NSString *)filename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      [NSString stringWithString: filename] ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end