//
//  ViewController.m
//  Chart
//
//  Created by Rostyslav.Stepanyak on 2/16/16.
//  Copyright (c) 2016 Rostyslav.Stepanyak. All rights reserved.
//

#import "ViewController.h"
#import "ChartModel.h"
#import "MTChartCellView.h"
#import "CPoint.h"

#define CELL_WIDTH        100  // In toher words thats the space between your x axis points

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ChartModel *chartModel;
@end

@implementation ViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.chartModel = [[ChartModel alloc] init];
    [self.chartModel populate];
    self.tableView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MTChartCellView"
                                               bundle:nil]
         forCellReuseIdentifier:@"chartItemReuseIdentifier"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupTimer];
}

- (void)setupTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.8
                                                      target:self
                                                    selector:@selector(addVertex)
                                                    userInfo:nil
                                                     repeats:YES];
    
    [timer fire];
}

//Add your 4 points per second*/
- (void)addVertex {
    [self.tableView beginUpdates];
    
    //Point 1
    [self.chartModel appendRandomPoint];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.chartModel pointsCount]-1 inSection:0]]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    
    //Point 2
    [self.chartModel appendRandomPoint];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.chartModel pointsCount]-1 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    //Point 3
    [self.chartModel appendRandomPoint];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.chartModel pointsCount]-1 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationAutomatic];

    
    [self.tableView endUpdates];
    
    [self performSelector:@selector(scroll) withObject:nil afterDelay:0.25];
}

- (void)scroll {
    CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - 6*CELL_WIDTH);
    [self.tableView setContentOffset:offset animated:YES];
}

#pragma mark tablewview datasource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MTChartCellView *cell = [self.tableView dequeueReusableCellWithIdentifier:@"chartItemReuseIdentifier" forIndexPath:indexPath];
    
    CPoint *point = [self.chartModel getPoint:(int)indexPath.row];
    CPoint *previousPoint = nil;
    
    int row = (int)indexPath.row;
    
    if(row > 0) {
        previousPoint = [self.chartModel getPoint:(int)(indexPath.row - 1)];
    }
    
    
    [cell.drawableView setPreviousPoint:previousPoint];
    [cell.drawableView setPoint:point];
    [cell.drawableView setNeedsDisplay];
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int count = (int)[self.chartModel pointsCount];
    return count;
}

#pragma mark - table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_WIDTH;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        
    }
}

@end


