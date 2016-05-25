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

-(void)drawRect:(CGRect)rect{
    
    UIImage *img = [UIImage imageNamed:self.cellInfo.imgName];
    
    self.contentImg.image =img;
    
    self.titleLab.text = self.cellInfo.title;
    self.titleLab.textAlignment =NSTextAlignmentCenter;
    
}


@end
