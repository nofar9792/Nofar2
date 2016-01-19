//
//  DogInDogsListCell.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DogInDogsListCell.h"

@implementation DogInDogsListCell
{
    long tripId;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)startTripClick:(id)sender
{
    [self.spinner startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        tripId = [[Model instance]startTrip:self.owner.userId dogWalkerId:self.walker.userId];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.endTripButton.enabled = true;
            self.startTripButton.enabled = false;
            [self.spinner stopAnimating];
        });
    });
}

- (IBAction)endTripClick:(id)sender
{
    [self.spinner startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[Model instance]endTrip:tripId];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.endTripButton.enabled = false;
            self.startTripButton.enabled = true;
            [self.spinner stopAnimating];
        });
    });
}

@end
