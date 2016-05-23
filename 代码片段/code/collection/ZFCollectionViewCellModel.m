//
//  ZFCollectionViewCellModel.m
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewCellModel.h"

@implementation ZFCollectionViewCellModel

-(UIImage *)img{
    
    if (!_img) {
        _img =[UIImage imageNamed:self.imgName];
    }
    
    return _img;
}

@end
