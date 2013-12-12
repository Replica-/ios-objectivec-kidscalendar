//
//  SelectEventViewController.m
//  KidCalendar
//
//  Created by Daniel Santoro on 9/12/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "SelectEventViewController.h"
#import "SelectEventViewCollection_View_Cell.h"
#import "Assets.h"
#import "Event.h"

@interface SelectEventViewController ()

@end

@implementation SelectEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self eventCollectionView] setDataSource:self];
    [[self eventCollectionView] setDelegate:self];
    
    
}




-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    _currentEvent = [Assets lookupAssetByIndex:indexPath.item];
    
    
    [self performSegueWithIdentifier:@"unwindToMain" sender:self];
 
    
    
//[self.navigationController popViewControllerAnimated:YES];
  //  EventCreateViewController *viewController = [self.navigationController ;
    //[viewController setTest];
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [Assets countAssets];//[daysStrings count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIndex = @"EventCell";
    SelectEventViewCollection_View_Cell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:CellIndex forIndexPath:indexPath];
    
    Event *anItem = [Assets lookupAssetByIndex:indexPath.item];
    
    NSString *imageFile = [anItem getImage];
    [[cell eventImage] setImage:[UIImage imageNamed:imageFile]];
    
    //cell->listEvents = [[NSMutableArray alloc]initWithObjects:@"mother",@"kinder",@"christmas", nil];
    
    //Index path +1 onto the date.
    
    return cell;

    
}

-(Event*) getCurrentEvent{
    return self.currentEvent;
    
}


@end
