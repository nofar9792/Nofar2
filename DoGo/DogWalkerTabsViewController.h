//
//  DogWalkerTabsViewController.h
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import "DogWalker.h"
#import "TripsViewController.h"
#import "DogsListViewController.h"
#import "MessegasDogWalkerViewController.h"
@interface DogWalkerTabsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic) DogWalker* dogWalker;

@end

@interface DogWalkerTabSegue : UIStoryboardSegue
@property UIView* destinationViewContainer;
@end

