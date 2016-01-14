//
//  LogInViewController.h
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "DogWalker.h"
#import "DogOwner.h"


@interface LogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextBox;
@property (weak, nonatomic) IBOutlet UILabel *errorTextBox;
- (IBAction)logInClick:(id)sender;

@end
