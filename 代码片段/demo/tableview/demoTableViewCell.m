//
//  demoTableViewCell.m
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "demoTableViewCell.h"

@interface demoTableViewCell()

@property(nonatomic,retain)UIImageView* img;
@property(nonatomic,retain)UILabel* titleLab;
@property(nonatomic,retain)UILabel* desLab;


@end



@implementation demoTableViewCell

-(UIImageView *)img{
    
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.frame = CGRectMake(0, 0, self.bounds.size.width*0.8, self.bounds.size.height-40);
        _img.center =self.contentView.center;
        [self addSubview:_img];
    }
    return _img;
}

-(UILabel *)titleLab{
    
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width,20)];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

-(UILabel *)desLab{
    
    if (!_desLab) {
        _desLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-40, self.bounds.size.width,20)];
        _desLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_desLab];
    }
    return _desLab;
}


-(void)drawRect:(CGRect)rect{
    
        UIImage *img = [UIImage imageNamed:self.cellInfo.imgName];
    
        self.img.image =img;
    
        self.titleLab.text = self.cellInfo.title;
        self.desLab.text =self.cellInfo.des;

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
