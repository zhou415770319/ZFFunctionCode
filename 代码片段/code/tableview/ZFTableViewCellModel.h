//
//  ZFTableViewCellModel.h
//  代码片段
//
//  Created by w on 16/5/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZFTableViewCellModel : NSObject
// cell类型 如果没有设置则默认为系统cell
//class
@property(nonatomic,copy)NSString *cellName;
//xib
@property(nonatomic,copy)NSString *xibCellName;

//没有设置cell类型的情况下可以设置tableViewCellStyle 默认为UITableViewCellStyleDefault
@property(nonatomic)UITableViewCellStyle tableViewCellStyle;


//didSelectRow 需要跳转的controller
@property(nonatomic,copy)NSString *PopToViewController;


//标题
@property(nonatomic,copy)NSString *title;
//图片名字
@property(nonatomic,copy)NSString *imgName;
//子标题
@property(nonatomic,copy)NSString *des;


@end
