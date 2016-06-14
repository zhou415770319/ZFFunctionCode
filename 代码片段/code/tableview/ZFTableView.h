//
//  ZFTableView.h
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFTableViewCellModel.h"
#import "ZFTableViewCell.h"
@interface ZFTableView : UITableView
/**
 *  cell 信息
 */
@property(nonatomic,retain)NSArray *cellInfos;
/**
 *  是否多组
 */
@property(nonatomic,assign)BOOL isMoreSection;

/**
 *  row 高度
 */
@property (nonatomic,assign)CGFloat heightForRow;
/**
 *  header 高度
 */
@property (nonatomic,assign)CGFloat heightForHeader;

/**
 *  footer 高度
 */
@property (nonatomic,assign)CGFloat heightForFooter;

@property (nonatomic,retain)UIView *headerView;

@property (nonatomic,retain)UIView *FooterView;


/**
 *  cell SelectionStyle
 */
@property (nonatomic,assign)UITableViewCellSelectionStyle tableViewCellSelectionStyle;



@end
