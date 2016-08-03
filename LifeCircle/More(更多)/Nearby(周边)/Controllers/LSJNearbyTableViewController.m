//
//  LSJNearbyTableViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNearbyTableViewController.h"
#import "LSJAllClassButton.h"
#import "LSJNearbyTableViewCell.h"

#import "DPAPI.h"
#import <CoreLocation/CoreLocation.h>
#import "LSJProductInfoViewController.h"
#import "LSJProductListModel.h"



@interface LSJNearbyTableViewController ()<UITableViewDelegate,UITableViewDataSource,DPRequestDelegate,CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) CLLocation *l;

@property (nonatomic,strong) UITableView *shopTableview;

@property (strong, nonatomic) NSArray *businiessArr;
@property (strong, nonatomic) NSArray *productArr;
@property (strong, nonatomic) NSArray *provinceArr;

@property (weak, nonatomic) UIView *groupView;
@property (weak, nonatomic) UIView *cityView;
@property (weak, nonatomic) UILabel *titleLab;

@property (copy, nonatomic) NSString *productGroup;
@property (copy, nonatomic) NSString *cityName;


@property (weak, nonatomic) LSJAllClassButton *cityBtn;


@end

@implementation LSJNearbyTableViewController

-(NSArray *)productArr
{
    if (_productArr == nil) {
        _productArr = [LSJProductListModel LSJProductListModelWithPlistName:@"Products.plist"];
    }
    return _productArr;
}

