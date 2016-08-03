//
//  LSJInfoTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJInfoTableViewController.h"
#import "LSJInfoCell.h"
#import "LSJBiginfoCell.h"
#import "LSJHomeModel.h"
#import "LSJShopTableViewController.h"
@interface LSJInfoTableViewController ()
@property (nonatomic, strong)NSArray *dataArr;
@end

@implementation LSJInfoTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [LSJHomeModel GroupCircleModelWithPlistName:@"HomeFood.plist"];
    }
    return _dataArr;
}
#pragma mark - Tableview数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
}

//设置tableviewcell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //每一组第一行数据
    if (indexPath.row == 0) {
        LSJBiginfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[LSJBiginfoCell alloc]init];
        }
        return cell;
    }
    
    //每一组其它行数句
    LSJInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[LSJInfoCell alloc]init];
    }
    LSJHomeModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120;
    }
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSJShopTableViewController *shop = [[LSJShopTableViewController alloc]init];
    [self.navigationController pushViewController:shop animated:YES];
}
@end
