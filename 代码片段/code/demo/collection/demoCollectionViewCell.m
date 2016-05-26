//
//  demoCollectionViewCell.m
//  代码片段
//
//  Created by w on 16/5/17.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "demoCollectionViewCell.h"

@interface demoCollectionViewCell()

@property(nonatomic,retain)UIImageView* img1;
@property(nonatomic,retain)UILabel* titleLab1;
@property(nonatomic,retain)UIImageView* img2;
@property(nonatomic,retain)UILabel* titleLab2;


@end

@implementation demoCollectionViewCell

-(UIImageView *)img1{
    
    if (!_img1) {
        _img1 = [[UIImageView alloc]init];
        _img1.frame = CGRectMake(10, 20, self.bounds.size.width-20, self.bounds.size.height-40);
        [self addSubview:_img1];
    }
    return _img1;
}

-(UILabel *)titleLab1{
    
    if (!_titleLab1) {
        _titleLab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width-20
                                                               ,20)];
        _titleLab1.textColor = [UIColor redColor];
        [self addSubview:_titleLab1];
    }
    return _titleLab1;
}

-(UIImageView *)img2{
    
    if (!_img2) {
        _img2 = [[UIImageView alloc]init];
        _img2.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height-20);
        [self addSubview:_img2];
    }
    return _img2;
}

-(UILabel *)titleLab2{
    
    if (!_titleLab2) {
        _titleLab2 = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width/2, self.bounds.size.height-20, self.bounds.size.width/2,20)];
        _titleLab2.textColor = [UIColor redColor];
        [self addSubview:_titleLab2];
    }
    return _titleLab2;
}


-(void)setCellInfo:(ZFCollectionViewCellModel *)cellInfo{
    
    UIImage *img = [UIImage imageNamed:cellInfo.imgName];
    
    self.img1.image =img;
    
    self.titleLab1.text = cellInfo.title;
    
}

@end
