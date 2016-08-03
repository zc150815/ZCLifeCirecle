//
//  LSJShopCell.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJShopCell.h"
#import <UIImageView+WebCache.h>

@interface LSJShopCell ()

@property (weak, nonatomic) IBOutlet UIImageView *shopIcon;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *starImg;
@property (weak, nonatomic) IBOutlet UILabel *serverLab;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (weak, nonatomic) IBOutlet UILabel *introLab;
@property (weak, nonatomic) UIView *shareView;
//@property (nonatomic, strong) NSArray *pictureArr;

@end

@implementation LSJShopCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

//设置数据
-(void)setShopModel:(LSJShopModel *)shopModel{

    _shopModel = shopModel;
    
    self.shopIcon.image = [UIImage imageNamed:@"蛋糕店"];
    
    self.shopNameLab.text = shopModel.name;
    
    self.serverLab.text = shopModel.server;
    
    [self.addressBtn setTitle:shopModel.address forState:UIControlStateNormal];
    
    [self.phoneBtn setTitle:shopModel.phone forState:UIControlStateNormal];
    
    self.introLab.text = shopModel.intro;
    
    [self.starImg enumerateObjectsUsingBlock:^(UIImageView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
      
        obj.image = [UIImage imageNamed:@"五星1"];
        
    }];
    
    //创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPhoto:)];
    //添加手势到头像
    [self.shopIcon addGestureRecognizer:tap];
    
}

//分享按钮的点击
- (IBAction)shareBtnClick:(UIButton *)sender {
    
    if (self.shareBlock) {
        self.shareBlock();
    }
    
}
- (IBAction)phoneBtn:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://15971504654"]];
}


//商家头像的点击
-(void)showPhoto:(UIGestureRecognizer *)recongnizer{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"showPhoto" object:self];

}

@end




