//
//  LSJNearbyTableView.m
//  LifeCircle
//
//  Created by Ning Xie on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNearbyTableView.h"
#import "LSJNearbyTableViewCell.h"


@interface LSJNearbyTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LSJNearbyTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self.delegate = self;
    
//    [self reloadData];
    [self registerClass:[LSJNearbyTableViewCell class] forCellReuseIdentifier:@"tableview"];
    if (self = [super initWithFrame:frame style:style]) {

    }
    return self;
}
-(instancetype)init
{
    self.delegate = self;
//    [self reloadData];
    
    [self registerClass:[LSJNearbyTableViewCell class] forCellReuseIdentifier:@"tableview"];
    if (self = [super init]) {
        
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LSJNearbyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableview"];
    if (cell == nil) {
        cell = [[LSJNearbyTableViewCell alloc]init];
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
    
}

@end
