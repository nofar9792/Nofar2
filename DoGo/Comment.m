//
//  Comment.m
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Comment.h"

@implementation Comment

-(id)init:(NSString*)text rating:(long)rating{
    self = [super init];
    if (self){
        _text = text;
        _rating = rating;
    }
    return self;
}

@end
