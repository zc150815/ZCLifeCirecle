//
//  LSJPictureNewsCollectionViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPictureNewsCollectionViewController.h"
#import "LSJPictureNewsCollectionViewCell.h"
#import "LSJNewsTextViewController.h"

#import "LSJNetNewsModel.h"

@interface LSJPictureNewsCollectionViewController ()


@property (nonatomic, strong)NSArray *dataArr;

@end


static int newsNum = 0;

@implementation LSJPictureNewsCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[LSJPictureNewsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationItem.title = @"图片新闻";
}

-(NSArray *)dataArr
{
    if (_dataArr == nil) {
        [LSJNetNewsModel downloadNewsWithUrlstr:@"http://c.m.163.com/nc/article/list/T1348649654285/0-100.html" successBlock:^(NSArray *array) {
            _dataArr = array;
            
            [self.collectionView reloadData];
            
        } failBlock:^(NSError *error) {
            
        }];
    }
    return _dataArr;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LSJNetNewsModel *model = self.dataArr[newsNum%99];

    
    LSJPictureNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[LSJPictureNewsCollectionViewCell alloc]initWithFrame:CGRectMake(10, 10, 10, 10)];
    }
    
    cell.model = model;
    newsNum++;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    LSJNetNewsModel *model = self.dataArr[newsNum%99];
    
    LSJNewsTextViewController *news = [[LSJNewsTextViewController alloc]init];
    
    news.urlStr = model.url_3w;
    if (model.url_3w) {
        
        [self.navigationController pushViewController:news animated:YES];
    }
}
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
