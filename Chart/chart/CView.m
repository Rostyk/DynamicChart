//
//  CView.m
//  
//
//  Created by Rostyslav.Stepanyak on 2/16/16.
//
//

#import "CView.h"
#import "CPoint.h"

@implementation CView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGPoint startPt;
    if(self.previousPoint) {
        startPt = CGPointMake(self.previousPoint.y, 0) ;
    }
    else {
        startPt = CGPointMake(0, 0);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0f);
    
    CGContextMoveToPoint(context, startPt.x, startPt.y); //start at this point
    
    //CGContextAddLineToPoint(context, self.bounds.size.width, ); //draw to this point
    
    CGContextAddLineToPoint(context, self.point.y, self.bounds.size.height); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

@end
