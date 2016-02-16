//
//  CView.h
//  
//
//  Created by Rostyslav.Stepanyak on 2/16/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CPoint.h"

@interface CView : UIView
@property (nonatomic, strong) CPoint *point;
@property (nonatomic, strong) CPoint *previousPoint;
@end
