//
//  DogWalkerTabsViewController.m
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogWalkerTabsViewController.h"

@implementation DogWalkerTabsViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"profileDogWalkerSegue"]){
        DogWalkerTabSegue* msegue = (DogWalkerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
        ProfileViewController* profileVC = msegue.destinationViewController;
       
        profileVC.user = self.dogWalker;
        
    }else if([segue.identifier isEqualToString:@"messagesDogWalkerSegue"]){
        DogWalkerTabSegue* msegue = (DogWalkerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }
    else if([segue.identifier isEqualToString:@"tripsReportDogWalkerSegue"]){
        DogWalkerTabSegue* msegue = (DogWalkerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
        
        TripsViewController* tripVC = msegue.destinationViewController;
        
        tripVC.user = self.dogWalker;
    }else if([segue.identifier isEqualToString:@"dogListSegue"]){
        DogWalkerTabSegue* msegue = (DogWalkerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }
}


@end

@implementation DogWalkerTabSegue
-(void)perform{
    DogWalkerTabsViewController* parent = self.sourceViewController;
    
    UINavigationController* child = self.destinationViewController;
    
    [parent addChildViewController:child];
    
    CGRect frame = parent.containerView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    child.view.frame = frame;
    
    [parent.containerView addSubview:child.view];
    [child didMoveToParentViewController:parent];
}

@end
