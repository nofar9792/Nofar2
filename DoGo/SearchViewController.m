//
//  SearchViewController.m
//  DoGo
//
//  Created by nofar cohen zedek on 1/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.walkersListArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogWalkerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"walkerCell"];
    DogWalker* walker = [self.walkersListArray objectAtIndex:indexPath.row];
    
    [self initCell:cell walker:walker];
    
    return cell;
}

-(void)initCell:(DogWalkerCell*) cell walker:(DogWalker*)walker
{
    NSMutableString *fullName = [[NSMutableString alloc]initWithString:walker.firstName];
    [fullName appendString:@" "];
    [fullName appendString:walker.lastName];
    
    cell.dogWalkerFullNameLabel.text = fullName;
    cell.dogWalkerAgeLabel.text = [NSString stringWithFormat: @"%ld",walker.age];
    cell.dogWalkerAddressLabel.text = walker.address;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)searchClick:(id)sender
{
    
    self.walkerMinimalAge = [self.minimalAgeTextBox.text intValue];
    self.walkerMaxPrice = [self.maxPriceTextBox.text longLongValue];
    self.walkerCity = self.cityTextBox.text;
    
    [self.spinner startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray* allDogWalkers;
        NSMutableArray *relevantDogWalkers = [[NSMutableArray alloc] init];
        allDogWalkers = [[Model instance] getAllDogWalkers];
        
        for (DogWalker* walker in allDogWalkers)
        {
            if (walker.age >= self.walkerMinimalAge && walker.priceForHour <= self.walkerMaxPrice
                && [walker.city isEqualToString:self.walkerCity])
            {
                [relevantDogWalkers addObject:walker];
            }
        }
        
        self.walkersListArray = relevantDogWalkers;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.spinner stopAnimating];
        });
    });
}
@end
