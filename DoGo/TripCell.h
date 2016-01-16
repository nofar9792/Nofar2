//
//  TripCell.h
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "Trip.h"

@interface TripCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogOwnerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogWalkerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *beginTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *isPaidCheckBox;
- (IBAction)changeToPaid:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (nonatomic) Trip* trip;

@end
