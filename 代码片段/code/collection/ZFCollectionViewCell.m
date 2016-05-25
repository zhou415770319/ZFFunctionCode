//
//  ZFCollectionViewCell.m
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewCell.h"
#import "ZFCollectionViewCellModel.h"

@interface ZFCollectionViewCell()

@end

@implementation ZFCollectionViewCell

-(void)setCellInfo:(ZFCollectionViewCellModel *)cellInfo{
    
    if (_cellInfo != cellInfo) {
        _cellInfo =cellInfo;
    }
    
}

@end
