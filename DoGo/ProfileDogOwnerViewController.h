//
//  ProfileDogOwnerViewController.h
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogOwner.h"
#import "Model.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIView+Toast.h"
#import "Utilities.h"
@import Photos;


@interface ProfileDogOwnerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *dogNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *dogAgeTextBox;
@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
- (IBAction)getImageButtonClick:(id)sender;

@property (nonatomic) DogOwner *dogOwner;
@property (nonatomic) UIImage *dogPic;
@property (nonatomic) UIImagePickerController *pickerLibrary;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
