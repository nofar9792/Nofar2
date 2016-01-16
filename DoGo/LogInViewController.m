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
}

- (IBAction)logInClick:(id)sender {
    NSString* username = self.usernameTextBox.text;
    NSString* password = self.passwordTextBox.text;
    
    [self.spinner startAnimating];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         self.user = [[Model instance] login:username password:password];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(self.user){
                if([self.user isKindOfClass:[DogWalker class]]){
                    [self performSegueWithIdentifier:@"toDogWalkerScreen" sender:self];
                }
                else{
                    [self performSegueWithIdentifier:@"toDogOwnerScreen" sender:self];
                }
            }else{
                self.errorTextBox.text = @"שם משתמש או סיסמא אינם נכונים";
            }
            [self.spinner stopAnimating];
        });
    });
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDogWalkerScreen"]){
        DogWalkerTabsViewController* tabsVC = segue.destinationViewController;
        tabsVC.dogWalker = (DogWalker*)self.user;
    }else{
        DogOwnerTabsViewController* tabsVC = segue.destinationViewController;
        tabsVC.dogOwner = (DogOwner*)self.user;
    }
}

@end
