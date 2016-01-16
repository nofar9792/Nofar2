//
//  TripCell.m
//  DoGo
//
//  Created by Admin on 1/14/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TripCell.h"

@implementation TripCell

- (IBAction)changeToPaid:(id)sender {
    [self.spinner startAnimating];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       [[Model instance]payTrip:self.trip.tripId];
        self.trip.isPaid = YES;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.isPaidCheckBox setImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal];
            self.isPaidCheckBox.enabled = NO;
            [self.spinner stopAnimating];
        });
    });
    
}
@end
