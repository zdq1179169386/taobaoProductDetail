//
//  ProductDetailSecondPartHeader.m
//  Bqu
//
//  Created by yb on 16/1/7.
//  Copyright © 2016年 yb. All rights reserved.
//

#import "ProductDetailSecondPartHeader.h"

@interface ProductDetailSecondPartHeader ()

@property (nonatomic, strong) UILabel * title;

@property (nonatomic, strong) UIImageView * icon;

@end

@implementation ProductDetailSecondPartHeader

- (void)prepare
{
    [super prepare];
    // 设置控件的高度
    self.mj_h = 0;
//    self.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
//
//    // 添加label
//    UILabel *label = [[UILabel alloc] init];
//    label.textColor = [UIColor colorWithHexString:@"#999999"];
//    label.font = [UIFont systemFontOfSize:11];
//    label.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:label];
//    self.title = label;
//    
//    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"B区详情页01上拉箭头"]];
//    [self addSubview:logo];
//    self.icon = logo;
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
//    self.title.frame = self.bounds;
//    self.title.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
//    self.icon.center = CGPointMake(self.mj_w*0.5-54 , self.mj_h * 0.5);
}

//#pragma mark 监听scrollView的contentOffset改变
//- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
//{
//    [super scrollViewContentOffsetDidChange:change];
//}
//
//#pragma mark 监听scrollView的contentSize改变
//- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
//{
//    [super scrollViewContentSizeDidChange:change];
//}
//
//#pragma mark 监听scrollView的拖拽状态改变
//- (void)scrollViewPanStateDidChange:(NSDictionary *)change
//{
//    [super scrollViewPanStateDidChange:change];
//}

#pragma mark 监听控件的刷新状态
//- (void)setState:(MJRefreshState)state
//{
//    MJRefreshCheckState;
//    
//    // 根据状态做事情
//    if (state == MJRefreshStateIdle) {
//        
//        self.title.text = @"下拉返回商品详情";
//        
//    }else if (oldState == MJRefreshStateRefreshing) {
//            
//            
//    } else if (state == MJRefreshStatePulling) {
//        
//        self.title.text = @"释放返回商品详情";
//        
//         } else if (state == MJRefreshStateRefreshing) {
//       
//        
//    }
//    
//}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
}


@end
