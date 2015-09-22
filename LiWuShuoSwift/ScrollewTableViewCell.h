//
//  ScrollewTableViewCell.h
//  Project_B_Youth_Travel
//
//  Created by 徐继垚 on 15/3/13.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollerActionDeleget<NSObject>


- (void)didTapButton:(UIButton *)button;



@end
@interface ScrollewTableViewCell : UITableViewCell
@property (nonatomic ,retain)UIScrollView * scrollView;
@property (nonatomic ,retain)UIImageView * image;
@property (nonatomic, retain) UIPageControl *page;
@property (nonatomic, assign) NSInteger  count;



@property (nonatomic ,retain)id<ScrollerActionDeleget>deleget;
@property (nonatomic ,assign)NSInteger modelcount;

- (void)drawCellWitharray:(NSMutableArray*)model;
@end
