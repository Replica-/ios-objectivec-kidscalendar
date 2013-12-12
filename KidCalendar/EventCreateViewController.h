//
//  EventCreateViewController.h
//  KidCalendar
//
//  Created by Daniel Santoro on 12/12/2013.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDay.h"

@interface EventCreateViewController : UITableViewController

    

@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;


@property (nonatomic) EventDay *myData;

-(IBAction)unwindToMain:(UIStoryboardSegue*) unwindSegue;
-(IBAction)unwindFromFreq:(UIStoryboardSegue*) unwindSegue;
-(IBAction)unwindFromStartDate:(UIStoryboardSegue*) unwindSegue;
@end
