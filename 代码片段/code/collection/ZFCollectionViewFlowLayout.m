//
//  ZFCollectionViewFlowLayout.m
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewFlowLayout.h"
#import "ZFCollectionViewCellModel.h"
#define ZFCollectionViewWidth self.collectionView.frame.size.width
#define ZFCollectionViewHeight self.collectionView.frame.size.height

@interface ZFCollectionViewFlowLayout()

//RotatePageType参数
@property (nonatomic, strong) NSIndexPath *mainIndexPath;
@property (nonatomic, strong) NSIndexPath *willMoveToMainIndexPath;



@property (nonatomic,strong) NSMutableArray * itemsAttribute;

@end

@implementation ZFCollectionViewFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}


-(ZFCollectionViewFlowLayout *)layoutType:(ZFCollectionViewFlowLayoutType)type{
    
    self.flowLayoutType =type;
    
    return self;
}

/**
 * 准备操作：一般在这里设置一些初始化参数
 */
- (void)prepareLayout
{
    // 必须要调用父类(父类也有一些准备操作)
    [super prepareLayout];
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    switch (self.flowLayoutType) {
        case ZFCollectionViewFlowLayoutWaterfallType:
            [self prepareLayoutWaterfallType];
            break;
        case ZFCollectionViewFlowLayoutRotatePageType:
            [self prepareLayoutRotatePageType];
            break;
        case ZFCollectionViewFlowLayoutLineType:
            [self prepareLayoutLineType];
            break;
        default:
            break;
    }

}


/**
 * 决定了cell怎么排布
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 调用父类方法拿到默认的布局属性
    NSArray *array =[super layoutAttributesForElementsInRect:rect];
    //    NSArray *array = [[NSArray alloc] initWithArray:superArray copyItems:YES];
    
    // 获得collectionView最中间的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    // 获得collectionView最中间的y值
    
    CGFloat centerY = self.collectionView.contentOffset.y + self.collectionView.frame.size.height * 0.5;
    
    switch (self.flowLayoutType) {
        case ZFCollectionViewFlowLayoutWaterfallType:
            array = [self fixLayoutToWaterfallTypeWithArr:array CenterX:centerX CenterY:centerY];
            break;
        case ZFCollectionViewFlowLayoutRotatePageType:
            array = [self fixLayoutToRotatePageTypeWithArr:array CenterX:centerX CenterY:centerY];
            break;
        case ZFCollectionViewFlowLayoutLineType:
            array = [self fixLayoutToLineTypeWithArr:array CenterX:centerX CenterY:centerY];
            break;
        default:
            break;
    }
    
    return array;
}


/**
 * 当uicollectionView的bounds发生改变时，是否要刷新布局
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 * targetContentOffset ：通过修改后，collectionView最终的contentOffset(取决定情况)
 * proposedContentOffset ：默认情况下，collectionView最终的contentOffset
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    if (self.flowLayoutType == ZFCollectionViewFlowLayoutWaterfallType) {
        return proposedContentOffset;
    }
    
    // 计算最终的可见范围
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    
    // 取得cell的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat minDetalX = 0;
    CGFloat minDetalY = 0;
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        // 计算collectionView最终中间的y
        CGFloat centerY = proposedContentOffset.y + self.collectionView.frame.size.height * 0.5;
        
        // 计算最小的间距值
        for (UICollectionViewLayoutAttributes *attrs in array) {
            if (ABS(minDetalY) < ABS(attrs.center.y - centerY)) {
                minDetalY = attrs.center.y - centerY;
            }
        }
        
    }else{
        // 计算collectionView最终中间的x
        CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
        
        // 计算最小的间距值
        for (UICollectionViewLayoutAttributes *attrs in array) {
            if (ABS(minDetalX) > ABS(attrs.center.x - centerX)) {
                minDetalX = attrs.center.x - centerX;
            }
        }
        
        
    }
    
    if (minDetalX<0) {
        minDetalX =0-minDetalX;
    }
    if (minDetalY<0) {
        minDetalY =0-minDetalY;
    }
    
    // 在原有offset的基础上进行微调
    return CGPointMake(proposedContentOffset.x + minDetalX, proposedContentOffset.y+minDetalY);
}

#pragma mark 线性布局

/**
 * 准备操作：线性布局
 */
- (void)prepareLayoutLineType
{

    CGFloat inset =0;
    self.itemSize = CGSizeMake(ZFCollectionViewWidth - 2*inset, ZFCollectionViewHeight);
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
    [super prepareLayout];

}

