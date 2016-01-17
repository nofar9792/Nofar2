//
//  DogInDogsListCell.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogOwner.h"
#import "Model.h"

@interface DogInDogsListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ownerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *startTripButton;
@property (weak, nonatomic) IBOutlet UIButton *endTripButton;

- (IBAction)startTripClick:(id)sender;
- (IBAction)endTripClick:(id)sender;

@property (nonatomic)DogOwner* owner;
@property (nonatomic)DogWalker* walker;


@end
