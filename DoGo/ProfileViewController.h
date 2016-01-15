//
//  ProfileViewController.h
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "DogWalker.h"
#import "DogOwner.h"
#import "ProfileDogOwnerViewController.h"
#import "ProfileDogWalkerViewController.h"

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextBox;
@property (weak, nonatomic) IBOutlet UITextField *cityTextBox;
@property (weak, nonatomic) IBOutlet UITextField *addressTextBox;
@property (weak, nonatomic) IBOutlet UIView *userTypeDetailsView;
- (IBAction)saveClick:(id)sender;

@property (nonatomic) IBOutlet User *user;
@end
