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
}

-(void) setDogWalker:(DogWalker *)dogWalker{
    _dogWalker = dogWalker;
    
    if(self.dogWalker){
            self.ageTextBox.text = [NSString stringWithFormat:@"%li", self.dogWalker.age];
        self.priceForHourTextBox.text = [NSString stringWithFormat:@"%i",self.dogWalker.priceForHour];
    
        if(self.dogWalker.isComfortableOnMorning){
        [self.morningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
        }
        if(self.dogWalker.isComfortableOnAfternoon){
            [self.afternoonCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
        }
        if(self.dogWalker.isComfortableOnEvening){
            [self.eveningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
        }
    }
}
- (IBAction)morningCheckBoxClick:(id)sender {
    if(self.dogWalker.isComfortableOnMorning) {
        self.dogWalker.isComfortableOnMorning = NO;
        [self.morningCheckBox setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
    }else{
        self.dogWalker.isComfortableOnMorning = YES;
        [self.morningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)afternoonCheckBoxClick:(id)sender {
    if(self.dogWalker.isComfortableOnAfternoon) {
        self.dogWalker.isComfortableOnAfternoon = NO;
        [self.afternoonCheckBox setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
    }else{
        self.dogWalker.isComfortableOnAfternoon = YES;
        [self.afternoonCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)eveningCheckBoxClick:(id)sender {
    if(self.dogWalker.isComfortableOnEvening) {
        self.dogWalker.isComfortableOnEvening = NO;
        [self.eveningCheckBox setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
    }else{
        self.dogWalker.isComfortableOnEvening = YES;
        [self.eveningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
    }
}
@end
