//
//  LSJTwoCollectionView.m
//  LifeCircle
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTwoCollectionView.h"
#import "LSJTwoCollectionViewCell.h"
#import "LSJShopTableViewController.h"
#import "LSJHomeModel.h"
@interface LSJTwoCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *arr;

@end
static NSString * const reuseIdentifier = @"cell";
@implementation LSJTwoCollectionView
-(NSArray *)arr{
    if (_arr == nil) {
        
        _arr = [LSJHomeModel GroupCircleModelWithPlistName:@"HomeHotel.plist"];
    }
    
    return _arr;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
//    CGSize size = [UIScreen mainScreen].bounds.size;
    
    flowlayout.minimumLineSpacing = 0;
    flowlayout.minimumInteritemSpacing = 0;
    if (self = [super initWithFrame:frame collectionViewLayout:flowlayout]) {
        
        self.dataSource = self;
        self.delegate = self;
        
//        [self registerClass:[LSJTwoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [self registerClass:[LSJTwoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
      
        
    }
    return self;
}

#pragma mark - 数据源方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    LSJTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    LSJTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    LSJHomeModel *model = _arr[indexPath.row];
    
    cell.model = model;
    
    //调试*****
//    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取屏幕的size
    CGSize screen = [UIScreen mainScreen].bounds.size;
    CGFloat with = screen.width/2;
    
    //调试************
    CGFloat height = 196.0 / 640 *[UIScreen mainScreen].bounds.size.width;
    
    return CGSizeMake(with, height);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LSJShopTableViewController *Vc = [[LSJShopTableViewController alloc]init];
  
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeController" object:Vc];
}

@end
