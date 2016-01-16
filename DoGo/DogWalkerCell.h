//
//  DogWalkerCell.h
//  DoGo
//
//  Created by nofar cohen zedek on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DogWalkerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dogWalkerFullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogWalkerAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogWalkerAgeLabel;

@end
