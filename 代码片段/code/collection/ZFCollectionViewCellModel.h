//
//  ZFCollectionViewCellModel.h
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZFCollectionViewCellModel : NSObject

//class
@property(nonatomic,copy)NSString *cellName;
//xib
@property(nonatomic,copy)NSString *xibCellName;


@property(nonatomic,copy)NSString *imgName;

//waterfallType 必须设置的参数
@property(nonatomic)CGFloat itemHeight;
@property(nonatomic)CGFloat itemWidth;


@property(nonatomic,copy)NSString *title;


@property(nonatomic)UIImage *img;


@property(nonatomic,copy)NSString *des;


@end
