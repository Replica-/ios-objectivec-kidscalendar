//
//  ViewController.h
//  KidCalendar
//
//  Created by Daniel Santoro on 21/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,NSFetchedResultsControllerDelegate>{
    NSDate *startOfWeek;
    NSDate *currentDate;
    NSCalendar *cal;
    NSDateFormatter *weekdayString;
    NSMutableArray *eventsListing;
    
}
@property (weak, nonatomic) IBOutlet UIButton *ButtonTest;


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;



@property (weak, nonatomic) IBOutlet UICollectionView *daysCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *eventCollection;


- (IBAction) addIcon;


@end
