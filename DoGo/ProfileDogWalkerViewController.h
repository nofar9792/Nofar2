//
//  ProfileDogWalkerViewController.h
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogWalker.h"

@interface ProfileDogWalkerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextBox;
@property (weak, nonatomic) IBOutlet UITextField *cityTextBox;
@property (weak, nonatomic) IBOutlet UITextField *addressTextBox;
@property (weak, nonatomic) IBOutlet UITextField *ageTextBox;
@property (weak, nonatomic) IBOutlet UITextField *priceForHourTextBox;
@property (weak, nonatomic) IBOutlet UIButton *morningCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *afternoonCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *eveningCheckBox;
@property (nonatomic) DogWalker* dogWalker;
@property (nonatomic) NSString* tt;
- (IBAction)saveClick:(id)sender;

@end
