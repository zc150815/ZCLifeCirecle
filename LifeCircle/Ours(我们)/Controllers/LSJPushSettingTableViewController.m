//
//  LSJPushSettingTableViewController.m
//  LifeCircle
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPushSettingTableViewController.h"
#import "LSJGroupCircleModel.h"
#import "LSPersonageViewController.h"

#define KLCustomBackgroundColor [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]

@interface LSJPushSettingTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSArray *dataArr;
@property (weak, nonatomic) UIButton *button;

@end

@implementation LSJPushSettingTableViewController

#pragma mark
#pragma mark - data lazy loading

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [LSJGroupCircleModel GroupCircleModelWithPlistName:@"Ourspushset.plist"];
    }
    return _dataArr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KLCustomBackgroundColor;
    self.tableView.allowsSelection = NO;
    //设置 tableView 不能滚动
    self.tableView.scrollEnabled = NO;
    //隐藏tableView 的分割线
    self.tableView.separatorStyle = NO;
    //调用 setupui 方法
    [self setUpUI];
}

- (void)setUpUI{
    

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    
    rightButton.backgroundColor = [UIColor clearColor];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"title_个人资料"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(handleClickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
  

}

#pragma mark
#pragma mark - 设置按钮的点击事件
- (void)handleClickRightBtn:(UIButton *)sender
{
    
    // NSLog(@"点击了我一下");
    LSPersonageViewController *pvc = [[LSPersonageViewController alloc]init];
    [self.navigationController pushViewController:pvc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 #pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return self.dataArr.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 6.0;
   
}
#pragma mark
#pragma mark - 创建 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    LSJGroupCircleModel *model = self.dataArr[indexPath.section];
    cell.textLabel.text = model.title;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    
    [button addTarget:self action:@selector(clickSwitch:) forControlEvents:UIControlEventTouchDown];
    button.tag = indexPath.section;
    [button setImage:[UIImage imageNamed:@"开关_关"] forState:UIControlStateNormal];
     [button setImage:[UIImage imageNamed:@"开关_开"] forState:UIControlStateSelected];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    button.selected = [defaults boolForKey:model.cover];
    
    cell.accessoryView = button;
    
    
    return cell;
}
#pragma mark
#pragma mark - button 的点击事件的保存
-(void)clickSwitch:(UIButton*)sender
{
    if (sender.selected) {
       
        sender.selected = NO;
        
    }
    else
    {
        sender.selected = YES;
        
    }
    
    LSJGroupCircleModel *model = self.dataArr[sender.tag];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:sender.selected forKey:model.cover];
    [defaults synchronize];
    
}

@end
