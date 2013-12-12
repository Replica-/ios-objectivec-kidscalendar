//
//  EventCreateViewController.m
//  KidCalendar
//
//  Created by Daniel Santoro on 12/12/2013.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "EventCreateViewController.h"
#import "SelectEventViewController.h"
#import "Assets.h"

@interface EventCreateViewController ()

@end

@implementation EventCreateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SelectEventViewController *viewController = segue.destinationViewController;
    
    if ([viewController isKindOfClass:[SelectEventViewController class]]){
        viewController.myData = self.myData;
        
    }
    
}

-(IBAction)unwindFromFreq:(UIStoryboardSegue*) unwindSegue{
    
    
}
-(IBAction)unwindFromStartDate:(UIStoryboardSegue*) unwindSegue{
    
    
}

-(IBAction)unwindToMain:(UIStoryboardSegue *)unwindSegue{
    NSLog(@"we made it!");
    UIViewController* sourceViewController = unwindSegue.sourceViewController;

    if ([sourceViewController isKindOfClass:[SelectEventViewController class]])
    {
        //Get event information
        SelectEventViewController *selController = (SelectEventViewController*) sourceViewController;
        Event *e = [selController getCurrentEvent];
        [self.eventLabel setText:e.getLabel];
    }
    
    
}
/*
-(void)setTest{
    
    NSLog(@"Test");
}
*/

@end
