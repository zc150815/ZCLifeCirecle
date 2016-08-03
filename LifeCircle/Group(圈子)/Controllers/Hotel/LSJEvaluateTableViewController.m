//
//  LSJEvaluateTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJEvaluateTableViewController.h"
#import "LSJEvaluateCell.h"
#import "LSJEvaluateModel.h"
#import "LSJTalkTableViewController.h"
@interface LSJEvaluateTableViewController ()
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation LSJEvaluateTableViewController
#pragma mark - 懒加载
- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [LSJEvaluateModel EvaluateArr];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LSJEvaluateCell class] forCellReuseIdentifier:@"cell"];
    
    //预估行高  cell行高自适应
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSJEvaluateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    LSJEvaluateModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.lookButton addTarget:self action:@selector(clickLookButton) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
//点击查看按钮
-(void)clickLookButton{
    LSJTalkTableViewController *talkVC = [[LSJTalkTableViewController alloc]init];
    [self.navigationController pushViewController:talkVC animated:YES];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 170;
//}
@end
