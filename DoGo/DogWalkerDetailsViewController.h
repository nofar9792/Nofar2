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
#import "UIView+Toast.h"

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
@property (weak, nonatomic) IBOutlet UIButton *askNumberButton;

- (IBAction)askNumberClick:(id)sender;

@property (nonatomic) DogWalker* dogWalker;
@property (nonatomic) DogOwner* dogOwner;
//@property (nonatomic) bool isConnectedToOwner;

@end
