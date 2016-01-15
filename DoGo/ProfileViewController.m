//
//  ProfileViewController.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if([self.user isKindOfClass:[DogWalker class]]){
        //Creating the child view controller
        ProfileDogWalkerViewController* profileDogWalker = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogWalkerViewController"];
        
        //Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogWalker];
        
        
        CGRect frame = self.userTypeDetailsView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        self.userTypeDetailsView.frame = frame;
        
        [self.userTypeDetailsView addSubview:profileDogWalker.view];
    }else{
        //Creating the child view controller
        ProfileDogOwnerViewController* profileDogOwner = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogOwnerViewController"];
        
        //Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogOwner];
        
        
        CGRect frame = self.userTypeDetailsView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        self.userTypeDetailsView.frame = frame;
        
        [self.userTypeDetailsView addSubview:profileDogOwner.view];
    }
}

-(void)setUser:(User *)user{
    _user = user;
//    if (self. != nil) {
//           self.label.text = self.topLabel;
//    }
}

- (IBAction)saveClick:(id)sender {
}
@end
