//
//  LSJThreeTableViewCell.m
//  LifeCircle
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJThreeTableViewCell.h"
#import "LSJHomeModel.h"
@interface LSJThreeTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *Btn;

@property (weak, nonatomic) IBOutlet UILabel *describe;
@end

@implementation LSJThreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(LSJHomeModel *)model{
    
    _model = model;
    
    self.image.image = [UIImage imageNamed:model.image];
    
    self.nameLabel.text = model.name;
    
    self.describe.text = model.describe;
    
    [self.Btn setTitle:model.btnText forState:UIControlStateNormal];
}
@end
