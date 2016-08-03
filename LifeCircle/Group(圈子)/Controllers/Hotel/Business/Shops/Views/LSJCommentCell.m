//
//  LSJCommentCell.m
//  LifeCircle
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJCommentCell.h"

@interface LSJCommentCell ()

@property (weak, nonatomic) UIImageView *photoImg;

@property (weak ,nonatomic) UILabel *nameLab;

@property (weak, nonatomic) UILabel *timeLab;

@property (weak, nonatomic) UIView *scoreView;

@property (weak, nonatomic) UILabel *commentLab;

@end

@implementation LSJCommentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIImageView *photoImg = [[UIImageView alloc]init];
        
        UILabel *nameLab = [[UILabel alloc]init];
        
        UILabel *timeLab = [[UILabel alloc]init];
        
        timeLab.textAlignment = NSTextAlignmentCenter;
        
        UILabel *commentLab = [[UILabel alloc]init];
        
        commentLab.numberOfLines = 0;
        
        [commentLab setTextColor:[UIColor colorWithRed:66 / 255.0 green:66 / 255.0  blue:66 / 255.0  alpha:66 / 255.0 ]];
        
//        NSMutableArray <UIImageView *>*a = [NSMutableArray array];
        
//        UIView *scoreView = [[UIView alloc]init];
//        
//        for (int i = 0; i < 5; i++) {
//            UIImageView *starImgView = [[UIImageView alloc]init];
//            starImgView.image = [UIImage imageNamed:@"五星1"];
//            [scoreView addSubview:starImgView];
//            
//            [a addObject:starImgView];
//        }
        
        LSJScoreView *scoreView = [[LSJScoreView alloc]init];
        
        self.photoImg = photoImg;
        self.nameLab = nameLab;
        self.timeLab = timeLab;
        self.commentLab = commentLab;
        self.scoreView = scoreView;

        [self.contentView addSubview:photoImg];
        [self.contentView addSubview:nameLab];
        [self.contentView addSubview:timeLab];
        [self.contentView addSubview:scoreView];
        [self.contentView addSubview:commentLab];
        
        [photoImg mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.left.equalTo(self.contentView).offset(9);
            
            make.width.height.mas_equalTo(24);
            
        }];
        
        [scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.contentView).offset(-9);
            
            make.centerY.equalTo(photoImg);
            
            make.height.mas_equalTo(15);
            
            make.width.mas_equalTo(75);
            
        }];
        
        [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView).offset(9);
            
            make.left.equalTo(photoImg.mas_right).offset(5);
            
            make.width.mas_equalTo(80);
            
            make.height.mas_equalTo(24);
            
        }];
        
        [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView).offset(9);
            
            make.left.equalTo(nameLab.mas_right).offset(5);
            
            make.right.equalTo(scoreView.mas_left).offset(-5);
            
            make.height.mas_equalTo(24);
            
        }];
        
//        [a[0] mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.bottom.equalTo(self.scoreView);
//        }];
//        
//        [a[1] mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.bottom.equalTo(self.scoreView);
//            make.left.equalTo(a[0].mas_right);
//            make.width.equalTo(a[0]);
//            
//        }];
//        [a[2] mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.bottom.equalTo(self.scoreView);
//            make.left.equalTo(a[1].mas_right);
//            make.width.equalTo(a[0]);
//            
//        }];
//        [a[3] mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.bottom.equalTo(self.scoreView);
//            make.left.equalTo(a[2].mas_right);
//            make.width.equalTo(a[0]);
//            
//        }];
//        [a[4] mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.bottom.right.equalTo(self.scoreView);
//            make.left.equalTo(a[3].mas_right);
//            make.width.equalTo(a[0]);
//            
//        }];

        [commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.equalTo(photoImg.mas_bottom).offset(9);
            
            make.left.equalTo(self.contentView).offset(9);
            
            make.right.equalTo(self.contentView).offset(-9);
            
            make.bottom.equalTo(self.contentView).offset(-9);
            
        }];
        
    }

    return self;
}

-(void)setCommentModel:(LSJCommentModel *)commentModel{
    
    _commentModel = commentModel;

//    [self.photoImg sd_setImageWithURL:[NSURL URLWithString:commentModel.photo]];
    
    self.photoImg.image = [UIImage imageNamed:@"关于我们"];
    
    self.nameLab.text = commentModel.name;
    
    self.timeLab.text = commentModel.time;
    
    self.commentLab.text = commentModel.comment;


}

@end










