//
//  ZFTabBar.m
//  代码片段
//
//  Created by w on 16/5/30.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFTabBar.h"
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)


#pragma mark - TabBarView


@interface ZFTabBar ()


@end
@implementation ZFTabBar

-(id)initWithItemSelectedImages:(NSMutableArray *)selected
                   normalImages:(NSMutableArray *)normal
                         titles:(NSMutableArray *)titles{
    if ([super init]) {
        self.frame = CGRectMake(0, SCREENHEIGHT - 49, SCREENWIDTH, 49);
        self.buttonArray = [NSMutableArray array];
        self.titleLabels = [NSMutableArray array];
        
        self.unSelectedImages = normal;
        self.selectedImages = selected;
        self.titles = titles;
        [self createUI];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
    }
    return self;
}

-(void)createUI{
    
    self.line = [[UIView alloc]init];
    self.line.backgroundColor = [UIColor lightGrayColor];
    self.line.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
    [self addSubview:self.line];
    
    self.backgroundImageView = [[UIImageView alloc]init];
    self.backgroundImageView.image = self.backgroundImage;
    self.backgroundImageView.frame = CGRectMake(0, 0.5, self.frame.size.width, self.frame.size.height - 0.5);
    [self addSubview:self.backgroundImageView];
    
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.centerButton addTarget:self action:@selector(centerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.centerButton];
    
    
    NSArray *ary = [NSArray arrayWithObjects:[UIColor redColor],[UIColor grayColor],[UIColor blackColor],[UIColor blueColor],[UIColor greenColor], nil];
    NSArray *textAry = [NSArray arrayWithObjects:@"reservation",@"parking",@"found",@"mySelf",@"mySelf", nil];
    for (int i = 0; i < self.unSelectedImages.count; i ++) {
        
        ZFButton * button = [ZFButton zf_shareButton];
        [button.imageView setImage:self.unSelectedImages[i]];
        [button.imageView setImage:self.selectedImages[i]];
        [button.titleLabel setText:self.titles[i]];
        [button.titleLabel setTextColor:[UIColor whiteColor]];
        [button setBackgroundColor:ary[i]];
        button.titleLabel.font = [UIFont systemFontOfSize:14.f];
        
        [button.EN_titleLabel setText:textAry[i]];
        [button.EN_titleLabel setFont:[UIFont systemFontOfSize:11.f]];
        
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonArray addObject:button];
        
        
    }
    
    
    //    /** 普通按钮的高度 */
    CGFloat buttonHeight = 48.5;
    /** 普通按钮的宽度 */
    CGFloat buttonWidth = self.frame.size.width/5;
    //    CGFloat centerButtonX = (self.frame.size.width - centerButtonWH)*0.5;
    //
    //    if (_showCenter) {
    //        self.centerButton.frame = CGRectMake(centerButtonX, self.frame.size.height - centerButtonWH, centerButtonWH, centerButtonWH);
    //        buttonWidth = (self.frame.size.width- centerButtonWH - 20)/count;
    //    }
    //
    CGFloat buttonX = 0;
    
    for (int i = 0; i < self.buttonArray.count;i ++) {
        ZFButton * button = self.buttonArray[i];
        
        [button setBackgroundColor:ary[i]];
        //        buttonX += 0;
        if (i==0) {
            buttonWidth += buttonWidth;
            button.frame = CGRectMake(buttonX, 0.5, buttonWidth, buttonHeight);
            
            [self changeLongViewSizeWithBtn:button];
        }else
        {
            
            buttonWidth = self.frame.size.width/5;
            button.frame = CGRectMake(buttonX, 0.5, buttonWidth, buttonHeight);
            [self changeViewSizeWithBtn:button];
            
        }
        buttonX += buttonWidth;
    }
    
}

