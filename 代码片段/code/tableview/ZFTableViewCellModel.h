//
//  ZFTableViewCellModel.h
//  代码片段
//
//  Created by w on 16/5/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFTableViewCellModel : NSObject
//这两个属性必须有一个不为空    cell类型
//class
@property(nonatomic,copy)NSString *cellName;
//xib
@property(nonatomic,copy)NSString *xibCellName;

//didSelectRow 需要跳转的controller
@property(nonatomic,copy)NSString *PopToViewController;



@property(nonatomic,copy)NSString *title;


@property(nonatomic,copy)NSString *imgName;


@property(nonatomic,copy)NSString *des;


@end
