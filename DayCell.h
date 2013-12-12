//
//  DayCell.h
//  KidCalendar
//
//  Created by Daniel Santoro on 27/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DayCell : UICollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate>{
    @public
    NSMutableArray *listEvents;
    NSDate *theDate;
    
}
@property (weak, nonatomic) IBOutlet UILabel *dayString;
@property (weak, nonatomic) IBOutlet UILabel *currentDayPointer;
@property (weak, nonatomic) IBOutlet UIImageView *currentDayArrow;

@property (weak, nonatomic) IBOutlet UICollectionView *eventListing;
@end
