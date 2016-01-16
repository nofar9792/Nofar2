
//
//  ImageParse.m
//  DoGo
//
//  Created by Admin on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ImageParse.h"

@implementation ImageParse

+(void)saveImage:(UIImage*)image imageName:(NSString*)imageName{
    NSData* imageData = UIImageJPEGRepresentation(image,0);
    
    PFFile* file = [PFFile fileWithName:imageName data:imageData];
    PFObject* parseObject = [PFObject objectWithClassName:IMAGES_TABLES];
    parseObject[IMAGE_NAME] = imageName;
    parseObject[IMAGE_FILE] = file;
    [parseObject save];
}

+(UIImage*)getImage:(NSString*)imageName{
    PFQuery* query = [PFQuery queryWithClassName:IMAGES_TABLES];
    [query whereKey:IMAGE_NAME equalTo:imageName];
    NSArray* result = [query findObjects];
    UIImage* image = nil;
    
    if (result.count == 1) {
        PFObject* imObj = [result objectAtIndex:0];
        PFFile* file = imObj[IMAGE_FILE];
        NSData* data = [file getData];
        image = [UIImage imageWithData:data];
    }
    return image;
}

@end
