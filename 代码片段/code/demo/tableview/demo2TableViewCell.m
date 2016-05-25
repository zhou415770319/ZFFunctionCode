//
//  demo2TableViewCell.m
//  代码片段
//
//  Created by w on 16/5/25.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "demo2TableViewCell.h"

@implementation demo2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)drawRect:(CGRect)rect{
    
    self.title.text = self.cellInfo.title;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
