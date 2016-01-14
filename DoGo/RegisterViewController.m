//
//  RegisterViewController.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RegisterViewController.h"
#import "DogConsts.h"
#import "Model.h"
#import <Parse/Parse.h>

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[Model instance] addDogWalker:@"ios" password:@"1212" firstName:@"ad" lastName:@"matai" phoneNumber:@"aa" address:@"kaplan 2" city:@"tel aviv"];
    
    self.usernameTexBox.text = self.usernameValue;
//    self.lastNameLabel.text = self.lastNameValue;
//    self.idLabel.text = self.idValue;
//    self.phoneLabel.text = self.phoneValue;
    
    
    
    void(^myBlock)(PFObject * _Nullable, NSError * _Nullable) = ^(PFObject * _Nullable object, NSError * _Nullable error){
        self.usernameTexBox.text = object[@"firstName"];
        self.usernameLabel.text = object[@"firstName"];
    };
    
    void(^myBlock2)(User*) = ^(User* user){
        self.usernameTexBox.text = user.firstName;
        self.usernameLabel.text = user.lastName;
    };
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueueName", NULL);
    
    dispatch_async(myQueue, ^{
        //long operation
        //NSArray* data = [modelImpl getStudents];
        User* user = [[Model instance] getUserById:1];
        
        //end of long operation - update display in the main Q
        dispatch_queue_t mainQ = dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
            myBlock2(user);
        });
    } );
    
    //[[Model instance] getUserById:1 block:myBlock];
}

@end
