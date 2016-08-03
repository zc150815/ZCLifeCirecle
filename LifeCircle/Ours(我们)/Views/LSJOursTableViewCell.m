//
//  LSJOursTableViewCell.m
//  LifeCircle
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#define IMGVIEWX 9
#define IMGVIEWY 8
#define IMGVIEWWH 24

#import "LSJOursTableViewCell.h"
#import "LSJGroupCircleModel.h"

@interface LSJOursTableViewCell ()
@property (nonatomic, weak) UILabel *iconlabel;
@property (nonatomic, weak) UIImageView *imgView;


@end

@implementation LSJOursTableViewCell

#pragma mark
#pragma mark - 重写 cell 的 init 方法,并在里面添加两个控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imgView = [[UIImageView alloc]init];
        self.imgView = imgView;
        [self.contentView addSubview:self.imgView];
        UILabel *iconlabel = [[UILabel alloc]init];
        self.iconlabel =iconlabel;
        [self.contentView addSubview:self.iconlabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return self;



}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark
#pragma mark - 重写 setModel 方法,在里面设置控件的 frame 以及显示内容

-(void)setModel:(LSJGroupCircleModel *)model
{
    _model = model;
    
    self.imgView.frame = CGRectMake(IMGVIEWX, IMGVIEWY, IMGVIEWWH, IMGVIEWWH);
    self.imgView.backgroundColor = [UIColor clearColor];
    self.imgView.image = [UIImage imageNamed:model.cover];
    
    self.iconlabel.frame = CGRectMake(CGRectGetMaxX(self.imgView.frame)+15, 0, self.frame.size.width - 120, 40);
    self.iconlabel.text = model.title;
    self.iconlabel.backgroundColor = [UIColor clearColor];
    self.iconlabel.font = [UIFont systemFontOfSize:14];
    self.iconlabel.textColor = [UIColor colorWithRed:40.0/255.0 green:40.0/255.0 blue:40.0/255.0 alpha:1];
}
@end







