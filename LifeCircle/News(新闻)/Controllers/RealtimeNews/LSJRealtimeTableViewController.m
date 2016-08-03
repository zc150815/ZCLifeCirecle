//
//  LSJRealtimeTableViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJRealtimeTableViewController.h"
#import "LSJRealtimeNewsTableViewCell.h"
#import "LSJRealtimeNewsBigCell.h"

#import "LSJNetNewsModel.h"
#import "LSJNewsTextViewController.h"

@interface LSJRealtimeTableViewController ()

@property (nonatomic, strong)NSArray *dataArr;

@end

static int newsNum = 0;

@implementation LSJRealtimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) ;
    
    self.navigationItem.title = @"实时新闻";

//    self.tableView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);

}

#pragma mark -懒加载数据

-(NSArray *)dataArr
{
    if (_dataArr == nil) {
        [LSJNetNewsModel downloadNewsWithUrlstr:@"http://c.m.163.com/nc/article/list/T1348649580692/0-100.html" successBlock:^(NSArray *array) {
            _dataArr = array;
            
            [self.tableView reloadData];
            
        } failBlock:^(NSError *error) {
            
        }];
    }
    return _dataArr;
}
#pragma mark - Tableview数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 10;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;

}

//设置tableviewcell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
//    LSJNetNewsModel *model = self.dataArr[indexPath.row];
        LSJNetNewsModel *model = self.dataArr[newsNum%99];
    if (indexPath.row == 0) {
        LSJRealtimeNewsBigCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            cell = [[LSJRealtimeNewsBigCell alloc]init];
        }
        cell.model = model;
        
        newsNum++;
        return cell;
    }
    
    LSJRealtimeNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[LSJRealtimeNewsTableViewCell alloc]init];
    }
    cell.model = model;
   
    newsNum++;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSJNetNewsModel *model = self.dataArr[indexPath.row];
    
    LSJNewsTextViewController *news = [[LSJNewsTextViewController alloc]init];
    
    news.urlStr = model.url_3w;
    if (model.url_3w) {
        
        [self.navigationController pushViewController:news animated:YES];
    }
}

//设置tableviewcell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }
    return 60;
}

//设置组头部视图的内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LSJNetNewsModel *model = self.dataArr[newsNum%99];
    
    UILabel *headerLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 50)];
    headerLab.text = model.ptime;
    headerLab.backgroundColor = [UIColor lightGrayColor];
    headerLab.textAlignment = NSTextAlignmentCenter;
    
    return headerLab;
}

//设置组头部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


////取消tableview的组头部视图吸附头部的状态
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{    
    CGFloat sectionHeaderHeight = 50; //sectionHeaderHeight
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
}










@end
