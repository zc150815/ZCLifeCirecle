//
//  LSJGoodDetailTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGoodDetailTableViewController.h"
#import <Masonry.h>
#import "LSJGoodMiddleCell.h"
#import "LSJShopCell.h"
#import "LSJOrderViewController.h"
@interface LSJGoodDetailTableViewController ()
@property (nonatomic, weak) UIView *shareView;
@property (nonatomic, strong) NSArray *pictureArr;
@property (nonatomic, weak) UIView *headView;
@end

@implementation LSJGoodDetailTableViewController
static  NSString *GoodMiddleCell = @"GoodMiddleCell";
static  NSString *ShopsID= @"ShopsID";
- (NSArray *)pictureArr{
    if (_pictureArr == nil) {
        _pictureArr = @[@"u146",
                        @"u147",
                        @"u148",
                        @"u149",
                        @"u150"
                        ];
    }
    return _pictureArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    [self setUpHeadView];
    //注册cell
    [self.tableView registerClass:[LSJGoodMiddleCell class] forCellReuseIdentifier:GoodMiddleCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"LSJShopCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ShopsID];

    
    //创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeShare:)];
    
    //添加给view
    [self.view addGestureRecognizer:tap];

    UITapGestureRecognizer *Gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
    [self.view addGestureRecognizer:Gesture];

}

-(void)removeShare:(UIGestureRecognizer *)tap{
    
    [self.shareView removeFromSuperview];
    
}

-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
    
}

