//
//  ZFCollectionView.h
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFCollectionView : UICollectionView

//设置layout方式

@property(nonatomic,retain)UICollectionViewLayout *layout;

//数据
@property(nonatomic,retain)NSMutableArray *cellInfos;


@end
