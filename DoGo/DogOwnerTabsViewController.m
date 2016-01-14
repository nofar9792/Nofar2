//
//  DogOwnerTabsViewController.m
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogOwnerTabsViewController.h"

@implementation DogOwnerTabsViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"profileDogOwnerSegue"]){
        DogOwnerTabSegue* msegue = (DogOwnerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }else if([segue.identifier isEqualToString:@"messagesDogOwnerSegue"]){
        DogOwnerTabSegue* msegue = (DogOwnerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }
    else if([segue.identifier isEqualToString:@"tripsReportDogWalkerSegue"]){
        DogOwnerTabSegue* msegue = (DogOwnerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }else if([segue.identifier isEqualToString:@"searchSegue"]){
        DogOwnerTabSegue* msegue = (DogOwnerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }else if([segue.identifier isEqualToString:@"mapSegue"]){
        DogOwnerTabSegue* msegue = (DogOwnerTabSegue*)segue;
        msegue.destinationViewContainer = self.containerView;
    }
}
@end

@implementation DogOwnerTabSegue
-(void)perform{
    DogOwnerTabsViewController* parent = self.sourceViewController;
    
    UINavigationController* child = self.destinationViewController;
    
    [parent addChildViewController:child];
    
    CGRect frame = parent.containerView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    
    child.view.frame = parent.containerView.frame;
    [parent.containerView addSubview:child.view];
    [child didMoveToParentViewController:parent];
}

@end
