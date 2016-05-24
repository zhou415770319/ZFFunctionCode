//
//  ZFCollectionViewLayout.m
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewLayout.h"

@interface ZFCollectionViewLayout()


@end

@implementation ZFCollectionViewLayout


-(void)setLayoutType:(ZFCollectionViewLayoutType)layoutType{
    if (_layoutType != layoutType) {
        _layoutType =layoutType;
        
    }
}


/**
 * 决定cell怎么排布
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];

    switch (self.layoutType) {
        
        case ZFCollectionViewLayoutStackType:
            for (int i = 0; i<count; i++) {
                NSIndexPath *path = [NSIndexPath indexPathForItem:i inSection:0];
                UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:path];
                [array addObject:attrs];
            }
            break;
        case ZFCollectionViewLayoutCircleType:
            for (int i = 0; i < count; i++) {
                // 创建i位置cell对应的indexPath
                NSIndexPath *path = [NSIndexPath indexPathForItem:i inSection:0];
                
                // 创建i位置cell对应的布局属性
                UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:path];
                
                // 添加布局属性
                [array addObject:attrs];
            }

            break;
            
        default:
            break;
    }

    
    return array;
}

/**
 * 返回indexPath位置cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
        // 创建i位置cell对应的布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    switch (self.layoutType) {
        
        case ZFCollectionViewLayoutStackType:
            attrs = [self LayoutStackAttributes:indexPath];
            
            break;
        case ZFCollectionViewLayoutCircleType:
            attrs = [self LayoutCircleAttributes:indexPath];
            break;
            
        default:
            break;
    }
    
    attrs.size =self.itemSize;
    
    // 用来控制cell的层叠顺序，zIndex越大，cell越在上面
    //        attrs.zIndex = i;
    
    return attrs;
}

-(UICollectionViewLayoutAttributes *)LayoutStackAttributes:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    attrs.size = self.itemSize;
    attrs.zIndex = - indexPath.item; // 设置层叠顺序
    // 第0个
    if (indexPath.item == 0) return attrs;
    
    // 第[5, N]个
    if (indexPath.item > 4) {
        attrs.hidden = YES;
        return attrs;
    }
    
    // indexPath.item == [1, 2, 3, 4]
    NSArray *angles = @[@0, @(-0.2), @(0.2), @(-0.5), @(0.5)];
    CGFloat angle = [angles[indexPath.item] doubleValue];
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;
    
}

-(UICollectionViewLayoutAttributes *)LayoutCircleAttributes:(NSIndexPath *)indexPath{
    // 半径
    CGFloat radius = 80;
    
    // 圆心
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
    // 创建i位置cell对应的布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = self.itemSize;
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];

    if (count == 1) {
        attrs.center = CGPointMake(centerX, centerY);
    } else {
        CGFloat angle = 2 * M_PI / count * indexPath.item;
        CGFloat attrsCenterX = centerX - radius * cos(angle);
        CGFloat attrsCenterY = centerY - radius * sin(angle);
        attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
    }

    return attrs;
    
}


@end
