//
//  DogOwnerTabsViewController.h
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogOwner.h"
#import "ProfileViewController.h"
#import "TripsViewController.h"
#import "SearchViewController.h"

@interface DogOwnerTabsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic) DogOwner* dogOwner;

@end

@interface DogOwnerTabSegue : UIStoryboardSegue
@property UIView* destinationViewContainer;
@end
