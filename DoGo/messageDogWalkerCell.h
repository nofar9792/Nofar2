//
//  messageDogWalkerCell.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogOwner.h"
#import "DogWalker.h"
#import "Model.h"

@interface messageDogWalkerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dogOwnerNameLabel;
- (IBAction)acceptClick:(id)sender;
- (IBAction)declineClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;
@property (weak, nonatomic) IBOutlet UIButton *declineButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (nonatomic) DogOwner* owner;
@property(nonatomic) DogWalker* user;

@end
