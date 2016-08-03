//
//  LSJNewsTableViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNewsTableViewController.h"
#import "LSJTitleTableViewCell.h"
#import "LSJNetNewsTableViewCell.h"

#import "LSJNetNewsModel.h"
#import <SDCycleScrollView.h>
#import "LSJNewsTextViewController.h"

#import "LSJRealtimeTableViewController.h"
#import "LSJPictureNewsCollectionViewController.h"
#import "LSJVideoNewsCollectionViewController.h"
#import "LSJBreakingNewsViewController.h"



@interface LSJNewsTableViewController ()<SDCycleScrollViewDelegate,UIGestureRecognizerDelegate>


@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *headerviewArr;

@end

@implementation LSJNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新闻";
    self.tableView.bounces = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //注册cell
    [self.tableView registerClass:[LSJNetNewsTableViewCell class] forCellReuseIdentifier:@"newscell"];
    
    //加载头部视图
    [self loadHeadView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushControllers:) name:@"titleNews" object:nil];
    
}

-(void)pushControllers:(NSNotification*)nofifacation
{
    [self.navigationController pushViewController:(UIViewController*)nofifacation.object animated:YES];
}

-(void)loadHeadView{
    
    NSMutableArray *imagesURLStrings = [NSMutableArray arrayWithCapacity:self.headerviewArr.count];
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:self.headerviewArr.count];
    
    for (NSInteger i = 0 ; i < self.headerviewArr.count; i++) {
        
        LSJNetNewsModel *model = self.headerviewArr[i];
        [imagesURLStrings addObject:model.imgsrc];
        [titles addObject:model.title];
    }
    
    SDCycleScrollView *header = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    
    header.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    
    header.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    //
    header.titlesGroup = titles;
    header.imageURLStringsGroup = imagesURLStrings;
    
    /*
     block监听点击方式
     
     cycleScrollView2.clickItemOperationBlock = ^(NSInteger index) {
     
     };
     
     */
    header.frame = CGRectMake(0, 0, 0, 170);
    
    self.tableView.tableHeaderView = header;
}

#pragma mark -懒加载数据
-(NSArray *)headerviewArr
{
    if (_headerviewArr == nil) {
        
        NSString *str = @"http://c.m.163.com/nc/ad/headline/0-4.html";
        
        [LSJNetNewsModel downloadNewsWithUrlstr:str successBlock:^(NSArray *array) {
            
            _headerviewArr = array;
            [self loadHeadView];

        } failBlock:^(NSError *error) {
            
        }];
        
    }
    return _headerviewArr;
}

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        
        NSString *str = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html";
        
       [LSJNetNewsModel downloadNewsWithUrlstr:str successBlock:^(NSArray *array) {
           
           _dataArray = array;
           [self.tableView reloadData];
       } failBlock:^(NSError *error) {
           
       }];

    }
    return _dataArray;
}
#pragma mark - Tableview数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else
    {
        return self.dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.section == 0) {
        
        LSJTitleTableViewCell *cell = [[LSJTitleTableViewCell alloc]init];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        __weak LSJNewsTableViewController *weakSelf = self;
        
        [cell setCallBack:^(NewsType type) {
            
            if (type == RealtimeNews) {
                
                LSJRealtimeTableViewController *vc = [[LSJRealtimeTableViewController alloc]initWithStyle:UITableViewStylePlain];
                   [weakSelf.navigationController pushViewController:vc animated:YES];
            }
            else if (type == PictureNews){
                
                UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
                flowlayout.itemSize = CGSizeMake(self.view.bounds.size.width/2, self.view.bounds.size.width *0.7);
                flowlayout.minimumLineSpacing = 10;
                flowlayout.minimumInteritemSpacing = 0;
                
                LSJPictureNewsCollectionViewController *vc = [[LSJPictureNewsCollectionViewController alloc]initWithCollectionViewLayout:flowlayout];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
            else if (type == VideoNews){
                
                UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
                flowlayout.itemSize = self.view.bounds.size;
                flowlayout.itemSize = CGSizeMake(self.view.bounds.size.width/2, self.view.bounds.size.width *0.7);
                flowlayout.minimumLineSpacing = 10;
                flowlayout.minimumInteritemSpacing = 0;
                LSJVideoNewsCollectionViewController *vc = [[LSJVideoNewsCollectionViewController alloc]initWithCollectionViewLayout:flowlayout];
                [weakSelf.navigationController pushViewController:vc animated:YES];

            }
            else
            {
                LSJBreakingNewsViewController *vc = [[LSJBreakingNewsViewController alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];

            }
        }];
        
        return cell;
    }
    
    LSJNetNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newscell" forIndexPath:indexPath];
    
    LSJNetNewsModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    //收起更多按钮弹出的界面
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeMoreView" object:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    LSJNetNewsModel *model = self.dataArray[indexPath.row];
    
    LSJNewsTextViewController *newsText = [[LSJNewsTextViewController alloc]init];
    
    newsText.urlStr = model.url_3w;
    
    if (model.url_3w) {
        
        [self.navigationController pushViewController:newsText animated:YES];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 100;
    }
    return 120;
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
