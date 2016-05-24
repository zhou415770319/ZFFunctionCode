//
//  ZFTableViewCellModel.h
//  代码片段
//
//  Created by w on 16/5/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFTableViewCellModel : NSObject
//class
@property(nonatomic,copy)NSString *cellName;
//xib
@property(nonatomic,copy)NSString *xibCellName;

@property(nonatomic,copy)NSString *title;


@property(nonatomic,copy)NSString *imgName;


@property(nonatomic,copy)NSString *des;


@end