/**
 * 微调布局LineType
 */
-(NSArray *)fixLayoutToLineTypeWithArr:(NSArray *)array CenterX:(CGFloat)centerX CenterY:(CGFloat)centerY{
    // 在默认布局属性基础上进行微调
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat delta =0.0f;
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            // 计算cell中点y 和 collectionView最中间y值  的差距
            delta= ABS(centerY - attrs.center.y);
            
        }else{
            // 计算cell中点x 和 collectionView最中间x值  的差距
            delta = ABS(centerX - attrs.center.x);
            
        }
        // 利用差距计算出缩放比例（成反比）
        CGFloat scale = 1 - delta / (self.collectionView.frame.size.width+self.itemSize.width);
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
        //        attrs.transform3D = CATransform3DMakeRotation(scale * M_PI_4, 0, 1, 1);
    }
    return array;
}

#pragma mark 旋转翻页布局

/**
 * 准备操作：旋转翻页布局
 */
- (void)prepareLayoutRotatePageType
{
    
    CGFloat inset = 0;
    self.itemSize = CGSizeMake(ZFCollectionViewWidth - 2*inset, ZFCollectionViewHeight);
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
    [super prepareLayout];
    

}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        [self setTransformForLayoutAttributes:attribute WithScrollDirection:UICollectionViewScrollDirectionVertical];
        
    }else{
        [self setTransformForLayoutAttributes:attribute WithScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
    }
    
    return attribute;
}



/**
 * 微调布局RotatePageType
 */
-(NSArray *)fixLayoutToRotatePageTypeWithArr:(NSArray *)array CenterX:(CGFloat)centerX CenterY:(CGFloat)centerY{
    // 在默认布局属性基础上进行微调
    
    NSArray *visibleIndexPaths = [self.collectionView indexPathsForVisibleItems];
    if (visibleIndexPaths.count <= 0) {
        return array;
    }else if (visibleIndexPaths.count == 1){
        self.mainIndexPath = [visibleIndexPaths firstObject];
        self.willMoveToMainIndexPath = nil;
        
    }else if (visibleIndexPaths.count == 2){
        
        NSIndexPath *indexPath =[visibleIndexPaths firstObject];
        if (indexPath == self.mainIndexPath) {//往左滚动
            // 记录将要移进来的位置
            self.willMoveToMainIndexPath = visibleIndexPaths[1];
        }else{//往右滚动
            // 记录将要移进来的位置
            self.willMoveToMainIndexPath =visibleIndexPaths[0];
            //更新main
            self.mainIndexPath = visibleIndexPaths[1];
        }
    }
    for (UICollectionViewLayoutAttributes *attribute in array) {
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            [self setTransformForLayoutAttributes:attribute WithScrollDirection:UICollectionViewScrollDirectionVertical];
            
        }else{
            [self setTransformForLayoutAttributes:attribute WithScrollDirection:UICollectionViewScrollDirectionHorizontal];
            
        }
    }
    
    
    return array;
}


- (void)setTransformForLayoutAttributes:(UICollectionViewLayoutAttributes *)attribute WithScrollDirection:(UICollectionViewScrollDirection)scrollDirectionType{
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:attribute.indexPath];
    
    if (self.mainIndexPath && attribute.indexPath.section == self.mainIndexPath.section) {
        attribute.transform3D = [self tranformForView:cell WithScrollDirection:scrollDirectionType];
    } else if (self.willMoveToMainIndexPath && attribute.indexPath.section == self.willMoveToMainIndexPath.section) {
        attribute.transform3D = [self tranformForView:cell WithScrollDirection:scrollDirectionType];
    }
}

- (CATransform3D)tranformForView:(UICollectionViewCell *)view WithScrollDirection:(UICollectionViewScrollDirection)scrollDirectionType{
    // cell的起始偏移
    CGFloat w = self.collectionView.frame.size.width;
    CGFloat h = self.collectionView.frame.size.height;
    
    CGFloat offsetX = [self.collectionView indexPathForCell:view].item * w;
    CGFloat offsetY = [self.collectionView indexPathForCell:view].item * h;
    
    // 当前偏移
    CGFloat currentOffsetX = self.collectionView.contentOffset.x;
    CGFloat currentOffsetY = self.collectionView.contentOffset.y;
    CATransform3D t = CATransform3DIdentity;
    
    if (scrollDirectionType ==UICollectionViewScrollDirectionHorizontal) {//横向
        // 计算偏移angle
        CGFloat angle = (currentOffsetX - offsetX) / w;
        t.m34 = 1.0 / -500;
        
        if (currentOffsetX - offsetX >= 0) {
            t = CATransform3DRotate(t, angle, 1, 1, 0);
        } else {
            t = CATransform3DRotate(t, angle, -1, 1, 0);
        }
        
    }else{
        // 计算偏移angle
        CGFloat angle = (currentOffsetY - offsetY) / h;
        t.m34 = 1.0 / -500;
        
        if (currentOffsetY - offsetY >= 0) {
            t = CATransform3DRotate(t, angle, 1, 0, 0);
        } else {
            t = CATransform3DRotate(t, angle, -1, 0, 0);
        }
        
        
    }
    
    
    return t;
}


