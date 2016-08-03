//
//  LSJHomeTableViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJHomeTableViewController.h"
#import "LSJOneTableViewCell.h"
#import "LSJOneCollectionView.h"
#import "LSJTwoTableViewCell.h"
#import "LSJTwoCollectionView.h"
#import "LSJThreeTableViewCell.h"
#import <SDCycleScrollView.h>
#import "LSJLoginViewController.h"
#import "LSJShopTableViewController.h"
#import "LSJNetNewsModel.h"
#import "LSJHomeModel.h"
#import "LSPersonageViewController.h"

@interface LSJHomeTableViewController () <SDCycleScrollViewDelegate>


@property (nonatomic,strong) NSArray *headerviewArr;
@property (nonatomic,strong) NSArray *DataArr;



@end

@implementation LSJHomeTableViewController

-(NSArray *)DataArr{
    
    if (_DataArr == nil) {
        _DataArr = [LSJHomeModel GroupCircleModelWithPlistName:@"HomeFood.plist"];
    }
    return _DataArr;
    
}

-(instancetype)init{

    return [super initWithStyle:UITableViewStyleGrouped];

}
-(NSArray *)headerviewArr
{
    if (_headerviewArr == nil) {
        
        NSString *str = @"http://c.m.163.com/nc/ad/headline/5-4.html";
        
        [LSJNetNewsModel downloadNewsWithUrlstr:str successBlock:^(NSArray *array) {
            
            _headerviewArr = array;
            [self loadHeadView];
            
        } failBlock:^(NSError *error) {
            
        }];
        
    }
    return _headerviewArr;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = nil;
    //通知
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cutController:) name:@"pushController" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeController:) name:@"changeController" object:nil];
 
    self.tableView.sectionFooterHeight = 0;

    //取消弹簧效果
    self.tableView.bounces = NO;
    
    NSString *str = @"生活圈";
    
    self.navigationItem.title = str;
    
    
    
    
    //cell的注册
    [self.tableView registerClass:[LSJOneTableViewCell class] forCellReuseIdentifier:@"tablecell"];
    [self.tableView registerClass:[LSJTwoTableViewCell class] forCellReuseIdentifier:@"TwoCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LSJThreeTableViewCell" bundle:nil] forCellReuseIdentifier:@"Threecell"];
    
//    [self.tableView registerClass:[LSJLiveCollectionViewCell class] forCellReuseIdentifier:@"Threecell"];
    
    //创建头部视图
    [self loadHeadView];
}



    //跳转控制器
-(void)cutController:(NSNotification *)ViewController{
    
    //通知
    [self.navigationController pushViewController:(UIViewController *)ViewController.object animated:YES];
    
}

-(void)changeController:(NSNotification *)ViewController{
    
    [self.navigationController pushViewController:(UIViewController *)ViewController.object animated:YES];
}


//使用第三方创建头部视图
-(void)loadHeadView{
    
    NSMutableArray *imagesURLStrings = [NSMutableArray arrayWithCapacity:self.headerviewArr.count];
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:self.headerviewArr.count];
    
    for (NSInteger i = 0 ; i < self.headerviewArr.count; i++) {
        
        LSJNetNewsModel *model = self.headerviewArr[i];
        [imagesURLStrings addObject:model.imgsrc];
        [titles addObject:model.title];
    }
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    //
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    
    /*
     block监听点击方式
     
     cycleScrollView2.clickItemOperationBlock = ^(NSInteger index) {
     
     };
     
     */
    cycleScrollView2.frame = CGRectMake(0, 0, 0, 170);

    self.tableView.tableHeaderView = cycleScrollView2;
}


-(void)setUpAndsetIn
{
    LSJLoginViewController *login = [[LSJLoginViewController alloc]init];
    
    [self.navigationController pushViewController:login animated:YES];
}



#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return self.DataArr.count;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        LSJOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell" forIndexPath:indexPath];
        //    cell.backgroundColor = [UIColor grayColor];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        
        LSJOneCollectionView *oneCollectionView = [[LSJOneCollectionView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, (353.0 / 640) * [UIScreen mainScreen].bounds.size.width) collectionViewLayout:layout];
        
        [cell addSubview:oneCollectionView];
        return cell;
    }else if (indexPath.section == 1){
        
        LSJTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwoCell" forIndexPath:indexPath];
        
               return cell;
    }else{
        
        LSJThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Threecell" forIndexPath:indexPath];
        LSJHomeModel *model = self.DataArr[indexPath.row];
        
        cell.model = model;
        return cell;
    }
    
    
    return [[UITableViewCell alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
      
        return (353.0 / 640) * [UIScreen mainScreen].bounds.size.width;
    }else if (indexPath.section == 1){
        
        return (393.0 / 640) * [UIScreen mainScreen].bounds.size.width;
//        return 200;
   
    }
    
    return (180.0 / 640) * [UIScreen mainScreen].bounds.size.width;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1 || section == 2) {
        UIView *view = [[UIView alloc] init];
        UILabel *label = [[UILabel alloc] init];

        if (section == 1) {
            label.text = @"名店推荐";
        }else if(section == 2)
        {
            label.text = @"猜你喜欢";
        }
        //Arial Rounded MT Bold
        //AmericanTypewriter-Bold
        //HelveticaNeue-Bold
        label.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
        label.textColor = [UIColor colorWithRed:233 / 255.0 green:75 / 255.0  blue: 80 / 255.0 alpha:1.0];
        
        [view addSubview:label];
        
        CGFloat labelHeight = (64.0 / 1280) * [UIScreen mainScreen].bounds.size.height;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view).offset(6);
            make.left.equalTo(view).offset(6);
            make.right.equalTo(view);
            make.height.equalTo(@(labelHeight));
        }];
        return view;
    }
    return nil;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
        LSJShopTableViewController *GoodVc = [[LSJShopTableViewController alloc]init];
        [self.navigationController pushViewController:GoodVc animated:YES];
  
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 39;
    }else if (section == 2)
    {
        
        return 39;
    }
    return 0;
    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"sendInSuccess"];
    

}

@end
