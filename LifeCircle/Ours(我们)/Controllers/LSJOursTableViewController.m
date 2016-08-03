//
//  LSJOursTableViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJOursTableViewController.h"
#import "LSJGroupCircleModel.h"
#import "LSJOursTableViewCell.h"
#import "LSJAboutUsViewController.h"
#import "LSJFeedbackViewController.h"
#import "LSJPushSettingTableViewController.h"
#import "LSPersonageViewController.h"

//宏定义一个控制器的背景颜色
#define KLCustomBackgroundColor [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]

@interface LSJOursTableViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) NSArray *dataArr;
@property (strong, nonatomic) UITableView *tabelDemo;

@end

@implementation LSJOursTableViewController

#pragma mark
#pragma mark - data lazy loading

- (NSArray *)dataArr{
    if (!_dataArr) {
        //加载 plist 文件
        _dataArr = [LSJGroupCircleModel GroupCircleModelWithPlistName:@"OursModel.plist"];
    }
    return _dataArr;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置控制器的主题
    self.navigationItem.title = @"我们";
    //设置控制器的背景颜色
    self.view.backgroundColor = KLCustomBackgroundColor;
    //设置 tableView 不能滚动
    self.tableView.scrollEnabled = NO;
    //隐藏 tableView 的分割线
    self.tableView.separatorStyle = NO;
   
}

#pragma mark
#pragma mark - 加载数据源的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    //返回在数组中的组的个数
    return self.dataArr.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回组中行的列数
    return 1;
    
}
#pragma mark
#pragma mark - 创建 cell 并实现方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    LSJOursTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LSJOursTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    LSJGroupCircleModel *model = self.dataArr[indexPath.section];
    cell.model = model;
    //设置 cell 的右边的附件样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark
#pragma mark - 设置点击 cell 的时候发生的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

    //获取模型数据
    LSJGroupCircleModel *model= self.dataArr[indexPath.section];
    
    //判断当组号为0,1,2的时候分别推出的控制器
    
    if (indexPath.section == 0) {
        
        LSJAboutUsViewController *aboutUsVC = [[LSJAboutUsViewController alloc]init];
        
        aboutUsVC.title = model.title;
        
        [self.navigationController pushViewController:aboutUsVC animated:YES];
    
    }else if (indexPath.section == 1){
       
        LSJFeedbackViewController *feedBackVC = [[LSJFeedbackViewController alloc]init];
        
        feedBackVC.title = model.title;
        
        [self.navigationController pushViewController:feedBackVC animated:YES];
    
    }else if (indexPath.section == 2){
        
        LSJPushSettingTableViewController *pushSetVC = [[LSJPushSettingTableViewController alloc]init];
        
        pushSetVC.title = model.title;
       
        [self.navigationController pushViewController:pushSetVC animated:YES];
    
    }
       
    
}


#pragma mark
#pragma mark - 设置表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 6.0;
    
}
/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
