//
//  LSJOneCollectionView.m
//  LifeCircle
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJOneCollectionView.h"
#import "LSJGroupCell.h"
#import "LSJOneCollectionViewCell.h"
#import "LSJPageViewController.h"
#import "LSJHomeTableViewController.h"
#import "LSJInfoTableViewController.h"
#import "LSJBusinessTableViewController.h"
#import "LSJEvaluateTableViewController.h"
#import "LSJGroupCollectionViewController.h"


@interface LSJOneCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UINavigationController *NaVc;

@property (strong, nonatomic) NSArray *iconCircleArr;

@end

@implementation LSJOneCollectionView

static NSString * const reuseIdentifier = @"Cell";

-(NSArray *)iconCircleArr{
    
    if (_iconCircleArr == nil) {
        _iconCircleArr = [LSJGroupCircleModel GroupCircleModelWithPlistName:@"HomeCircleModel.plist"];
    }
    return _iconCircleArr;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{

    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.dataSource = self;
        
        self.delegate = self;
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self registerClass:[LSJOneCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
    }
    return self;

}

#pragma mark -数据源方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LSJOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    LSJGroupCircleModel *model = self.iconCircleArr[indexPath.item];
    cell.model = model;
    
    return cell;
}

#pragma mark - 返回每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取屏幕的size
    CGSize size_screen = [UIScreen mainScreen].bounds.size;
    
    CGFloat width = size_screen.width/4;
  
    
    CGFloat height = width ;
    
    return CGSizeMake(width, height);
    
}
//点击cell 跳转控制器
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    LSJGroupCircleModel *model = self.iconCircleArr[indexPath.item];
    if (indexPath.row == 7) {
        
        LSJGroupCollectionViewController *circleVC = [[LSJGroupCollectionViewController alloc]init];

//        circleVC.title = 
        [[NSNotificationCenter defaultCenter]postNotificationName:@"pushController" object:circleVC];
        return;

    }
    
    //创建每个圈子的控制器
    LSJPageViewController *circleVC = [[LSJPageViewController alloc]init];
    
    circleVC.title = model.title;
    
    circleVC.leftViewController = [[LSJInfoTableViewController alloc]init];
    
    circleVC.middleViewController = [[LSJBusinessTableViewController alloc]init];
    
    circleVC.rightViewController = [[LSJEvaluateTableViewController alloc]init];

    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushController" object:circleVC];
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushController" object:nil userInfo:@{@"vcName":@"LSJPageViewController"}];
}



@end
