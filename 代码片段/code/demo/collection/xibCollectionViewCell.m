//
//  xibCollectionViewCell.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "xibCollectionViewCell.h"

@implementation xibCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setCellInfo:(ZFCollectionViewCellModel *)cellInfo{
    
    UIImage *img = [UIImage imageNamed:cellInfo.imgName];
    
    self.contentImg.image =img;
    
    self.titleLab.text = cellInfo.title;
    
}


@end
