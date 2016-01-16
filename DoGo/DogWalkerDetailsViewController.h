//
//  DogWalkerDetailsViewController.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogWalker.h"
#import "DogOwner.h"
#import "Model.h"

@interface DogWalkerDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *morningCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *afternoonCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *eveningCheckBox;

- (IBAction)morningClick:(id)sender;
- (IBAction)afternoonClick:(id)sender;
- (IBAction)eveningClick:(id)sender;
- (IBAction)askNumberClick:(id)sender;

@property (nonatomic) DogWalker* dogWalker;
@property (nonatomic) DogOwner* dogOwner;
@property (nonatomic) bool isComfortableOnMorning;
@property (nonatomic) bool isComfortableOnAfternoon;
@property (nonatomic) bool isComfortableOnEvening;
@property (nonatomic) bool isConnectedToOwner;

@end
