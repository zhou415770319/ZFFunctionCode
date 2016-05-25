//
//  xib1CollectionViewCell.h
//  代码片段
//
//  Created by w on 16/5/25.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFCollectionViewCellModel.h"
#import "ZFCollectionViewCell.h"
@interface xib1CollectionViewCell : ZFCollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
