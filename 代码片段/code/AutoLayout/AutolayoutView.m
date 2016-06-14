//
//  AutolayoutView.m
//  TeacherApp
//
//  Created by zhoufei on 15/6/16.
//  Copyright (c) 2015年 Beijing Wegenart Technology Co. All rights reserved.
//

#import "AutolayoutView.h"
#define TEXTSIZEMAX [UIFont systemFontOfSize:18.0]
#define TEXTSIZEBIG [UIFont systemFontOfSize:16.0]
#define TEXTSIZEMIDDLE [UIFont systemFontOfSize:15.0]
#define TEXTSIZE_14 [UIFont systemFontOfSize:14.0]
#define TEXTSIZESMALL [UIFont systemFontOfSize:12.0]

//#import "imgButton.h"
@implementation AutolayoutView

/**
 *  生成自动布局的Lable  ,设置为默认设置
 *
 *  @param title Lable 标题
 *
 *  @return 生成的Lable
 */
+(UILabel *)autolayoutLableWithTitle:(NSString *)title{
    
    UILabel *autolayoutLabel = [[UILabel alloc] init];
    autolayoutLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    autolayoutLabel.font =TEXTSIZEMIDDLE;
    autolayoutLabel.backgroundColor = [UIColor clearColor];
    autolayoutLabel.textAlignment = NSTextAlignmentLeft;
    autolayoutLabel.text = title;
    autolayoutLabel.textColor = [UIColor blackColor];
    return autolayoutLabel;
}
/**
 *  生成自动布局的TextField  ,设置为默认设置
 *
 *  @param placeholder TextField 提示
 *
 *  @return 生成的TextField
 */
+(UITextField * )autolayoutTextFieldWithPlaceholder:(NSString *)placeholder{
    
    UITextField *textField = [[UITextField alloc] init];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.textColor = [UIColor darkGrayColor];
    textField.font = [UIFont fontWithName:@"Heiti SC" size:16.0f];
    textField.placeholder = placeholder;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.layer.masksToBounds = YES;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}
/**
 *  生成自动布局的ImageView  ,设置为默认设置
 *
 */
+(UIImageView *)autolayoutImageView{
    
    UIImageView *autolayoutLabel = [[UIImageView alloc] init];
    autolayoutLabel.translatesAutoresizingMaskIntoConstraints = NO;
    //    autolayoutLabel.font =TEXTSIZEMIDDLE;
    autolayoutLabel.backgroundColor = [UIColor clearColor];
    return autolayoutLabel;
}

/**
 *  图片按钮
 *
 *  @param title         标题
 *  @param imgName       normal状态图片
 *  @param heightImgName heightlight状态下的图片
 *
 *  @return 按钮
 */
+(UIButton * )autolayoutButtonWithTitle:(NSString *)title normalImageName:(NSString *)imgName heightImgName:(NSString *)heightImgName{
    UIButton *btn = [[UIButton alloc] init];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:heightImgName] forState:UIControlStateHighlighted];
    return btn;
}
/**
 *  背景按钮
 *
 *  @param title 按钮标题
 *  @param color 按钮背景颜色
 *
 *  @return 按钮
 */
+(UIButton *)autolayoutButtonWithTitle:(NSString *)title andBackgroundColor:(UIColor *)color{
    
    UIButton *btn =[[UIButton alloc] init];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.backgroundColor =color;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    return btn;
}

+(UIButton *)autolayoutButtonAddButtonHaveBorderTitle:(NSString *)title Tag:(NSInteger)tag{
    UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [customBtn setTitle:title forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    customBtn.tag = tag;
    customBtn.layer.cornerRadius= 5;
    customBtn.layer.borderWidth = 0.5;
    customBtn.layer.borderColor = [UIColor blackColor].CGColor;
    customBtn.clipsToBounds =YES;
    return customBtn;
}


/**
 *  生成自定义btn
 *
 *  @param imgName 图片
 *  @param title   标题
 *
 *  @return 返回生成的button
 */

//+(UIButton *)autolayoutCoustomBtnWithImgName:(NSString *)imgName andTitle:(NSString *)title{
//    
//    ImgButton *Btn = [ImgButton buttonWithType:UIButtonTypeCustom];
//    /**
//     *  支持autolayout
//     */
//    Btn = [ImgButton autolayoutView];
//    
//    Btn.backgroundColor =[UIColor clearColor];
//    [Btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
//    [Btn setTitle:title forState:UIControlStateNormal];
//    [Btn setTitleColor:DARK_GRAY_BUTTON_COLOR forState:UIControlStateNormal];
//    Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    Btn.titleLabel.font = TEXTSIZEMIDDLE;
//    return Btn;
//    
//}


@end
