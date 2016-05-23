//
//  ZFCollectionViewFlowLayout.h
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    ZFCollectionViewFlowLayoutRotatePageType,
    ZFCollectionViewFlowLayoutWaterfallType,
    ZFCollectionViewFlowLayoutLineType

} ZFCollectionViewFlowLayoutType;

@interface ZFCollectionViewFlowLayout : UICollectionViewFlowLayout

//ZFCollectionViewLayoutType layout类型

@property(nonatomic)ZFCollectionViewFlowLayoutType flowLayoutType;



//WaterfallType参数
// 计算列数
@property (nonatomic,assign)NSInteger columCount;
//所有模型数组
@property(nonatomic,strong)NSArray *dataList;


@end