#pragma mark 流水布局
/**
 * 准备操作：流水布局
 */
- (void)prepareLayoutWaterfallType
{
    
    [super prepareLayout];
    
    // 计算每列的宽度
    
    if (self.columCount<0) {
        NSLog(@"设置的columCount错误");
    }
    
    CGFloat contentWidth = self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right;
    
    CGFloat colWidth = (contentWidth - (self.columCount - 1) * self.minimumInteritemSpacing) / self.columCount;
        [self attribute:colWidth];
    
}

- (void) attribute:(CGFloat) colWidth{
    NSInteger colCount[self.columCount];
    CGFloat colHeight[self.columCount];
    
    for (int i=0; i<self.columCount; ++i)
    {
        colHeight[i] = 0;
        colCount[i] = 0;
    }
    // 定义总item高
    CGFloat totoalItemHeight = 0;
    
    // 定义一个可变数组，来存储 所有有的属性值
    NSMutableArray * arrayM = [NSMutableArray arrayWithCapacity:self.dataList.count];
    
    // 计数
    NSInteger index = 0;
    
    // 遍历数组，计算相关的属性
    for (ZFCollectionViewCellModel * cellM  in self.dataList)
    {
        
        // 1> 建立布局属性
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        index ++;
        UICollectionViewLayoutAttributes * attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        // 2.计算当前的列数
        // 计算是第几列
        NSInteger col = [self shortestCol:colHeight];
        // 计算每一列的个数
        colCount[col]++;
        
        // 3.计算frame
        CGFloat w = cellM.itemWidth;
        CGFloat h =cellM.itemHeight;
        CGFloat x = self.sectionInset.left + (colWidth + self.minimumInteritemSpacing) * col;
        CGFloat y = colHeight[col] + self.minimumLineSpacing;
        
        // 累加，计算同一列下一个元素的高度
        
        colHeight[col] += (h + self.minimumLineSpacing);
        
        attr.frame = CGRectMake(x, y, w, h);
        
        // 4.计算总的高度
        totoalItemHeight += h;
        
        // 5.添加到 itemsAttribute
        [arrayM addObject:attr];
    }
    
    // 计算出最高的那一列
    NSInteger highestCol = [self highestColL:colHeight];
    // 设置 itemSize，使用总高度的平均值
    self.itemSize = CGSizeMake(colWidth, (colHeight[highestCol]- colCount[highestCol] * self.minimumInteritemSpacing) / colCount[highestCol]);
    
    self.itemsAttribute = arrayM;
}

//获得最少的那一列
- (NSInteger) shortestCol:(CGFloat *)colHeight {
    CGFloat min = MAXFLOAT;
    CGFloat col = 0;
    
    for (int i=0; i<self.columCount; ++i)
    {
        if (colHeight[i] <  min) {
            min = colHeight[i];
            col = i;
        }
    }
    return col;
}

/// 获得最高的那一列
///
/// @param colHeight 列高数组
///
/// @return 最高的列号
- (NSInteger) highestColL:(CGFloat *)colHeight {
    
    CGFloat max = 0;
    CGFloat col = 0;
    
    for (int i=0; i<self.columCount; ++i)
    {
        if(colHeight[i] > max)
        {
            max = colHeight[i];
            col = i;
        }
    }
    
    return col;
}


#pragma mark - 懒加载 属性数组
- (NSMutableArray *)itemsAttribute
{
    if (_itemsAttribute == nil)
    {
        _itemsAttribute = [NSMutableArray array];
    }
    return _itemsAttribute;
}



/**
 * 微调布局WaterfallType
 */
-(NSArray *)fixLayoutToWaterfallTypeWithArr:(NSArray *)array CenterX:(CGFloat)centerX CenterY:(CGFloat)centerY{
    
    return self.itemsAttribute;
}


@end
