//
//  LSJGoodsDetailTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGoodsDetailTableViewController.h"
#import <Masonry.h>
@interface LSJGoodsDetailTableViewController ()

@end

@implementation LSJGoodsDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    [self setHeadView];

}
- (void)setHeadView{
    UIView *headView = [[UIView alloc]init];
    self.tableView.tableHeaderView = headView;
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    
    UILabel *TitleLable = [[UILabel alloc]init];
    [headView addSubview:TitleLable];
    [TitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headView).offset(9);
        make.left.mas_equalTo(headView).offset(10);
    }];
    TitleLable.text = @"蜗牛咖啡";
    
    UILabel *contentLabel = [[UILabel alloc]init];
    [headView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(TitleLable.mas_bottom).offset(9);
        make.right.mas_equalTo(headView).offset(10);
        make.left.mas_equalTo(headView).offset(10);
    }];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus , nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.";
    
    UIButton *button = [[UIButton alloc]init];
    [headView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(headView).offset(-10);
        make.top.mas_equalTo(contentLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    button.backgroundColor = [UIColor redColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}
//
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
