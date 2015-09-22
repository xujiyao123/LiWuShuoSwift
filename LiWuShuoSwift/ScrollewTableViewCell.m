//
//  ScrollewTableViewCell.m
//  Project_B_Youth_Travel
//
//  Created by 徐继垚 on 15/3/13.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "ScrollewTableViewCell.h"
#import "CommonDefine.h"
#import <UIImageView+WebCache.h>
#import "ScrollerModelHeader.h"

@implementation ScrollewTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -10, ScreenWidth  , 160 )];
        
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.pagingEnabled = YES;
        [self addSubview:_scrollView];
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
        
        _page = [[UIPageControl alloc] initWithFrame:CGRectMake(-10, 135  ,Width * 320,Height * 10)];
       
        //设置点的颜色
        _page.currentPageIndicatorTintColor = [UIColor redColor];
        //[_page addTarget:self action:@selector(pageAction) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_page];

        
        
        
        
        
        
        
        
        
        
    }


    return self;

}
- (void)drawCellWitharray:(NSMutableArray *)model
{
    
  
    
    
    
    self.modelcount = model.count;
    
        _page.numberOfPages = model.count;
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * model.count , 160 *Height);
    for (int i  = 0 ; i < model.count ; i++) {
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(320 * i  * Width, 0 * Height, 320 * Width, 160 * Height)];
          _image.contentMode = UIViewContentModeScaleAspectFit;
        _image.clipsToBounds = YES;
        _image.userInteractionEnabled = YES;
        _image.backgroundColor = [UIColor whiteColor];
        
        ScrollerModelHeader * helder = [[ScrollerModelHeader alloc]init];
        helder = (ScrollerModelHeader *)model[i];
       
        [self.image sd_setImageWithURL:[NSURL URLWithString:helder.image_url]];
        
        [self.scrollView addSubview:_image];
    
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        //  button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(320 * i  * Width, 0 * Height, 320 * Width, 160 * Height);
    //    button.titleLabel.text = [model[i] webURL];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //    button.titleLabel.text = [dataSource[i]oid] ;
        _count = i;
        [self.scrollView addSubview:button];
        
    }

}
- (void)pageAction
{
    [_scrollView setContentOffset:CGPointMake(  (_page.currentPage * ScreenWidth), 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView //代理
{
    _page.currentPage = scrollView.contentOffset.x / 110;
}
- (void)turnPage
{
    NSInteger page = _page.currentPage; // 获取当前的page
    
    [_scrollView scrollRectToVisible:CGRectMake(Width * 320 * (page),0, Width * 320, Height * 110) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
    [_page addTarget:self action:@selector(runTimePage) forControlEvents:UIControlEventValueChanged];
}
// 定时器绑定的方法
- (void)runTimePage
{
    NSInteger page = _page.currentPage; // 获取当前的page
    page++;
    page = page > self.modelcount - 1 ? 0 : page ;
    _page.currentPage = page;
    
    
    [_scrollView setContentOffset:CGPointMake(_page.currentPage * 320, 0) animated:YES];
    [self turnPage];
}
- (void)buttonAction:(UIButton*)sender
{
    if ([self.deleget respondsToSelector:@selector(didTapButton:)])
    {
        [self.deleget performSelector:@selector(didTapButton:)    withObject:sender];
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
