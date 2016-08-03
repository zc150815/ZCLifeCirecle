//
//  LSJGuideController.m
//  LifeCircle
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGuideController.h"
#import "LSJGuideCell.h"
@interface LSJGuideController ()
//存储背景图片
@property (nonatomic, strong) NSArray<UIImage *> *bgImgAry;
@end

@implementation LSJGuideController
static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init {
    
    // 1.创建流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 1.2 设置大小
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    // 1.3 调整滚动方向 水平滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 1.4 调整间距
    flowLayout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flowLayout];
}

#pragma mark - 懒加载
- (NSArray *)bgImgAry{
    if (_bgImgAry == nil) {
        _bgImgAry = @[
                      [UIImage imageNamed:@"7-1280"],
                      [UIImage imageNamed:@"8-1280"],
                      [UIImage imageNamed:@"9-1281"],
                     ];
    }
    return _bgImgAry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置背景
    self.collectionView.backgroundColor = [UIColor redColor];
    //2.设置分页效果
    self.collectionView.pagingEnabled = YES;
    //3.关闭弹簧效果
    self.collectionView.bounces = NO;
    //4.去掉底部的线
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //注册
    [self.collectionView registerClass:[LSJGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark - Navigation
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bgImgAry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LSJGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //如果是最后一页显示按钮，其它不显示
    if (indexPath.item == (self.bgImgAry.count - 1)) {
        cell.button.hidden = NO;
    }else{
        cell.button.hidden = YES;
    }
    cell.contentView.layer.contents =(__bridge id _Nullable)(self.bgImgAry[indexPath.item].CGImage);
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
