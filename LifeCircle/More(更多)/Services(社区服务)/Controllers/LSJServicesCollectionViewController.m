//
//  LSJGroupCollectionViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJServicesCollectionViewController.h"

#import "LSJServicesCell.h"

#import "LSJgroupCircleModel.h"





@interface LSJServicesCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *iconCircleArr;

@end

@implementation LSJServicesCollectionViewController

static NSString *cellID = @"cell";

-(NSArray *)iconCircleArr{
    
    if (_iconCircleArr == nil) {
        _iconCircleArr = [LSJGroupCircleModel GroupCircleModelWithPlistName:@"ServicesModel.plist"];
    }
    return _iconCircleArr;
}

-(instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.sectionInset = UIEdgeInsetsMake(12, 15, 0, 15);
    
    layout.minimumInteritemSpacing = 10;
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"社会服务";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[LSJServicesCell class] forCellWithReuseIdentifier:cellID];
   
}
-(void)backToIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.iconCircleArr.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LSJServicesCell *circleCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    LSJGroupCircleModel *model = self.iconCircleArr[indexPath.item];
    
    circleCell.model = model;
    
    return circleCell;
    
}

#pragma mark - 点击cell的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取点击的模型数据
    LSJGroupCircleModel *model = self.iconCircleArr[indexPath.item];
    
    //创建每个圈子的控制器
    UIViewController *circleVC = [[UIViewController alloc]init];
    
    circleVC.title = model.title;
    
//    circleVC.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:circleVC animated:YES];
    
}

#pragma mark - 返回每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取屏幕的size
    CGSize size_screen = [UIScreen mainScreen].bounds.size;
    
    CGFloat leftMargin = 15;
    
    CGFloat Xmargin = 24;
    
    CGFloat width = (size_screen.width - 2 * leftMargin - 3 * Xmargin) / 4;
    
    CGFloat height = width * 1.5;
    
    return CGSizeMake(width, height);
    
}

@end







