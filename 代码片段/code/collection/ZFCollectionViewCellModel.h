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
@property(nonatomic)CGFloat imgHeight;
@property(nonatomic)CGFloat imgWidth;


@property(nonatomic,copy)NSString *title;


@property(nonatomic,copy)UIImage *img;


@property(nonatomic,copy)NSString *des;


@end
