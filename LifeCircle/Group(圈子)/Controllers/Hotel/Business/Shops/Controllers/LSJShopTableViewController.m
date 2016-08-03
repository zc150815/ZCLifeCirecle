//
//  LSJShopTableViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJShopTableViewController.h"
#import <AFNetworking.h>

#import "LSJShopModel.h"

#import "LSJShopCell.h"

#import "LSJGoodsCell.h"

#import "LSJGoodsModel.h"

#import "LSJGoodDetailTableViewController.h"

#import "LSJCommentCell.h"

#import "LSJCommentModel.h"

#import "LSJShopsFootView.h"

#import "LSJShopsPhotoController.h"

#import "LSJBusinessRegionButton.h"

@interface LSJShopTableViewController ()

//商家
@property (strong, nonatomic) NSArray *shopModelArr;

//商品
@property (strong, nonatomic) NSMutableArray *goodsModelArr;

//评论
@property (strong, nonatomic) NSMutableArray *commentModelArr;

//商家模型
@property (strong, nonatomic) LSJShopModel *shopModel;

//分享视图
@property (weak, nonatomic) UIView *shareView;

@property (strong, nonatomic) NSArray *pictureArr;



@end



@implementation LSJShopTableViewController

static NSString *ShopsID = @"shopsCell";

static NSString *GoodsID = @"goodsCell";

static NSString *commentID = @"commentCell";
//商家
-(NSArray *)shopModelArr{
    
    if (_shopModelArr == nil) {
        _shopModelArr = [NSArray array];
        

    }

    return _shopModelArr;
}

//商品
-(NSMutableArray *)goodsModelArr{

    if (_goodsModelArr == nil) {
        
        _goodsModelArr = [NSMutableArray array];
        
    }
    return _goodsModelArr;
}

//评论
-(NSMutableArray *)commentModelArr{

    if (_commentModelArr == nil) {
        
        _commentModelArr = [NSMutableArray array];
    }
    return _commentModelArr;
}

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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商家详情";
    
    self.tableView.sectionFooterHeight = 10;
    
    [self.tableView registerClass:[LSJGoodsCell class] forCellReuseIdentifier:GoodsID];
    
    [self.tableView registerClass:[LSJCommentCell class] forCellReuseIdentifier:commentID];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LSJShopCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ShopsID];
    
    
    [self loadData];
    
    
    //查看详情按钮点击的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(inspectGoods:) name:@"inspectGoods" object:nil];
    
    //商家头像点击通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showShopsPhoto:) name:@"showPhoto" object:nil];
    
    
    //底部视图
    LSJShopsFootView *footView = [[LSJShopsFootView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
    self.tableView.tableFooterView = footView;
  
    //监听键盘frame修改的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotification:) name: UIKeyboardWillChangeFrameNotification object:nil];
    //创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeShare:)];
    
    //添加给view
    [self.view addGestureRecognizer:tap];
    
    
}

#pragma mark -收到点击分享按钮的Block创建分享视图
-(void)setShareView{

    
    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 120)];
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
        
        [btn addTarget:self action:@selector(clickcancleButton) forControlEvents:UIControlEventTouchUpInside];
        
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
#pragma mark -分享视图取消按钮的点击方法
- (void)clickcancleButton{
    [self.shareView removeFromSuperview];
}

#pragma mark - 监听到键盘滚动通知调用的方法
- (void)receivedNotification:(NSNotification *)notification{

    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //计算屏幕需要移动的距离
    CGFloat transformY = self.view.frame.size.height - endFrame.origin.y;
    
    self.view.transform = CGAffineTransformMakeTranslation(0, -transformY - 64);

}

