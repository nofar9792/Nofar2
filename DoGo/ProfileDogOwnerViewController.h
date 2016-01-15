//
//  ProfileDogOwnerViewController.h
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogOwner.h"

@interface ProfileDogOwnerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *dogNameTextBox;
@property (weak, nonatomic) IBOutlet UIButton *dogSizeLargeCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *dogSizeMediumCheckBox;
@property (weak, nonatomic) IBOutlet UIButton *dogSizeSmallCheckBox;
@property (weak, nonatomic) IBOutlet UITextField *dogAgeTextBox;
@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;

@property (nonatomic) DogOwner *dogOwner;
@end
