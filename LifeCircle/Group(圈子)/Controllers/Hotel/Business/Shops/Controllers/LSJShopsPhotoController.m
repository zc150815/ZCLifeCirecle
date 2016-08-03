//
//  LSJShopsPhotoController.m
//  LifeCircle
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJShopsPhotoController.h"
#import "LSJShopsPhotoCell.h"

@interface LSJShopsPhotoController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation LSJShopsPhotoController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    
    
    
    //    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layout.minimumInteritemSpacing = 10;
    
    layout.minimumLineSpacing = 10;
    
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:233 / 255.0 green:233 / 255.0 blue:233 / 255.0 alpha:1.0];
    
    self.navigationItem.title = @"商家相册";
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[LSJShopsPhotoCell class] forCellWithReuseIdentifier:reuseIdentifier];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LSJShopsPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark - 返回每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //获取屏幕的size
    CGSize size_screen = [UIScreen mainScreen].bounds.size;
    
    CGFloat leftMargin = 10;
    
    CGFloat Xmargin = 10;
    
    CGFloat width = (size_screen.width - 2 * leftMargin -  Xmargin) / 2;
    
    CGFloat height = width * 1.2;
    
    return CGSizeMake(width, height);
    
}

@end
