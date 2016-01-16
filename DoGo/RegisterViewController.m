//
//  RegisterViewController.m
//  DoGo
//
//  Created by Admin on 1/12/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "RegisterViewController.h"


@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // scroller
    [scroller setScrollEnabled: YES];
    [scroller setContentSize:CGSizeMake(320, 1000)];
    
    // sub views
    if (!self.isOwner)
    {
        // Creating the child view controller
        ProfileDogWalkerViewController* profileDogWalkerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
            instantiateViewControllerWithIdentifier:@"profileDogWalkerViewController"];
        
        // Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogWalkerVC];
        
        // Set child's view size
        CGRect frame = self.userTypeSubView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        profileDogWalkerVC.view.frame = frame;
        
        self.childVC = profileDogWalkerVC;
        
        [self.userTypeSubView addSubview:profileDogWalkerVC.view];
        
    }
    else
    {
        // Creating the child view controller
        ProfileDogOwnerViewController* profileDogOwnerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"profileDogOwnerViewController"];
        
        // Connect between the parent VC to the Child VC
        [self addChildViewController:profileDogOwnerVC];
        
        // Set child's view size
        CGRect frame = self.userTypeSubView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        profileDogOwnerVC.view.frame = frame;
        
        
        [self.userTypeSubView addSubview:profileDogOwnerVC.view];
    }
    
    
    
//    [[Model instance] addDogWalker:@"ios" password:@"1212" firstName:@"ad" lastName:@"matai" phoneNumber:@"aa" address:@"kaplan 2" city:@"tel aviv"];
    
    self.usernameTexBox.text = self.usernameValue;
//    self.lastNameLabel.text = self.lastNameValue;
//    self.idLabel.text = self.idValue;
//    self.phoneLabel.text = self.phoneValue;
    
    
    void(^myBlock)(PFObject * _Nullable, NSError * _Nullable) = ^(PFObject * _Nullable object, NSError * _Nullable error){
        //self.usernameTexBox.text = object[@"firstName"];
        //self.usernameLabel.text = object[@"firstName"];
    };
    
    void(^myBlock2)(User*) = ^(User* user){
        //self.usernameTexBox.text = user.firstName;
        //self.usernameLabel.text = user.lastName;
    };
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueueName", NULL);
    
    dispatch_async(myQueue, ^{
        //long operation
        //NSArray* data = [modelImpl getStudents];
        User* user = [[Model instance] getUserById:1];
        
        //end of long operation - update display in the main Q
        dispatch_queue_t mainQ = dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
            myBlock2(user);
        });
    } );
    
    //[[Model instance] getUserById:1 block:myBlock];
}

- (IBAction)signUpClick:(id)sender
{
    self.user.firstName = self.firstNameTextBox.text;
    self.user.lastName = self.lastNameTextBox.text;
    self.user.userName = self.usernameTexBox.text;
    self.user.phoneNumber = self.phoneNumberTextBox.text;
    self.user.city = self.cityTextBox.text;
    self.user.address = self.addressTextBox.text;
    
    if (!self.isOwner)
    {
        DogWalker* dogWalker = (DogWalker*)self.user;
        ProfileDogWalkerViewController* profileDogWalkerVC = (ProfileDogWalkerViewController*)self.childVC;
        
        dogWalker.age = [profileDogWalkerVC.ageTextBox.text longLongValue];
        dogWalker.priceForHour = [profileDogWalkerVC.priceForHourTextBox.text intValue];
    }
    else
    {
        ProfileDogOwnerViewController* profileDogOwnerVC = (ProfileDogOwnerViewController*)self.childVC;
        DogOwner* dogOwner = (DogOwner*) self.user;
        
        dogOwner.dog.name = profileDogOwnerVC.dogNameTextBox.text;
        dogOwner.dog.age = [profileDogOwnerVC.dogAgeTextBox.text longLongValue];
    }
    
    void(^afterSignUp)(long) = ^(long result){
        if(result != 0)
        {
            if (self.isOwner)
            {
                [self performSegueWithIdentifier:@"toDogWalkerScreen" sender:self];
            }
            else
            {
                [self performSegueWithIdentifier:@"toDogOwmerSceen" sender:self];
            }
        }
        else
        {
            [self.view makeToast:@"אירעה שגיאה בעת ההרשמה. נסה שנית"];
        }
    };
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueueName", NULL);
    
    dispatch_async(myQueue, ^{
        long result ;
        if (self.isOwner)
        {
            result =[[Model instance] addDogOwner:self.user.userName password:self.passwordTextBox.text firstName:self.user.firstName lastName:self.user.lastName phoneNumber:self.user.phoneNumber address:self.user.address city:self.user.city dog:((DogOwner*)self.user).dog];
        }
        else
        {
            result = [[Model instance] addDogWalker:self.user.userName password:self.passwordTextBox.text  firstName:self.user.firstName lastName:self.user.lastName phoneNumber:self.user.phoneNumber address:self.user.address city:self.user.city age:((DogWalker*)self.user).age priceForHour:((DogWalker*)self.user).priceForHour isComfortableOnMorning:((DogWalker*)self.user).isComfortableOnMorning isComfortableOnAfternoon:((DogWalker*)self.user).isComfortableOnAfternoon isComfortableOnEvening:((DogWalker*)self.user).isComfortableOnEvening];
        }
        
        
        
        dispatch_queue_t mainQ = dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
            afterSignUp(result);
        });
        
    } );
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDogWalkerScreen"]){
        DogWalkerTabsViewController* tabsVC = segue.destinationViewController;
        tabsVC.dogWalker = (DogWalker*)self.user;
    }else{
        DogOwnerTabsViewController* tabsVC = segue.destinationViewController;
        tabsVC.dogOwner = (DogOwner*)self.user;
    }
}
@end
