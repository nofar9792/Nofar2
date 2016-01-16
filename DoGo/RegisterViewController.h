//
//  RegisterViewController.h
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "ProfileDogWalkerViewController.h"
#import "ProfileDogOwnerViewController.h"
#import "DogWalkerTabsViewController.h"
#import "DogOwnerTabsViewController.h"
#import "UIView+Toast.h"

@interface RegisterViewController : UIViewController
{
    IBOutlet UIScrollView *scroller;
}

//@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *usernameTexBox;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextBox;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextBox;
@property (weak, nonatomic) IBOutlet UITextField *addressTextBox;
@property (weak, nonatomic) IBOutlet UITextField *cityTextBox;
@property (weak, nonatomic) IBOutlet UIView *userTypeSubView;
- (IBAction)signUpClick:(id)sender;

@property (nonatomic) BOOL isOwner;
@property (nonatomic) User *user;
@property (nonatomic) UIViewController* childVC;

@property (nonatomic) NSString* usernameValue;


@end
