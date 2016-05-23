//
//  ZFBaseCollectionViewController.h
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFCollectionViewCellModel.h"
#import "ZFCollectionViewLayout.h"
#import "ZFCollectionView.h"
#import "ZFCollectionViewFlowLayout.h"

@interface ZFBaseCollectionViewController : UIViewController
//collectionView
@property(nonatomic,retain)ZFCollectionView *collectionV;
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;


@end
