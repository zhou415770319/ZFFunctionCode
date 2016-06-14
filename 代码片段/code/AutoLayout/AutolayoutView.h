//
//  AutolayoutView.h
//  TeacherApp
//
//  Created by zhoufei on 15/6/16.
//  Copyright (c) 2015年 Beijing Wegenart Technology Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AutolayoutView : NSObject
/**
 *  生成自动布局的Lable 设置为默认设置
 */
+(UILabel *)autolayoutLableWithTitle:(NSString *)title;
/**
 *  生成自动布局的TextField 设置为默认设置
 */
+(UITextField * )autolayoutTextFieldWithPlaceholder:(NSString *)placeholder;
/**
 *  生成自动布局的Button  
 */

+(UIButton *)autolayoutButtonWithTitle:(NSString *)title andBackgroundColor:(UIColor *)color;

/**
 *  生成自动布局的 自定义 Button
 */
+(UIButton *)autolayoutCoustomBtnWithImgName:(NSString *)imgName andTitle:(NSString *)title;

/**
 *  添加一个有边框的button
 */
+(UIButton *)autolayoutButtonAddButtonHaveBorderTitle:(NSString *)title Tag:(NSInteger)tag;

/**
 *  生成自动布局的 ImageView
 */
+(UIImageView *)autolayoutImageView;

@end