-(NSArray *)provinceArr
{
    if (_provinceArr == nil) {
        _provinceArr = [LSJProductListModel LSJProductListModelWithPlistName:@"Provinces.plist"];
    }
    return _provinceArr;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.productGroup = @"美食";
    self.cityName = @"北京";

    
    LSJAllClassButton *titleBtn = [[LSJAllClassButton alloc]init];
    
//    [titleBtn setImage:[UIImage imageNamed:@"内容里更多的下拉箭头"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"周边" forState:UIControlStateNormal];
    [titleBtn setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.titleView = titleBtn;
    
    //网络获取数据
    [self getNetMessage];
    
    
    //布局页面
    [self creatHeaderView];
    
    
    
    //添加定位
    self.manager = [[CLLocationManager alloc]init];
     self.manager.delegate = self;
    [self.manager requestAlwaysAuthorization];
    [self.manager  startUpdatingLocation];
//


}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *l = locations[0];
    self.l = l;
    NSLog(@"%@",l);
//    l.coordinate
    [manager  stopUpdatingLocation];
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(NSDictionary *)result
{
    
    self.businiessArr = result[@"deals"];
    [self.shopTableview reloadData];
    
//    NSLog(@"%@",self.businiessArr);

}

-(void)getNetMessage
{

    DPAPI *a = [[DPAPI alloc]init];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[@"city"] = self.cityName;
    dict[@"category"] = self.productGroup;
    
//    dict[@"latitude"] = @(self.l.coordinate.latitude);
//    dict[@"longitude"] = @(self.l.coordinate.longitude);
//    dict[@"radius"] = @(500);
    
    [a requestWithURL:@"v1/deal/find_deals" params:dict delegate:self];
    
//    [self.shopTableview reloadData];


}

//点击全部分类按钮事件
-(void)clickChooseAllClassBtn
{
    
    UIView *groupView = [[UIView alloc]init];
    groupView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    if (self.groupView != nil) {
        
        [self.groupView removeFromSuperview];
        return;
    }
    self.groupView = groupView;
    [self.shopTableview addSubview:groupView];
    
    [groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(33);
        make.width.mas_equalTo(100);
    }];
    
    for (NSInteger i = 0; i < self.productArr.count; i++)
    {
        LSJProductListModel *model = self.productArr[i];
        
        CGFloat GroupBtnW = 100;
        CGFloat GroupBtnH = (self.view.bounds.size.height - 33)/self.productArr.count;
        CGFloat GroupBtnY =  i *GroupBtnH;
        
        UIButton *GroupBtn = [[UIButton alloc]init];
        [GroupBtn setTitle:model.groupName forState:UIControlStateNormal];
        [GroupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        GroupBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        GroupBtn.frame = CGRectMake(0, GroupBtnY, GroupBtnW, GroupBtnH);
        [GroupBtn addTarget:self action:@selector(clickProductGroupBtn:) forControlEvents:UIControlEventTouchDown];
        [self.groupView addSubview:GroupBtn];
        
    }
    
}

//点击产品种类执行的方法
-(void)clickProductGroupBtn:(UIButton *)sender
{
    [self.groupView removeFromSuperview];
    
    self.titleLab.text = [NSString stringWithFormat:@"%@推荐",sender.titleLabel.text];
    
    self.productGroup = sender.titleLabel.text;
    
    [self getNetMessage];
}


//布局标题和滚动tableview
-(void)creatHeaderView
{
    UIView *header = [[UIView alloc]init];
    UILabel *titleLab = [[UILabel alloc]init];
    LSJAllClassButton *chooseBtn = [[LSJAllClassButton alloc]init];
    
    header.backgroundColor = [UIColor whiteColor];
    titleLab.text = @"美食推荐";
    titleLab.font = [UIFont systemFontOfSize:20];
    titleLab.textColor = blueBackColor;
    
    self.titleLab = titleLab;
    
    
    [chooseBtn setTitle:@"全部分类" forState:UIControlStateNormal];
    [chooseBtn setTitleColor:blueBackColor forState:UIControlStateNormal];
    chooseBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [chooseBtn setImage:[UIImage imageNamed:@"内容里更多的下拉箭头"] forState:UIControlStateNormal];
    [chooseBtn addTarget:self action:@selector(clickChooseAllClassBtn) forControlEvents:UIControlEventTouchDown];
    
    
    
    //添加到父控件
    [self.view addSubview:header];
    [header addSubview:titleLab];
    [header addSubview:chooseBtn];
    
    
    //标题各个空间的约束
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(33);
    }];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(header.mas_centerX);
        make.centerY.mas_equalTo(header.mas_centerY);

    }];
    
    [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(header.mas_centerY);
        make.left.equalTo(header.mas_left).offset(10);
    }];
    
    //给标题添加一条线
    UITextField *lines = [[UITextField alloc]init];
    lines.backgroundColor = [UIColor lightGrayColor];
    [header addSubview:lines];
    
    [lines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.right.bottom.mas_equalTo(header);
        
    }];
    
    //添加一个tableview
    UITableView *shopTableview = [[UITableView alloc]initWithFrame:CGRectZero];
    
    shopTableview.backgroundColor =  [UIColor whiteColor];
    self.shopTableview = shopTableview;
    shopTableview.dataSource = self;
    shopTableview.delegate = self;
    [self.view addSubview:shopTableview];
    
    [shopTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(header.mas_bottom);
    }];
    
    //城市选择按钮
    LSJAllClassButton *cityBtn = [[LSJAllClassButton alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    self.cityBtn = cityBtn;
    
    [header addSubview:cityBtn];
    
    [cityBtn setTitle:[NSString stringWithFormat:@"%@",self.cityName] forState:UIControlStateNormal];
    cityBtn.titleLabel.font = [UIFont systemFontOfSize:17];
//    [cityBtn setImage:[UIImage imageNamed:@"内容里更多的下拉箭头"] forState:UIControlStateNormal];
    [cityBtn addTarget:self action:@selector(clickChooseCicyBtn:) forControlEvents:UIControlEventTouchDown];
    [cityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cityBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cityBtn];
    
}
//点击城市选择按钮
-(void)clickChooseCicyBtn:(UIButton *)sender
{
    if (self.cityView) {
        [self.cityView removeFromSuperview];
        return;
    }
    UIView *cityView = [[UIView alloc]init];
    
    [self.view addSubview:cityView];
    
    self.cityView = cityView;
    cityView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    [cityView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.left.right.equalTo(self.view).offset(0);
    }];
    
    
    NSInteger rankNum = 5;
    CGFloat btnMargin = 10;
    CGFloat btnWidth = (self.view.bounds.size.width - (rankNum+1) *btnMargin)/rankNum;
    CGFloat btnHeight = 20;
    
    for (NSInteger i = 0; i < self.provinceArr.count; i++) {
        
        NSInteger rank = i%rankNum;
        NSInteger row = i/rankNum;
        
        LSJProductListModel *model = self.provinceArr[i];
        
        UIButton *provinceBtn = [[UIButton alloc]init];
        provinceBtn.frame = CGRectMake(btnMargin + rank*(btnMargin +btnWidth), btnMargin +row*(btnMargin + btnHeight), btnWidth, btnHeight);
        provinceBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [provinceBtn setTitle:model.name forState:UIControlStateNormal];
        
        [cityView addSubview:provinceBtn];
        
        [provinceBtn addTarget:self action:@selector(clickCityList:) forControlEvents:UIControlEventTouchDown];
        
    }
    
}

//选择城市列表
-(void)clickCityList:(UIButton *)sender
{
    [self.cityView removeFromSuperview];
    
    self.cityName = sender.titleLabel.text;
    
    [self.cityBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
    
    [self getNetMessage];
}

#pragma mark - Tableview数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.businiessArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LSJNearbyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[LSJNearbyTableViewCell alloc]init];
    }
    if (self.businiessArr.count != 0) {
       NSDictionary *d = self.businiessArr[indexPath.row];
        cell.busnessDic = d;
        NSDictionary *y = d[@"businesses"][0];
        
      double lati =  [y[@"latitude"] doubleValue];
        
          double loog =  [y[@"longitude"] doubleValue];
        
        CLLocation *l = [[CLLocation alloc]initWithLatitude:lati longitude:loog];
        
   CLLocationDistance dis = [l distanceFromLocation:self.l];
        
        cell.distanceLab.text = [NSString stringWithFormat:@"%lf 米",dis];
        
        NSLog(@"%lf",dis);
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.groupView removeFromSuperview];
    
    NSDictionary *dic = self.businiessArr[indexPath.row];
    
    LSJProductInfoViewController *productInfoVC = [[LSJProductInfoViewController alloc]init];
    productInfoVC.urlStr = dic[@"deal_url"];
    
    
    [self.navigationController pushViewController:productInfoVC animated:YES];
}




@end
