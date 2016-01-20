//
//  ProductRefreshFooter.m
//  Bqu
//
//  Created by yb on 16/1/4.
//  Copyright © 2016年 yb. All rights reserved.
//

#import "ProductRefreshFooter.h"

@interface ProductRefreshFooter ()

@property (nonatomic, strong)UILabel * title;
@property (nonatomic ,strong) UIImageView * image;
@end

@implementation ProductRefreshFooter


-(void)prepare
{
    [super prepare];
    self.mj_h = 31;
    self.backgroundColor = [UIColor grayColor];
    
    UILabel * title = [[UILabel alloc] init];
    title.font = [UIFont systemFontOfSize:11];
//    title.textColor = [UIColor  colorWithHexString:@"#999999"];
    title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:title];
    self.title = title;
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"B区详情页01上拉箭头"]];
    [self addSubview:image];
    self.image = image;


    
}
-(void)placeSubviews
{
    [super placeSubviews];
    
    self.title.frame = self.bounds;
    self.title.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
//    self.image.size = CGSizeMake(12, 12);
    self.image.center = CGPointMake(self.mj_w * 0.5 - 54, self.mj_h*0.5);
    
}
#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
//    NSLog(@"change1= %@",change);

}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
//    NSLog(@"change2= %@",change);

}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    NSLog(@"change3= %@",change);

    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.title.text = @"上拉查看图文详情";
            break;
        case MJRefreshStatePulling:
            self.title.text = @"释放查看图文详情";
            break;
        case MJRefreshStateRefreshing:
            self.title.text = @"释放查看图文详情";
            break;
        case MJRefreshStateNoMoreData:
            self.title.text = @"";
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
//    NSLog(@"pullingPercent= %lf",pullingPercent);


}

@end
