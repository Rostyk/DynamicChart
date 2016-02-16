//
//  ChartModel.h
//  
//
//  Created by Rostyslav.Stepanyak on 2/16/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CPoint;

@interface ChartModel : NSObject
- (void)addPoint:(CPoint*) point;
- (NSUInteger)pointsCount;
- (CPoint *)getPoint:(int) index;
- (void)populate;
- (void)appendRandomPoint;

@end
