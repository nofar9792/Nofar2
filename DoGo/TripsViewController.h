//
//  TripsViewController.h
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "Trip.h"
#import "TripCell.h"

@interface TripsViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (nonatomic) User *user;

@end
