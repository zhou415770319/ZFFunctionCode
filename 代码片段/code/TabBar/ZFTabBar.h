//
//  ZFTabBar.h
//  代码片段
//
//  Created by w on 16/5/30.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZFTabBarViewDelegate <NSObject>
-(void)tabBarViewSelectedItem:(NSInteger)index;
-(void)tabBarViewCenterItemClick:(UIButton *)button;
@end

@interface ZFTabBar : UIView

@property (nonatomic, strong) UIImage * backgroundImage;
@property (nonatomic, strong) UIImage * centerImage;
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, assign) NSUInteger badgeValue;
@property (nonatomic, assign) NSInteger itemSelectedIndex;
@property (nonatomic, strong) UIButton * centerButton;
@property (nonatomic, assign) BOOL showCenter;

@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIImageView * backgroundImageView;

@property (nonatomic, strong) NSMutableArray * buttonArray;
@property (nonatomic, strong) NSMutableArray * titleLabels;


@property (nonatomic, strong) NSMutableArray * images;
@property (nonatomic, strong) NSMutableArray * selectedImages;
@property (nonatomic, strong) NSMutableArray * titles;

@property (nonatomic, weak) id<ZFTabBarViewDelegate>delegate;


-(id)initWithImages:(NSMutableArray *)images
       SelectImages:(NSMutableArray *)selectImages
             titles:(NSMutableArray *)titles;
- (id)initWithItemSelectedImages:(NSMutableArray *)selected
                    normalImages:(NSMutableArray *)normal
                          titles:(NSMutableArray *)titles;
-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index;

@end

@interface ZFButton : UIControl

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *EN_titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSUInteger badgeValue;
+(instancetype)zf_shareButton;
@end
