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
}



-(void)setDogOwner:(DogOwner *)dogOwner{
    _dogOwner = dogOwner;
    
    if(self.dogOwner){
        self.dogNameTextBox.text =  self.dogOwner.dog.name;

        // size!!
//        
//        if(self.dogWalker.isComfortableOnMorning){
//            [self.morningCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
//        }
        
        // pic
         //[self.eveningCheckBox setImage:[UIImage imageNamed:self.dogOwner.dog.picRef] forState:UIControlStateNormal];
        
    }
}

@end
