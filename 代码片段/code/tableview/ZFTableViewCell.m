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


@end

@implementation ZFTableViewCell


-(void)setCellInfo:(ZFTableViewCellModel *)cellInfo{
    
    if (_cellInfo != cellInfo) {
        _cellInfo =cellInfo;
    }

}


@end
