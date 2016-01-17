//
//  DogWalkerDetailsViewController.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogWalkerDetailsViewController.h"

@interface DogWalkerDetailsViewController ()

@end

@implementation DogWalkerDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstNameLabel.text = self.dogWalker.firstName;
    self.lastNameLabel.text = self.dogWalker.lastName;
    self.phoneNumberLabel.text = @"חסום";
    self.cityLabel.text = self.dogWalker.city;
    self.addressLabel.text = self.dogWalker.address;
    self.ageLabel.text =[[NSString alloc] initWithFormat:@"%li", self.dogWalker.age];
    self.priceLabel.text = [[NSString alloc] initWithFormat:@"%i", self.dogWalker.priceForHour];
    
    
    if(self.dogWalker.isComfortableOnMorning){
        [self.morningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }
    if(self.dogWalker.isComfortableOnAfternoon){
        [self.afternoonCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }
    if(self.dogWalker.isComfortableOnEvening){
        [self.eveningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }
    
    // show phone number if connected
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray* allDogOwners;
        allDogOwners = [[Model instance] getOwnersConnectToWalker:self.dogWalker.userId];
        
        for (DogOwner* owner in allDogOwners)
        {
            if (owner.userId == self.dogOwner.userId)
            {
                self.askNumberButton.enabled = false;
                self.phoneNumberLabel.text = self.dogWalker.phoneNumber;
                break;
            }
        }
    
        dispatch_async(dispatch_get_main_queue(), ^{
            // [self.spinner stopAnimating];
        });
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)askNumberClick:(id)sender
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        bool result = [[Model instance] addRequest:self.dogOwner.userId dogWalkerId:self.dogWalker.userId requestStatus:Waiting];
        
        if (result)
        {
            [self.view makeToast:@"הבקשה נשלחה בהצלחה"];
        }
        else
        {
            [self.view makeToast:@"אירעה שגיאה בעת שליחת הבקשה. נסה שנית"];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            // [self.spinner stopAnimating];
        });
    });
}
@end