- (void)setUpHeadView{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 230)];
    self.headView = headView;
    self.tableView.tableHeaderView = headView;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [headView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(headView).offset(9);
    }];
    titleLabel.text = self.model.title;
    
    UILabel *desLabel = [[UILabel alloc]init];
    [headView addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(9);
        make.left.mas_equalTo(headView).offset(10);
        make.right.mas_equalTo(headView).offset(-10);
    }];
    desLabel.text = self.model.content;
    desLabel.font = [UIFont systemFontOfSize:14];
    desLabel.numberOfLines = 0;

    UILabel *priceLabel = [[UILabel alloc]init];
    [headView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(desLabel.mas_bottom).offset(25);
        make.left.mas_equalTo(headView).offset(9);
    }];
    priceLabel.text = [NSString stringWithFormat:@"人均 ￥%@",self.model.price];//253 132 36
    priceLabel.textColor = [UIColor colorWithRed:253.0/255 green:132.0/255 blue:36.0/255 alpha:1.0];
    
    UIButton *BuyButton = [[UIButton alloc]init];
    [headView addSubview:BuyButton];
    [BuyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(desLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(headView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    BuyButton.backgroundColor = [UIColor colorWithRed:0 green:153.0/255 blue:255.0/255 alpha:1.0];
    [BuyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [BuyButton addTarget:self action:@selector(clickBuyButton) forControlEvents:UIControlEventTouchUpInside];
    BuyButton.layer.cornerRadius = 5;
    BuyButton.layer.masksToBounds = YES;
    
    UIButton *shareButton = [[UIButton alloc]init];
    [headView addSubview:shareButton];
    [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(desLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(BuyButton.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    shareButton.backgroundColor = [UIColor colorWithRed:0 green:153.0/255 blue:255.0/255 alpha:1.0];
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(clickshareButton) forControlEvents:UIControlEventTouchUpInside];
    shareButton.layer.cornerRadius = 5;
    shareButton.layer.masksToBounds = YES;
}
//点击购买按钮
- (void)clickBuyButton{
    LSJOrderViewController *OrderVC = [[LSJOrderViewController alloc]init];
    OrderVC.model = self.model;
    [self.navigationController pushViewController:OrderVC animated:YES];
}

//点击分享按钮
- (void)clickshareButton{
    UIView *shareView = [[UIView alloc]init];
    shareView.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    self.shareView = shareView;
    [self.headView addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView).offset(0);
        make.right.mas_equalTo(self.headView).offset(0);
        make.top.mas_equalTo(self.headView).offset(50);
        make.height.mas_equalTo(120);
    }];
    
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
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
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
- (void)btnClick{
    [self.shareView removeFromSuperview];
}
- (void)clickcancleButton{
    [self.shareView removeFromSuperview];
}
- (void)clickTap:(UIGestureRecognizer *)ges{
    [self.shareView removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        
        return 3;
        
    }
     return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   LSJGoodMiddleCell *MiddleCell = [tableView dequeueReusableCellWithIdentifier:GoodMiddleCell];
   LSJShopCell *shopsCell = [tableView dequeueReusableCellWithIdentifier:ShopsID];
    if (indexPath.section == 0) {
//        MiddleCell = [tableView dequeueReusableCellWithIdentifier:GoodMiddleCell];
        if (MiddleCell == nil) {
           MiddleCell = [[LSJGoodMiddleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GoodMiddleCell];
        }
        MiddleCell.model = self.model;
        return MiddleCell;
    }else if (indexPath.section == 1) {
        
//        shopsCell = [tableView dequeueReusableCellWithIdentifier:ShopsID];
        
        if (shopsCell == nil) {
            shopsCell = [[LSJShopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ShopsID];
        }
        
        shopsCell.shopModel = self.shopModel;
        
        shopsCell.shareBlock = ^{
        
            [self setShareView];
        
        };
        
        return shopsCell;
    }
//    return MiddleCell;
    return nil;

}
#pragma mark -收到点击分享按钮的Block创建分享视图
-(void)setShareView{
    
    //设置分享视图的位置，每次创建的时候都在最低部;
    CGFloat shareViewY = self.tableView.contentOffset.y + self.tableView.frame.size.height - 120;
    
    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, shareViewY, [UIScreen mainScreen].bounds.size.width, 120)];
    self.shareView = shareView;
    
    shareView.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    
    [self.view addSubview:shareView];
    
    CGFloat marginX = 10;
    //    CGFloat buttonH = 50;
    CGFloat mainW = [UIScreen mainScreen].bounds.size.width;
    for (int i = 0; i < self.pictureArr.count; i++) {
        
        CGFloat buttonW = (mainW - (self.pictureArr.count + 1) * marginX)/self.pictureArr.count;
        CGFloat buttonX = marginX + (buttonW + marginX) * i;
        CGFloat buttonY = marginX;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, buttonY, buttonW, buttonW)];
        [shareView addSubview:btn];
        UIImage *Img = [UIImage imageNamed:self.pictureArr[i]];
        [btn setBackgroundImage:Img forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(clickcancleBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    UIButton *cancleButton = [[UIButton alloc]init];
    
    [shareView addSubview:cancleButton];
    
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(shareView);
        make.height.mas_equalTo(40);
    }];
    
    cancleButton.backgroundColor = [UIColor brownColor];
    
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [cancleButton addTarget:self action:@selector(clickcancleBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
#pragma mark -分享视图取消按钮的点击方法
-(void)clickcancleBtn{
    
    [self.shareView removeFromSuperview];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc]init];//WithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 80)];
//    sectionView.backgroundColor = [UIColor whiteColor];
//    UIView *Tview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 10)];
//    Tview.backgroundColor = [UIColor colorWithRed:237.0/255 green:237.0/255 blue:237.0/255 alpha:1.0];
//    [sectionView addSubview:Tview];
    
    UILabel *lal = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
    [sectionView addSubview:lal];
    if (section == 0) {
       lal.text = @"商家信息";
        
    }else if(section == 1){
        lal.text =  @"你可能会喜欢的商品";
    }
    lal.textColor = [UIColor redColor];
    lal.font = [UIFont systemFontOfSize:21];
//    
//    UIView *Bview = [[UIView alloc]initWithFrame:CGRectMake(0, 65, self.tableView.bounds.size.width, 3)];
//    Bview.backgroundColor = [UIColor colorWithRed:237.0/255 green:237.0/255 blue:237.0/255 alpha:1.0];
//    [sectionView addSubview:Bview];
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else if (indexPath.section == 1){
        return 250;
    }
    return 80;
}
//取消cell的选择效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.shareView removeFromSuperview];
}
@end
