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

@property (weak, nonatomic) IBOutlet UITextField *ageTextBox;
@property (weak, nonatomic) IBOutlet UITextField *priceForHourTextBox;
@property (weak, nonatomic) IBOutlet UIButton *morningCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *afternoonCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *eveningCheckBox;
@property (nonatomic) DogWalker* dogWalker;

@end
