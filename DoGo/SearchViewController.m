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
    DogWalkerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"currentCell"];

    return cell;
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

- (IBAction)searchClick:(id)sender {
}
@end
