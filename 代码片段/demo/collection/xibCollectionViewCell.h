//
//  xibCollectionViewCell.h
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFCollectionViewCellModel.h"
#import "ZFCollectionViewCell.h"

@interface xibCollectionViewCell : ZFCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *contentImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end
