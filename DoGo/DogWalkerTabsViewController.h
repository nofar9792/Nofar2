//
//  DogWalkerTabsViewController.h
//  DoGo
//
//  Created by Admin on 1/13/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DogWalkerTabsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;


@end

@interface DogWalkerTabSegue : UIStoryboardSegue
@property UIView* destinationViewContainer;
@end