- (void)changeLongViewSizeWithBtn:(ZFButton *)control
{
    [control.EN_titleLabel setHidden:NO];
    
    // 获得按钮的大小
    CGFloat xm_btnWidth = control.bounds.size.width;
    CGFloat xm_btnHeight = control.bounds.size.height;
    // 获得按钮中UILabel文本的大小
    CGFloat xm_labelWidth =  control.bounds.size.width / 3*2;//self.titleLabel.bounds.size.width;
    CGFloat xm_labelHeight = 30;//self.titleLabel.bounds.size.height;
    // 获得按钮中image图标的大小
    CGFloat xm_imageWidth = 15;//self.imageView.bounds.size.width;
    CGFloat xm_imageHeight = 15;//self.imageView.bounds.size.height;
    
    /** 设置button上的图片或文字 */
    
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = control.titleLabel.font;
    [control.titleLabel setTextAlignment:NSTextAlignmentLeft];
    
    CGSize size = [control.titleLabel.text sizeWithFont:control.titleLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, control.titleLabel.frame.size.height)];
    
    control.imageView.frame = CGRectMake(xm_btnWidth / 3 - xm_imageWidth, xm_btnHeight /2 - xm_imageHeight/2, xm_imageWidth, xm_imageHeight);
    control.titleLabel.frame = CGRectMake(CGRectGetMaxX(control.imageView.frame) + 10, 5, xm_labelWidth, xm_labelHeight);
    
    control.EN_titleLabel.frame = CGRectMake(CGRectGetMaxX(control.imageView.frame) + 10 , CGRectGetMaxY(control.titleLabel.frame) , size.width,10);
    
}

- (void)changeViewSizeWithBtn:(ZFButton *)control
{
    [control.EN_titleLabel setHidden:YES];
    // 获得按钮的大小
    CGFloat xm_btnWidth = control.bounds.size.width;
    CGFloat xm_btnHeight = control.bounds.size.height;
    // 获得按钮中UILabel文本的大小
    CGFloat xm_labelWidth =  control.bounds.size.width;//self.titleLabel.bounds.size.width;
    CGFloat xm_labelHeight = 30;//self.titleLabel.bounds.size.height;
    // 获得按钮中image图标的大小
    CGFloat xm_imageWidth = 15;//self.imageView.bounds.size.width;
    CGFloat xm_imageHeight = 15;//self.imageView.bounds.size.height;
    
    /** 设置button上的图片或文字 */
    
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = control.titleLabel.font;
    [control.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    CGFloat imageX = (xm_btnWidth - xm_imageWidth) * 0.5;
    control.imageView.frame = CGRectMake(imageX, 10, xm_imageWidth, xm_imageHeight);
    control.titleLabel.frame = CGRectMake((xm_btnWidth - xm_labelWidth) * 0.5, xm_imageHeight + 5, xm_labelWidth, xm_labelHeight);
    
}

-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index{
    ZFButton * button = self.buttonArray[index];
    button.badgeValue = value;
}


-(void)setItemSelectedIndex:(NSInteger)itemSelectedIndex{
    _itemSelectedIndex = itemSelectedIndex;
    for (ZFButton * item in self.buttonArray) {
        item.selected = NO;
        if (item.tag == itemSelectedIndex)  item.selected = YES;
    }
}

-(void)setShowCenter:(BOOL)showCenter{
    _showCenter = showCenter;
}
-(void)setCenterImage:(UIImage *)centerImage{
    _centerImage = centerImage;
    [self.centerButton setImage:_centerImage forState:UIControlStateNormal];
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
}

-(void)buttonClick:(ZFButton *)button{
    for (ZFButton *item in self.buttonArray) item.selected = NO;
    /**
     *  选中哪一个item将上面的badgeValue清零
     */
    [self tabBarBadgeValue:0 item:button.tag];
    
    button.selected = !button.selected;
    
    //    /** 普通按钮的高度 */
    
    
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat buttonHeight = 48.5;
        /** 普通按钮的宽度 */
        CGFloat buttonWidth = self.frame.size.width/5;
        
        CGFloat buttonX = 0;
        
        NSArray *ary = [NSArray arrayWithObjects:[UIColor redColor],[UIColor grayColor],[UIColor blackColor],[UIColor blueColor],[UIColor greenColor], nil];
        
        for (int i = 0; i < self.buttonArray.count;i ++) {
            ZFButton * buttonNew = self.buttonArray[i];
            [buttonNew setBackgroundColor:ary[i]];
            //        buttonX += 0;
            if (button == buttonNew) {
                if (i == 0) {
                    buttonNew.titleLabel.text = @"场 馆 预 定";
                }else if (i == 1)
                {
                    buttonNew.titleLabel.text = @"智 慧 停 车";
                }
                else if (i == 3)
                {
                    buttonNew.titleLabel.text = @"    我    ";
                }
                buttonWidth += buttonWidth;
                buttonNew.frame = CGRectMake(buttonX, 0.5, buttonWidth, buttonHeight);
                [self changeLongViewSizeWithBtn:buttonNew];
                
            }else
            {
                if (i == 0) {
                    buttonNew.titleLabel.text = @"预  定";
                }else if (i == 1)
                {
                    buttonNew.titleLabel.text = @"停  车";
                }else if (i == 3)
                {
                    buttonNew.titleLabel.text = @"我";
                }
                buttonWidth = self.frame.size.width/5;
                buttonNew.frame = CGRectMake(buttonX, 0.5, buttonWidth, buttonHeight);
                [self changeViewSizeWithBtn:buttonNew];
                
            }
            
            buttonX += buttonWidth;
        }
    }];
    
    
    
    [self.delegate tabBarViewSelectedItem:button.tag];
}




