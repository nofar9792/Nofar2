//
//  ProfileDogOwnerViewController.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ProfileDogOwnerViewController.h"

@implementation ProfileDogOwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.firstNameTextBox.text = self.dogWalker.firstName;
    //    self.lastNameTextBox.text = self.dogWalker.lastName;
    //    self.phoneNumberTextBox.text = self.dogWalker.phoneNumber;
    //    self.cityTextBox.text = self.dogWalker.city;
    //    self.addressTextBox.text = self.dogWalker.address;
    
    
    //    self.ageTextBox.text = [NSString stringWithFormat:@"%li", self.dogWalker.age];
    //    self.priceForHourTextBox.text = [NSString stringWithFormat:@"%i",self.dogWalker.priceForHour];
    //
    //    if(self.dogWalker.isComfortableOnMorning){
    //         [self.morningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    //    }
    //    if(self.dogWalker.isComfortableOnAfternoon){
    //        [self.afternoonCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    //    }
    //    if(self.dogWalker.isComfortableOnEvening){
    //        [self.eveningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
}



-(void)setDogOwner:(DogOwner *)dogOener{
    _dogOwner = dogOener;
    //    if (self. != nil) {
    //           self.label.text = self.topLabel;
    //    }
}

@end
