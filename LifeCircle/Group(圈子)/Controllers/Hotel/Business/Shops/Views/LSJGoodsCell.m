//
//  LSJGoodsCell.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGoodsCell.h"



@interface LSJGoodsCell ()

// 商品标题
@property (weak, nonatomic) UILabel *goodsTitle;

//商品简介
@property (weak, nonatomic) UILabel *goodsIntro;

//商品价格
@property (weak, nonatomic) UILabel *goodsPrice;




@end

@implementation LSJGoodsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 商品标题
        UILabel *goodsTitle = [[UILabel alloc]init];
        
        goodsTitle.font = [UIFont systemFontOfSize:19];
        
        //商品简介
        UILabel *goodsIntro = [[UILabel alloc]init];
        
        [goodsIntro setTextColor:[UIColor colorWithRed:66 / 255.0 green:66 / 255.0 blue:66 / 255.0 alpha:1.0]];
        
        goodsIntro.font = [UIFont systemFontOfSize:14];
        
        //商品价格
        UILabel *goodsPrice = [[UILabel alloc]init];
        
        [goodsPrice setTextColor:[UIColor colorWithRed:255 / 255.0 green:183 / 255.0 blue:0 alpha:1.0]];
        
        //查看button
        UIButton *searchInfoBtn = [[UIButton alloc]init];
        
        searchInfoBtn.layer.cornerRadius = 5.0;
        
        searchInfoBtn.layer.masksToBounds = YES;
        
        [searchInfoBtn setBackgroundColor:[UIColor colorWithRed:53 / 255.0 green:174 / 255.0 blue:243 / 255.0 alpha:1.0]];
        
        [searchInfoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        self.goodsTitle = goodsTitle;
        self.goodsIntro = goodsIntro;
        self.goodsPrice = goodsPrice;
        self.searchInfoBtn =searchInfoBtn;
        
        
        [self.contentView addSubview:goodsTitle];
        [self.contentView addSubview:goodsIntro];
        [self.contentView addSubview:goodsPrice];
        [self.contentView addSubview:searchInfoBtn];
        
        [_searchInfoBtn addTarget:self action:@selector(searchInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
    }
    
    return self;

}

-(void)setGoodsModel:(LSJGoodsModel *)goodsModel{

    _goodsModel = goodsModel;
    
    self.goodsTitle.text = goodsModel.title;
    
    self.goodsIntro.text = goodsModel.content;
    
    self.goodsPrice.text = [NSString stringWithFormat:@"¥%@",goodsModel.price];
    
    [self.searchInfoBtn setTitle:@"查看详情" forState:UIControlStateNormal];
    
    [_searchInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(35);
        
        make.bottom.equalTo(self.contentView).offset(-35 );
        
        make.right.equalTo(self.contentView).offset(-5);
        
        make.width.mas_equalTo(80);
        
    }];
    
    [_goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(10);
        
        make.left.equalTo(self.contentView).offset(5);
        
        make.right.equalTo(_searchInfoBtn.mas_left).offset(-5);
        
        
    }];
    
    [_goodsIntro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsTitle.mas_bottom).offset(5);
        
        make.left.equalTo(self.contentView).offset(5);
        
        make.right.equalTo(_searchInfoBtn.mas_left).offset(-5);
        
        make.height.mas_equalTo(_goodsTitle.mas_height);
        
        
    }];
    
    [_goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_goodsIntro.mas_bottom).offset(5);
        
        make.left.equalTo(self.contentView).offset(5);
        
        make.right.equalTo(_searchInfoBtn.mas_left).offset(-5);
        
        make.bottom.equalTo(self.contentView).offset(-5);
        
        make.height.mas_equalTo(_goodsTitle.mas_height);
        
    }];

}

-(void)searchInfoBtnClick{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"inspectGoods" object:self.goodsModel];

}



@end