-(void)centerButtonClick:(UIButton *)button{
    [self.delegate tabBarViewCenterItemClick:button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
}

@end


/** 图标在上，文本在下按钮的图文间隔比例（0-1）*/
#define xm_buttonTopRadio 0.7

@interface ZFButton ()
@property (nonatomic, strong) UILabel * badgeValueLabel;

@end

@implementation ZFButton

+ (instancetype)zf_shareButton{
    
    return [[self alloc] init];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.badgeValueLabel = [[UILabel alloc]init];
        self.badgeValueLabel.backgroundColor = [UIColor redColor];
        self.badgeValueLabel.textAlignment = NSTextAlignmentCenter;
        self.badgeValueLabel.font = [UIFont systemFontOfSize:11];
        self.badgeValueLabel.textColor = [UIColor whiteColor];
        self.badgeValueLabel.layer.masksToBounds = YES;
        self.badgeValueLabel.layer.cornerRadius = 6.5;
        [self addSubview:self.badgeValueLabel];
        
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        [self addSubview:self.titleLabel];
        
        self.EN_titleLabel = [[UILabel alloc] init];
        [self.EN_titleLabel setTextColor:[UIColor grayColor]];
        [self.EN_titleLabel setBackgroundColor:[UIColor blackColor]];
        [self.EN_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.EN_titleLabel setFont:[UIFont systemFontOfSize:13.f]];
        [self.EN_titleLabel setHidden:YES];
        [self addSubview:self.EN_titleLabel];
        
        self.imageView = [[UIImageView alloc] init];
        [self.imageView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.imageView];
        
        // 获得按钮的大小
        CGFloat xm_btnWidth = self.bounds.size.width;
        CGFloat xm_btnHeight = self.bounds.size.height;
        // 获得按钮中UILabel文本的大小
        CGFloat xm_labelWidth =  self.bounds.size.width;//self.titleLabel.bounds.size.width;
        CGFloat xm_labelHeight = 30;//self.titleLabel.bounds.size.height;
        // 获得按钮中image图标的大小
        CGFloat xm_imageWidth = 15;//self.imageView.bounds.size.width;
        CGFloat xm_imageHeight = 15;//self.imageView.bounds.size.height;
        
        /** 设置button上的图片或文字 */
        
        // 计算文本的的宽度
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        dictM[NSFontAttributeName] = self.titleLabel.font;
        CGSize size = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, self.titleLabel.frame.size.height)];
        
        
        CGFloat imageX = (xm_btnWidth - xm_imageWidth) * 0.5;
        self.imageView.frame = CGRectMake(imageX, 10, xm_imageWidth, xm_imageHeight);
        self.titleLabel.frame = CGRectMake((xm_btnWidth - xm_labelWidth) * 0.5, xm_imageHeight + 5, xm_labelWidth, xm_labelHeight);
        
        self.EN_titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + 10 , CGRectGetMaxY(self.titleLabel.frame) , size.width,10);
        
    }
    return self;
}

- (void)setUI
{
    
}

-(void)setBadgeValue:(NSUInteger)badgeValue{
    _badgeValue = badgeValue;
    self.badgeValueLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)_badgeValue];
}

- (CGSize)sizeWithFont:(UIFont *)font string:(NSString *)text
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(self.frame.size.width * 0.35, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    /** 设置badgeValue */
    CGSize size = [self sizeWithFont:[UIFont systemFontOfSize:12] string:self.badgeValueLabel.text];
    
    if (self.badgeValue == 0) {
        self.badgeValueLabel.frame = CGRectMake(self.frame.size.width*0.65, 3, 0, 0);
        return;
    }
    if (size.width < 10) size.width = 10;
    self.badgeValueLabel.frame = CGRectMake(self.frame.size.width*0.65, 3, size.width + 3, 13);
}

@end
