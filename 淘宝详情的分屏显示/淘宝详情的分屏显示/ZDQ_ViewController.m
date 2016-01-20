//
//  ZDQ_ViewController.m
//  淘宝详情的分屏显示
//
//  Created by yb on 16/1/20.
//  Copyright © 2016年 yb. All rights reserved.
//

#import "ZDQ_ViewController.h"
#import "ProductDetailSecondPartHeader.h"
#import "ProductRefreshFooter.h"
@interface ZDQ_ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

/** <#label#> */
@property(nonatomic,strong) UITableView * tableView;

/** st */
@property(nonatomic,strong) UIScrollView * bigScrollV;

/** <#label#> */
@property(nonatomic,strong) UIWebView * webV;

#define IPHONE_W ([UIScreen mainScreen].bounds.size.width)
#define IPHONE_H ([UIScreen mainScreen].bounds.size.height)

@end

@implementation ZDQ_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
   
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //上拉，执行对应的操作---改变底层滚动视图的滚动到对应位置
        //设置动画效果
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
//            self.bigScrollV.contentOffset = CGPointMake(0, (IPHONE_H-64));
        } completion:^(BOOL finished) {
            //结束加载
            [self.tableView.footer endRefreshing];
        }];
    }];;
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    self.webV.scrollView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //下拉执行对应的操作
        //        self.scrollV.contentOffset = CGPointMake(0, 0);
        [self.bigScrollV setContentOffset:CGPointMake(0, 0) animated:YES];
        //结束加载
        [self.webV.scrollView.header endRefreshing];
    }];
    
    
}
-(UIScrollView *)bigScrollV
{
    if (!_bigScrollV) {
        _bigScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0,  64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _bigScrollV.contentSize = CGSizeMake(IPHONE_W, (IPHONE_H-64) * 2);
        _bigScrollV.pagingEnabled = YES;
        _bigScrollV.scrollEnabled = YES;
        _bigScrollV.backgroundColor = [UIColor redColor];
        _bigScrollV.delegate = self;
        [self.view addSubview:_bigScrollV];
    }
    return _bigScrollV;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.bigScrollV addSubview:_tableView];
    }
    return _tableView;
}
-(UIWebView *)webV
{
    if (!_webV) {
        _webV = [[UIWebView alloc] initWithFrame:CGRectMake(0, IPHONE_H-64, IPHONE_W, IPHONE_H-64)];
        [_webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
        [self.bigScrollV addSubview:_webV];
    }
    return _webV;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"scrollView.contentOffset.y = %lf,velocity = %@",scrollView.contentOffset.y,NSStringFromCGPoint(velocity));
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
