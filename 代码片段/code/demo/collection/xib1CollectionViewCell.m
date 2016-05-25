//
//  xib1CollectionViewCell.m
//  代码片段
//
//  Created by w on 16/5/25.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "xib1CollectionViewCell.h"

@interface xib1CollectionViewCell()


@end

@implementation xib1CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)drawRect:(CGRect)rect{
    
    UIImage *img = [UIImage imageNamed:self.cellInfo.imgName];
    
    self.image.image =img;
    
    self.title.text = self.cellInfo.title;
    self.title.textAlignment =NSTextAlignmentCenter;
    
}


@end
