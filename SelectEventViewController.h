//
//  SelectEventViewController.h
//  KidCalendar
//
//  Created by Daniel Santoro on 9/12/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventCreateViewController.h"
#import "EventDay.h"
#import "Event.h"

@interface SelectEventViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>



@property (nonatomic) Event *currentEvent;
@property (nonatomic) EventDay *myData;
@property (weak, nonatomic) IBOutlet UICollectionView *eventCollectionView;

-(Event *)getCurrentEvent;

@end


