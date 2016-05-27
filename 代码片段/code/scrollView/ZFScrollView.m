//
//  ZFScrollView.m
//  代码片段
//
//  Created by w on 16/5/26.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFScrollView.h"

@interface ZFScrollView()<UIScrollViewDelegate>

@property (nonatomic,retain)UIScrollView *scrollV;


@property (nonatomic,retain)UIPageControl *pageControl;


@property (strong, nonatomic) NSTimer *timer;


@end

#define spaceX 10
#define spaceY 10

@implementation ZFScrollView



-(UIPageControl *)pageControl{
    
    if (!_pageControl) {
        _pageControl =[[UIPageControl alloc]initWithFrame:CGRectMake((self.frame.size.width-200)/2, self.frame.size.height-30-spaceY, 200, 30)];
        //        _pageControl.backgroundColor =[UIColor brownColor];
        [self addSubview:_pageControl];
    }
    return _pageControl;
}


-(bool)isAddTimer{
    
    if (!_isAddTimer) {
        _isAddTimer = NO;
    }
    return _isAddTimer;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        
//        
//    }
//    return self;
//}
//
-(void)setInfos:(NSMutableArray *)infos{
    
    if (_infos!= infos) {
        _infos =infos;
    }
    
}


-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    _scrollV = [[UIScrollView alloc]initWithFrame:self.bounds];
    //        _scrollV.backgroundColor =[UIColor redColor];
    [self addSubview:_scrollV];
    self.scrollV.delegate =self;
    //4.隐藏水平滚动条
    self.scrollV.showsHorizontalScrollIndicator = NO;
    
    //5.分页原理：根据scrollView的frame宽度来分页
    self.scrollV.pagingEnabled = YES;
    
    for (int i =0; i< self.infos.count; i++) {
        UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.infos[i]]];
        UIImageView *imgV =[[UIImageView alloc]initWithFrame:CGRectMake(i*self.scrollV.frame.size.width+spaceX, 0+spaceY, self.scrollV.frame.size.width-spaceX*2, self.frame.size.height-spaceY*2)];
        imgV.image = img;
        [self.scrollV addSubview:imgV];
    }
    
    self.scrollV.contentSize = CGSizeMake(_infos.count*self.scrollV.frame.size.width, self.scrollV.frame.size.height);
    
    //6.设置pageControl的总页数
    self.pageControl.numberOfPages = self.infos.count;
    

    //8.添加一个定时器
    if (_isAddTimer) {
        [self addTimer];
        //把定时器添加到主线程里，主线程会分一点点的时间来处理定时器的事件
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
    }
    
    
}

// 移除一个定时器
- (void)removeTimer
{
    [self.timer invalidate];//定时器作废
    self.timer = nil;
}
// 添加定时器
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:!self.animationDuration ? 2.0:self.animationDuration target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
}


- (void)nextImage
{
    //1.获取当前的page值
    long int page = 0;
    if (self.pageControl.currentPage == self.infos.count - 1) {
        page = 0;
    }else{
        page = self.pageControl.currentPage + 1;
    }
    
    //2.计算滚动的位置
    //    CGFloat offsetX = self.pageControl.currentPage * self.scrollView.frame.size.width;
    CGFloat offsetX = page * self.scrollV.frame.size.width;
    
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollV setContentOffset:offset animated:YES];
    
}

#pragma mark - 代理方法
//正在滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
    
    
}

//开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_isAddTimer) {
        //只要用户开始拖拽，我们就把定时器停止
        [self removeTimer];
    }
}

//停止拖拽的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_isAddTimer) {
        [self addTimer];
    }
}





@end
