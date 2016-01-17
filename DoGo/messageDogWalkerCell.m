//
//  messageDogWalkerCell.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "messageDogWalkerCell.h"

@implementation messageDogWalkerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)acceptClick:(id)sender
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[Model instance]acceptRequest:self.owner.userId dogWalkerId:self.user.userId];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.acceptButton setTitle:@"הבקשה אושרה" forState:UIControlStateDisabled];
            [self.declineButton setTitle:@"" forState:UIControlStateDisabled];
        });
    });
}

- (IBAction)declineClick:(id)sender
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[Model instance]declineRequest:self.owner.userId dogWalkerId:self.user.userId];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.acceptButton setTitle:@"הבקשה נדחתה" forState:UIControlStateDisabled];
            [self.declineButton setTitle:@"" forState:UIControlStateDisabled];
        });
    });
}
@end