//
//  ViewController.m
//  tableViewTest
//
//  Created by 孙传俊 on 2018/2/28.
//  Copyright © 2018年 lutuxinxi. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

#pragma mark - --------------生命周期--------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self somePrepare];
}

#pragma mark - --------------SomePrepare--------------

#pragma mark - SomePrepare
-(void)somePrepare{
    // 全局设置
    self.title = @"看看";
    // 数据初始化
    [self prepareData];
    // UI初始化
    [self prepareUI];
    // 网络数据请求 (放在ui后)
    [self netWorkData];
}

-(void)prepareData{
}

-(void)prepareUI{
    // 全局设置

    // 子控件设置
    [self configSubView];
}

- (void)netWorkData{
    // 请求放在UI后，得到数据可以刷新UI
}

#pragma mark - --------------系统代理----------------------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f", scrollView.contentOffset.y);
}

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cc"];
    }
    cell.textLabel.text = @"hello world";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - --------------自定义代理----------------------
// 点击跳转


#pragma mark - --------------自定义响应----------------------

#pragma mark - --------------自定义方法----------------------

#pragma mark - --------------get/set----------------------


#pragma mark - --------------UI----------------------
// 创建子控件
- (void)configSubView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;

    [self.view addSubview:self.tableView];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tableView.mj_footer endRefreshing];
    }];

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header endRefreshing];
    }];


}

#pragma mark - --------------other----------------------

@end

