//
//  ChartModel.m
//  
//
//  Created by Rostyslav.Stepanyak on 2/16/16.
//
//

#import "ChartModel.h"
#import "CPoint.h"
#include <stdlib.h>

@interface ChartModel()
@property (nonatomic, strong) NSMutableArray *points;
@end

@implementation ChartModel

- (NSMutableArray *)points
{
    if(!_points) {
        _points = [[NSMutableArray alloc] init];
    }
    
    return _points;
}

- (NSUInteger)pointsCount {
    return self.points.count;
}

- (void)addPoint:(CPoint *) point {
    [self.points addObject:point];
}

- (CPoint *)getPoint:(int) index {
    return [self.points objectAtIndex:index];
}

- (void)populate {
    [self.points addObject:[[CPoint alloc] initWithY:10]];
    [self.points addObject:[[CPoint alloc] initWithY:20]];
    [self.points addObject:[[CPoint alloc] initWithY:25]];
    [self.points addObject:[[CPoint alloc] initWithY:55]];
    [self.points addObject:[[CPoint alloc] initWithY:355]];
    [self.points addObject:[[CPoint alloc] initWithY:145]];
    [self.points addObject:[[CPoint alloc] initWithY:10]];
    [self.points addObject:[[CPoint alloc] initWithY:8]];
    
    [self.points addObject:[[CPoint alloc] initWithY:11]];
    [self.points addObject:[[CPoint alloc] initWithY:22]];
    [self.points addObject:[[CPoint alloc] initWithY:33]];
    [self.points addObject:[[CPoint alloc] initWithY:44]];
}

- (void)appendRandomPoint {
    int radnom = arc4random_uniform(330);
    [self.points addObject:[[CPoint alloc] initWithY:radnom]];
}

@end
