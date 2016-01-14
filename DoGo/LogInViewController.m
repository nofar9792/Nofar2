//
//  LogInViewController.m
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LogInViewController.h"

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // block moving to the next page
//    void(^myBlock)(PFObject * _Nullable, NSError * _Nullable) = ^(PFObject * _Nullable object, NSError * _Nullable error){
//        self.usernameTexBox.text = object[@"firstName"];
//        self.usernameLabel.text = object[@"firstName"];
//    };
//    
//    void(^myBlock2)(User*) = ^(User* user){
//        self.usernameTextBox.text = user.firstName;
//    };
//

    //[[Model instance] getUserById:1 block:myBlock];
}

- (IBAction)logInClick:(id)sender {
    NSString* username = self.usernameTextBox.text;
    NSString* password = self.passwordTextBox.text;
    
    void(^myBlock2)(User*) = ^(User* user){
        if(user){
            if([user isKindOfClass:[DogWalker class]]){
                [self performSegueWithIdentifier:@"toDogWalkerScreen" sender:self];
            }
            else{
                [self performSegueWithIdentifier:@"toDogOwnerScreen" sender:self];
            }
        }else{
            self.errorTextBox.text = @"שם משתמש או סיסמא אינם נכונים";
        }
    };
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueueName", NULL);
    
    dispatch_async(myQueue, ^{
        User* user = [[Model instance] login:username password:password];

            
        dispatch_queue_t mainQ = dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
            myBlock2(user);
        });
        
    } );
    
}
@end
