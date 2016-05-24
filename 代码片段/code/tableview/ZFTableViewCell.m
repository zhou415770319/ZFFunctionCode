//
//  ZFTableViewCell.m
//  代码片段
//
//  Created by w on 16/5/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFTableViewCell.h"
#import "ZFTableViewCellModel.h"
@interface ZFTableViewCell()

@property(nonatomic,retain)UIImageView* img;
@property(nonatomic,retain)UILabel* titleLab;
@property(nonatomic,retain)UILabel* desLab;


@end

@implementation ZFTableViewCell

-(UIImageView *)img{
    
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.frame = CGRectMake(0, 0, self.bounds.size.width*0.8, self.bounds.size.height-40);
        _img.center =self.contentView.center;
        [self addSubview:_img];
    }
    return _img;
}

-(UILabel *)titleLab{
    
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width,20)];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = [UIColor whiteColor];
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

-(UILabel *)desLab{
    
    if (!_desLab) {
        _desLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-40, self.bounds.size.width,20)];
        _desLab.textAlignment = NSTextAlignmentCenter;
        _desLab.textColor = [UIColor whiteColor];
        [self addSubview:_desLab];
    }
    return _desLab;
}


-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    UIImage *img = [UIImage imageNamed:cellInfo.imgName];
    
    self.img.image =img;
    
    self.titleLab.text = cellInfo.title;
    self.desLab.text =cellInfo.des;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
