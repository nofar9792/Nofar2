//
//  Model.h
//  DoGo
//
//  Created by Admin on 12/29/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelParse.h"
#import "ModelSql.h"
#import "DogWalker.h"
#import "DogOwner.h"

//@protocol ModelProtocol <NSObject>
//
//-(void)addStudent:(Student*)st;
//-(void)deleteStudent:(Student*)st;
//-(Student*)getStudent:(NSString*)stId;
//-(NSArray*)getStudents;
//-(void)saveImage:(UIImage*)image withName:(NSString*)imageName;
//-(UIImage*)getImage:(NSString*)imageName;

//@end


//@protocol GetStudentsListener <NSObject>
//
//-(void)done:(NSArray*)data;
//
//@end


@interface Model : NSObject
@property ModelSql* modelSql;
@property ModelParse* modelParse;

+(Model*)instance;

-(User*)getUserById:(long)userId;

-(User*)login:(NSString*)username password:(NSString*)password;

-(void)addDogWalker:(NSString*)username password:(NSString*)password firstName:(NSString*)firstName lastName:(NSString*)lastName phoneNumber:(NSString*)phoneNumber address:(NSString*)address city:(NSString*)city;
//
//-(void)getStudentsAsynch:(void(^)(NSArray*))blockListener;
//-(void)getStudentImage:(Student*)st block:(void(^)(UIImage*))block;
//-(void)saveStudentImage:(Student*)st image:(UIImage*)image block:(void(^)(NSError*))block;
@end

