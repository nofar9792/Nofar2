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
    self.phoneNumberLabel.text = @"אינך יכול לצפות במספר הטלפון כרגע";
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
    
    // TODO : show phone number if connected
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSArray* allDogWalkers;
//        NSMutableArray *relevantDogWalkers = [[NSMutableArray alloc] init];
//        allDogWalkers = [[Model instance] getAllDogWalkers];
//        
//        self.isConnectedToOwner = NO;
//        
//        for (DogWalker* walker in allDogWalkers)
//        {
//
//        }
//        
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // [self.spinner stopAnimating];
//        });
//    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)morningClick:(id)sender {
}
- (IBAction)afternoonClick:(id)sender {
}

- (IBAction)eveningClick:(id)sender {
}

- (IBAction)askNumberClick:(id)sender {
}
@end
