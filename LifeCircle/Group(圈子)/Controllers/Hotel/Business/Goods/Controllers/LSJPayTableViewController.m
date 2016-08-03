//
//  LSJPayTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPayTableViewController.h"
#import "LSJPayModel.h"
@interface LSJPayTableViewController ()

@property (nonatomic, strong) NSArray *dataArr;


@end

@implementation LSJPayTableViewController
#pragma mark -懒加载
- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [LSJPayModel TalkArr];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHeadView];
}
//设置头部视图
- (void)setupHeadView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    self.tableView.tableHeaderView = headView;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [headView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headView).offset(20);
        make.left.mas_equalTo(headView).offset(10);
    }];
    titleLabel.text = self.model.title;
    titleLabel.font = [UIFont systemFontOfSize:21];
    titleLabel.textColor = [UIColor greenColor];
    
    UIView *lineView = [[UIView alloc]init];
    [headView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
        make.left.right.mas_equalTo(headView);
        make.height.mas_equalTo(1);
    }];
    lineView.backgroundColor = [UIColor blackColor];

    
    UILabel *Num = [[UILabel alloc]init];
    [self.view addSubview:Num];
    [Num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    Num.text = @"数量";
    
    
    UILabel *showNum = [[UILabel alloc]init];
    [self.view addSubview:showNum];
    [showNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).offset(20);
        make.right.mas_equalTo(headView).offset(-10);
    }];
    showNum.text = self.showNum;
    
    UIView *lineView1 = [[UIView alloc]init];
    [headView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Num.mas_bottom).offset(10);
        make.left.mas_equalTo(headView).offset(10);
        make.right.mas_equalTo(headView).offset(-10);
        make.height.mas_equalTo(1);
    }];
    lineView1.backgroundColor = [UIColor grayColor];
    
    UILabel *sumPrice = [[UILabel alloc]init];
    [self.view addSubview:sumPrice];
    [sumPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).offset(20);
        make.left.mas_equalTo(headView).offset(10);
    }];
    sumPrice.text = @"总价";
    
    UILabel *sumNum = [[UILabel alloc]init];
    [self.view addSubview:sumNum];
    [sumNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).offset(20);
        make.right.mas_equalTo(headView).offset(-10);
    }];
    sumNum.text = [NSString stringWithFormat:@"%@元",self.sumNum];
    
    UIView *lineView2 = [[UIView alloc]init];
    [headView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Num.mas_bottom).offset(10);
        make.left.mas_equalTo(headView).offset(10);
        make.right.mas_equalTo(headView).offset(-10);
        make.height.mas_equalTo(1);
    }];
    lineView2.backgroundColor = [UIColor grayColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    LSJPayModel *model = self.dataArr[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.desLabel;
    cell.imageView.image = [UIImage imageNamed:model.iconImg];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"复选框"]];
    cell.accessoryView = imageView;
    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,60)];
    UILabel *lab = [[UILabel alloc]init];
    [view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view).offset(30);
        make.left.mas_equalTo(view).offset(10);
    }];
    lab.text = @"选择支付方式";
    lab.textColor = [UIColor redColor];
    lab.font = [UIFont systemFontOfSize:21];
    return view;
}
//组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
//组尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,60)];
    UIButton *button = [[UIButton alloc]init];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view).offset(10);
        make.left.mas_equalTo(view).offset(10);
        make.right.mas_equalTo(view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [button setTitle:@"确认支付" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:253.0/255 green:132.0/255 blue:36.0/255 alpha:1.0];
    return view;
}
//组尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 60;
}
@end
