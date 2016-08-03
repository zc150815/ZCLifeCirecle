//
//  LSJTalkTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTalkTableViewController.h"
#import "LSJTalkCell.h"
#import "LSJTalkModel.h"
#import <Masonry.h>
#import "LSJCommentTableViewCell.h"
#import "LSPersonageViewController.h"
@interface LSJTalkTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, copy) NSString *comm;
@property (nonatomic, weak) UIView *shareView;
@property (nonatomic, strong) NSArray *pictureArr;
@end

@implementation LSJTalkTableViewController
- (NSArray *)pictureArr{
    if (_pictureArr == nil) {
        _pictureArr = @[@"u146",
                       @"u147",
                       @"u148",
                       @"u149",
                       @"u150"
                       ];
    }
    return  _pictureArr;

}
#pragma mark -懒加载
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [LSJTalkModel TalkArr];
    }
    return _dataArr;
}
static    NSString *cellID = @"cellID";
static    NSString *cell = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:  UITableViewScrollPositionBottom animated:NO];
    self.title = @"话题";
    //注册
    [self.tableView registerClass:[LSJCommentTableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[LSJTalkCell class] forCellReuseIdentifier:cell];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(contentField:) name:@"contentField" object:nil];
    
    UITapGestureRecognizer *Gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
    [self.view addGestureRecognizer:Gesture];
}
-(void)contentField:(NSNotification *)notificate{
    self.comm = notificate.object;
}

- (void)handleClickReturnBtn:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableViewP{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.dataArr.count;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSJTalkCell *Talkcell = [tableView dequeueReusableCellWithIdentifier:cell];
    LSJCommentTableViewCell *Commentcell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (indexPath.section == 0) {
        if (Talkcell == nil) {
            Talkcell = [[LSJTalkCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cell];
        }
        LSJTalkModel *model = self.dataArr[indexPath.row];
        Talkcell.pictureArr = @[@"u146",
                            @"u147",
                            @"u148",
                            @"u149",
                            @"u150"
                            ];
        Talkcell.model = model;
        [Talkcell.sendButton addTarget:self action:@selector(clicksendButton) forControlEvents:UIControlEventTouchUpInside];
        self.shareView = Talkcell.shareView;
        [Talkcell.shareButton addTarget:self action:@selector(clickshareButton) forControlEvents:UIControlEventTouchUpInside];
        return Talkcell;
    }else if (indexPath.section == 1){
        if ( Commentcell == nil) {
             Commentcell = [[LSJCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
       LSJTalkModel *model = self.dataArr[indexPath.row];
       Commentcell.model = model;
        return  Commentcell;
    }
    return Talkcell;
}

- (void)clickshareButton{
    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 120)];
    shareView.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    self.shareView = shareView;
    [self.view addSubview:shareView];
    
    
    CGFloat marginX = 10;
    CGFloat buttonH = 50;
    CGFloat mainW = [UIScreen mainScreen].bounds.size.width;
    for (int i = 0; i < self.pictureArr.count; i++) {
        
        CGFloat buttonW = (mainW - (self.pictureArr.count + 1) * marginX)/self.pictureArr.count;
        CGFloat buttonX = marginX + (buttonW + marginX) * i;
        CGFloat buttonY = marginX;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        [shareView addSubview:btn];
        UIImage *Img = [UIImage imageNamed:self.pictureArr[i]];
        [btn setBackgroundImage:Img forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIButton *cancleButton = [[UIButton alloc]init];
    [shareView addSubview:cancleButton];
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(shareView);
        make.height.mas_equalTo(40);
    }];
    cancleButton.backgroundColor = [UIColor brownColor];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(clickcancleButton) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickBtn{
    [self.shareView removeFromSuperview];
}
- (void)clickcancleButton{
    [self.shareView removeFromSuperview];
}
- (void)clickTap:(UIGestureRecognizer *)tap{
    [self.shareView removeFromSuperview];
}
//点击发表评论
-(void)clicksendButton{
    if(self.comm == nil){
        return;
    }

    //1.创建一个数据模型
    LSJTalkModel *model = [[LSJTalkModel alloc]init];
    
    //2.给创建好的数据模型赋值
    model.time = @"07-26  16:45";
    model.comment = self.comm;
    
    //把创建好的模型添加到数据源数组里。
    [self.dataArr addObject:model];
    [self.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 500;
    }else if (indexPath.section == 1){
        return 80;
    }
    return 0;
}
//取消cell的选择效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end
