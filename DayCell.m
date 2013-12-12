//
//  DayCell.m
//  KidCalendar
//
//  Created by Daniel Santoro on 27/11/13.
//  Copyright (c) 2013 Daniel Santoro. All rights reserved.
//

#import "DayCell.h"
#import "EventDayCell.h"
#import "Assets.h"

@implementation DayCell


- (id)initWithFrame:(CGRect)frame
{
   
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
             
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIndex = @"EventCell";
    EventDayCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:CellIndex forIndexPath:indexPath];
    
    NSString *eventName = [listEvents objectAtIndex:indexPath.item];
    Event *event = [Assets lookupAsset:eventName];
    NSString *imageFile = [event getImage];
    
    [[cell eventImage] setImage:[UIImage imageNamed:imageFile]];

    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [listEvents count];
}


@end
