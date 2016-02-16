//
//  MTProductItemView.m
//  joueclub
//
//  Created by Nick Savula on 7/28/15.
//  Copyright (c) 2015 Tilf AB. All rights reserved.
//

#import "MTChartCellView.h"

@interface MTChartCellView()
@end

@implementation MTChartCellView

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.contentView.translatesAutoresizingMaskIntoConstraints = YES;
}

@end
