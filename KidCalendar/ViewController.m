//
//  ViewController.m
//  KidCalendar
///Users/replica/Documents/Development/KidCal/KidCalendar/KidCalendar/ViewController.m
//  Created by Daniel Santoro on 21/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "ViewController.h"
#import "DayCell.h"
#import "Assets.h"
#import "AppDelegate.h"

@implementation ViewController

- (void)insertNewObject:(id)sender
{
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:@"testdata" forKey:@"EventID"];
    
    [newManagedObject setValue:[[NSDate alloc]init] forKey:@"EventDate"];

    
    newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:@"testdata1" forKey:@"EventID"];
     [newManagedObject setValue:[[NSDate alloc]init] forKey:@"EventDate"];
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //UITouch *myTouch = [[event allTouches] anyObject];
    //_ButtonTest.center = [myTouch locationInView:self.view];
    


    
}

-(IBAction)addIcon{
    [_ButtonTest setTitle:@"Test" forState:UIControlStateNormal ];
    [self insertNewObject:_ButtonTest];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self daysCollection] setDataSource:self];
    [[self daysCollection] setDelegate:self];
   /*
    daysStrings = [[NSArray alloc] initWithObjects:@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday",nil];
	*/
    
    
    cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [cal setFirstWeekday:2];
    
    NSDateComponents *components;
    components = [cal components:( NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit ) fromDate:[[NSDate alloc] init]];
    currentDate = [cal dateFromComponents:components];

    
    components = [cal components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:[[NSDate alloc] init]];
    [components setWeekday:2];
    
    startOfWeek  = [cal dateFromComponents:components];
    //Start of the week

    //components = [cal components:( NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    //NSDate *today = [cal dateFromComponents:components]; //This variable should now be pointing at a date object that is the start of today (midnight);
       
    
    weekdayString = [[NSDateFormatter alloc]init];
    [weekdayString setDateFormat: @"EEEE"];
    
    //1 = Sunday
    
   
    [Assets loadImage:@"A.png" withID:@"christmas" andDescription:@"Christmas Day"];
    [Assets loadImage:@"B.png" withID:@"kinder" andDescription:@"Kinder"];
    [Assets loadImage:@"C.png" withID:@"mother" andDescription:@"Mother's Day"];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 7;//[daysStrings count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIndex = @"Cell";
    DayCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:CellIndex forIndexPath:indexPath];

    
    
    //[[cell dayString] setText:[daysStrings objectAtIndex:indexPath.item]];
   
    
    
    cell->listEvents = [[NSMutableArray alloc]initWithObjects:@"mother",@"kinder",@"christmas", nil];
    
   //Index path +1 onto the date.
    NSDateComponents *components;
    components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:startOfWeek];
    [components setHour:24*(indexPath.item)];
    NSDate *nextDay = [cal dateByAddingComponents:components toDate:startOfWeek options:0];
    [[cell dayString] setText:[weekdayString stringFromDate:nextDay]];
   
   // NSLog(@"Day of week %@",[weekdayString stringFromDate:nextDay]);
   
    NSLog(@"Day %@ %@",[weekdayString stringFromDate:nextDay],[weekdayString stringFromDate:currentDate]);
    
    if ([currentDate compare:nextDay] == NSOrderedSame){
      [[cell currentDayPointer] setText:@"Now"];
        [[cell currentDayArrow] setImage:[UIImage imageNamed:@"arrow.png"]];
         NSLog(@"test %@ %@",nextDay,currentDate);
        
        
    }
    else{
        
        [[cell currentDayPointer] setText:@""];

    }
    
    
    [[cell eventListing] setDelegate:cell];
    [[cell eventListing] setDataSource:cell];

    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

//datasource delegate

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"eventID" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil]; //@'MASTER'
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
  
    NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                              error:&error];
    NSManagedObject *aObject = [array objectAtIndex:0];
    NSString *test = [aObject valueForKey:@"eventID" ];
    NSLog(test);
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}


@end
