//
//  Comment.h
//  DoGo
//
//  Created by Admin on 12/27/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property NSString* text;
@property long rating;

-(id)init:(NSString*)text rating:(long)rating;
@end	
