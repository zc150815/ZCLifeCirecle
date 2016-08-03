//
//  LSJBusinessTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBusinessTableViewController.h"
#import "LSJBusinessHeadView.h"
#import "LSJBusinessTableViewCell.h"
#import "LSJShopTableViewController.h"
#import "LSJBusinessShopsModel.h"

@interface LSJBusinessTableViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) UITextField *searchField;

@property (strong, nonatomic) NSArray *businessShopArr;

@end

@implementation LSJBusinessTableViewController

-(NSArray *)businessShopArr{

    if (_businessShopArr == nil) {
        _businessShopArr = [LSJBusinessShopsModel BusinessShopsModelWithPlistName:@"HomeFood.plist"];
    }
    return _businessShopArr;
}

-(instancetype)init{

    return [super initWithStyle:UITableViewStyleGrouped];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    LSJBusinessHeadView *headView = [[LSJBusinessHeadView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 60)];
    
    headView.searchField.delegate = self;
    
    self.searchField = headView.searchField;
    
    self.tableView.tableHeaderView = headView;
   
    [self.tableView registerClass:[LSJBusinessTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.sectionFooterHeight = 1;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data sourc

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.businessShopArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LSJBusinessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.model = self.businessShopArr[indexPath.row];
    
    return cell;

}
//设置cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSString *sectionTitle ;
    
    if (section == 0) {
        sectionTitle = @"热门酒店";
    }else if (section == 1){
        
        sectionTitle= @"猜你喜欢";
    }
    
    UILabel *titleLab = [[UILabel alloc]init];
    
    titleLab.font = [UIFont systemFontOfSize:20];
    
    titleLab.textColor = [UIColor redColor];
    
    titleLab.text = sectionTitle;
    
    UIView *titleView = [[UIView alloc]init];
    
    [titleView addSubview:titleLab];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(titleView).offset(5);
        
        make.bottom.equalTo(titleView).offset(0);
        
    }];
    
    
    return titleView;
    
}
//返回组头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.view endEditing:YES];
    
    return YES;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.view endEditing:YES];
    
    LSJShopTableViewController *shopVC = [[LSJShopTableViewController alloc]initWithStyle:UITableViewStyleGrouped];

    
    [self.navigationController pushViewController:shopVC animated:YES];

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    [self.view endEditing:YES];
}


@end
