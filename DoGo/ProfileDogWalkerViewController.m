//
//  ProfileDogWalkerViewController.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ProfileDogWalkerViewController.h"

@implementation ProfileDogWalkerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstNameTextBox.text = self.dogWalker.firstName;
    self.lastNameTextBox.text = self.dogWalker.lastName;
    self.phoneNumberTextBox.text = self.dogWalker.phoneNumber;
    self.cityTextBox.text = self.dogWalker.city;
    self.addressTextBox.text = self.dogWalker.address;
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
    
    
    
-(void)setDogWalker:(DogWalker*)dogWalker{
    _dogWalker = dogWalker;
//    if (self. != nil) {
//           self.label.text = self.topLabel;
//    }
}

- (IBAction)saveClick:(id)sender {
}
@end
