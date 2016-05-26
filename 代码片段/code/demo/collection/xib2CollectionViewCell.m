//
//  xib2CollectionViewCell.m
//  代码片段
//
//  Created by w on 16/5/26.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "xib2CollectionViewCell.h"

@implementation xib2CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setCellInfo:(ZFCollectionViewCellModel *)cellInfo{
    
    UIImage *img = [UIImage imageNamed:cellInfo.imgName];
    
    self.img.image =img;
    
    self.title.text = cellInfo.title;
    self.title.textAlignment =NSTextAlignmentCenter;
    
}

@end
