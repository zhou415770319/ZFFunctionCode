//
//  ZFScrollView.h
//  代码片段
//
//  Created by w on 16/5/26.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFScrollView : UIView
//
@property (nonatomic,retain)NSMutableArray *infos;
//
@property (nonatomic,retain)UIView *contentView;
//
@property (nonatomic,copy)NSString *xibName;



//是否添加自动滚动  默认 no
@property(nonatomic,assign)bool isAddTimer;

//动画时间可设置，默认2.0秒
@property(nonatomic,assign)CGFloat animationDuration;


@end