#pragma mark - 加载网络数据
-(void)loadData{

    NSString *urlStr = @"http://iosapi.itcast.cn/life/shop_info.json.php";
    
    NSDictionary *dict = @{@"shop_id":@"0/1/2/3"};
    
    //实例化网络管理工具
    AFHTTPSessionManager *seManager = [AFHTTPSessionManager manager];
    
    //设置解析器
    seManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    seManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    
    //发起请求
    [seManager POST:urlStr parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *arrayM = [NSMutableArray array];
       
            NSDictionary *dict = responseObject;
            
            LSJShopModel *shopModel = [LSJShopModel shopModelWithDict:dict];
            
            [self.goodsModelArr addObjectsFromArray: shopModel.goods];
            
            [self.commentModelArr addObjectsFromArray:shopModel.comment_list ];
        
            self.shopModel = shopModel;
        
            [arrayM addObject:shopModel];
        
            self.shopModelArr = arrayM.copy;

            //数据加载完成必须调用reloadData
            [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
//        NSLog(@"%@",error);
    }];

}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else if (section == 1){
        
        return self.goodsModelArr.count;
    
    }
    else if(section == 2){
    
        return self.commentModelArr.count;
    
    }
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LSJShopModel *shopModel = self.shopModelArr.firstObject;
    
    LSJShopCell *shopsCell = [tableView dequeueReusableCellWithIdentifier: ShopsID];
    LSJGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:GoodsID];
    LSJCommentCell *commentCell = [tableView dequeueReusableCellWithIdentifier:commentID];
    
    if (indexPath.section == 0) {
        
        shopsCell = [tableView dequeueReusableCellWithIdentifier:ShopsID];
        
        if (shopsCell == nil) {
            shopsCell = [[LSJShopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ShopsID];
        }
        shopsCell.shopModel = shopModel;
        
        shopsCell.shareBlock = ^{
        
            [self setShareView];
        
        };
        
        return shopsCell;
    }
    else if (indexPath.section == 1) {
        
        if (goodsCell == nil) {
            
            goodsCell = [[LSJGoodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GoodsID];
            
        }
        LSJGoodsModel *goodsModel = self.goodsModelArr[indexPath.row];
        
        goodsCell.goodsModel = goodsModel;
        return goodsCell;
    }
    else if (indexPath.section == 2){
    
    
        if (commentCell == nil) {
            commentCell = [[LSJCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentID];
        }
        
        LSJCommentModel *commentModel = self.commentModelArr[indexPath.row];
        
        commentCell.commentModel = commentModel;
        
        return commentCell;
    
    }
    return shopsCell;
    return goodsCell;
}
#pragma mark - 设置组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    NSString *sectionTitle ;
    
        
        if (section == 1) {
            sectionTitle = @"商品";
        }else if (section == 2){
            
            sectionTitle= @"用户评价";
        }
        
        UILabel *titleLab = [[UILabel alloc]init];
        
        titleLab.font = [UIFont systemFontOfSize:22];
        
        titleLab.textColor = [UIColor redColor];
        
        titleLab.text = sectionTitle;
        
        UIView *titleView = [[UIView alloc]init];
        
        [titleView addSubview:titleLab];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(titleView).offset(5);
            
            make.bottom.equalTo(titleView).offset(0);
            
        }];
        
    titleView.backgroundColor = [UIColor whiteColor];
    
        return titleView;

}
#pragma mark - 设置组尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    NSString *sectionTitle ;
    
    if (section == 0) {
        return nil;
    }
    else if (section == 1) {
        sectionTitle = @"更多";
    }
    else if (section == 2){
        
        sectionTitle= @"用户评价";
    }

    
    LSJBusinessRegionButton *btn = [[LSJBusinessRegionButton alloc]init];
    
    [btn setTitle:sectionTitle forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(footViewBtnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitleColor: [UIColor colorWithRed:53 / 255.0 green:174 / 255.0 blue:243 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"内容里更多的下拉箭头"] forState:UIControlStateNormal];
    
    UIView *footView = [[UIView alloc]init];
    
    [footView addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.equalTo(footView);
        
    }];
    
    footView.backgroundColor = [UIColor whiteColor];

    return footView;
}

#pragma mark - 底部视图按钮的点击
-(void)footViewBtnclick:(LSJBusinessRegionButton *)btn{

    //判断点击的是那个按钮
    if ([btn.titleLabel.text isEqualToString:@"更多"]) {
        [self.goodsModelArr addObjectsFromArray:self.shopModel.goods];
        
        //延时更新数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
            
        });
        
    }
    if ([btn.titleLabel.text isEqualToString:@"用户评价"]){
    
        [self.commentModelArr addObjectsFromArray:self.shopModel.comment_list];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
            
        });
        
        
    }

}



//取消cell的选择效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 250;
    }
    return 100;

}

//返回组头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0;
    }
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 40;
}


#pragma mark - 查看详情按钮点击的通知方法
-(void)inspectGoods:(NSNotification *)nitify{
    
    [self.shareView removeFromSuperview];
    
    LSJGoodsModel *goodsModel = nitify.object;

    LSJGoodDetailTableViewController *goodsVC = [[LSJGoodDetailTableViewController alloc]init];
    
    goodsVC.model = goodsModel;
    
    goodsVC.shopModel = self.shopModel;
    
    //跳转商品详情控制器
    [self.navigationController pushViewController:goodsVC animated:YES];
    

}

#pragma mark - 商家头像点击的通知方法
-(void)showShopsPhoto:(NSNotification *)notify{
    
    LSJShopsPhotoController *photoVC = [[LSJShopsPhotoController alloc]init];

    [self.navigationController pushViewController:photoVC animated:YES];

}

#pragma mark - 将要滚动时结束视图的编辑状态
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    [self.view endEditing:YES];
    
    [self.shareView removeFromSuperview];
}

#pragma mark - 点击屏幕时移除分享视图
-(void)removeShare:(UIGestureRecognizer *)tap{

    [self.shareView removeFromSuperview];

}

-(void)dealloc{
    
    //移除所有通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





@end
