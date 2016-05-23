//
//  ZFCollectionViewLayout.h
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZFCollectionViewLayoutCircleType,
    ZFCollectionViewLayoutStackType
} ZFCollectionViewLayoutType;


@interface ZFCollectionViewLayout : UICollectionViewLayout
//ZFCollectionViewLayoutType layout类型
@property(nonatomic)ZFCollectionViewLayoutType layoutType;


//item 大小 默认60*60
@property(nonatomic)CGSize itemSize;

@end
