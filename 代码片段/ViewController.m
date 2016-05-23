//
//  ViewController.m
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ViewController.h"
#import "ZFCollectionViewCell.h"
#import "ZFCollectionView.h"
#import "ZFCollectionViewLayout.h"
#import "ZFCollectionViewCellModel.h"
#import "ZFCollectionViewFlowLayout.h"
@interface ViewController ()

@property(nonatomic,retain)ZFCollectionView *collectionV;
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@end

@implementation ViewController
@synthesize collectionV;
- (void)viewDidLoad {
    
    [self loadCellDataWithLayoutType:ZFCollectionViewLayoutCircleType];
    
    for (int i =0 ; i<5; i++) {
        CGRect rect = CGRectMake(10, 340+40*i, self.view.frame.size.width-20, 30);
        [self addButtonWithFrame:rect Tag:i+100];

    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/*
 懒加载数据
 */
-(NSMutableArray *)infos{
    
    if (_infos == nil) {
        NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"zhou",@"fei",@"shi",@"ge",@"da",@"hun",@"dan",@"hehe", nil];
        NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:1];
        
        for (int i =0; i < arr.count; i++) {
            
            ZFCollectionViewCellModel *model = [[ZFCollectionViewCellModel alloc] init];
            model.title = arr[i];
            model.imgWidth =100;
            model.imgHeight =100;
            if (i != 3) {
                model.cellName =@"ZFCollectionViewCell";
            }else{
                
                model.cellName =@"ZFCollectionViewCell";
                model.imgHeight =150;

//                model.xibCellName =@"xibCollectionViewCell";

            }
            
            model.imgName =[NSString stringWithFormat:@"%i",i];
            [arr1 addObject:model];
        }
        _infos = arr1;
    }
    
    return _infos;
}

//layout自定义
-(void)loadCellDataWithLayoutType:(ZFCollectionViewLayoutType)layoutType{
    //数据转换成model
    
    ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
    lay.layoutType =layoutType;
    
    if (layoutType == ZFCollectionViewLayoutCircleType) {
        lay.itemSize =CGSizeMake(100, 100);
    }else{
        lay.itemSize =CGSizeMake(200, 200);
    }

    collectionV = [[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.width) collectionViewLayout:lay];
    collectionV.backgroundColor = [UIColor redColor];
    collectionV.cellInfos = self.infos;
    [self.view addSubview:collectionV];
    
}

//flowlayout自定义

-(void)loadCellDataWithFlowLayoutType:(ZFCollectionViewFlowLayoutType)flowLayoutType{
    //数据转换成model
    ZFCollectionViewFlowLayout *lay =[[ZFCollectionViewFlowLayout alloc] init];
    lay.flowLayoutType = flowLayoutType;

    if (flowLayoutType == ZFCollectionViewFlowLayoutWaterfallType) {//waterfalltype需要设置数据（数据中需要包含img 高度和宽度）和列数
        lay.dataList =self.infos;
        lay.columCount =2;
        collectionV.pagingEnabled =NO;
        //waterfalltype 不支持横向
        lay.scrollDirection = UICollectionViewScrollDirectionVertical;

    }else{
        collectionV.pagingEnabled =YES;
        lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    }
    
    
    collectionV = [[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.width) collectionViewLayout:lay];
    collectionV.cellInfos = self.infos;
    [self.view addSubview:collectionV];
    
    
}


-(void)addButtonWithFrame:(CGRect)frame Tag:(NSInteger)tag{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = frame;
    btn.tag = tag;
    [btn setTitle:[NSString stringWithFormat:@"布局方式%ld",tag+1-100] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
    CALayer *layer = btn.layer;
    layer.cornerRadius = 10;
    layer.masksToBounds =YES;
    layer.borderWidth =1;
    [self.view addSubview:btn];
    
}

-(void)clickBtn:(UIButton*)btn{
    [collectionV removeFromSuperview];
    switch (btn.tag-100) {
        case 0:
            [self loadCellDataWithLayoutType:ZFCollectionViewLayoutCircleType];
            break;
        case 1:
            [self loadCellDataWithLayoutType:ZFCollectionViewLayoutStackType];
            break;
        case 2:
            [self loadCellDataWithFlowLayoutType:ZFCollectionViewFlowLayoutLineType];
            break;
        case 3:
            [self loadCellDataWithFlowLayoutType:ZFCollectionViewFlowLayoutRotatePageType];
            break;
        case 4:
            [self loadCellDataWithFlowLayoutType:ZFCollectionViewFlowLayoutWaterfallType];
            break;
            
        default:
            break;
    }
    
    
    
//    ZFCollectionViewFlowLayout *lay =[[ZFCollectionViewFlowLayout alloc] init];
//    lay.flowLayoutType = ZFCollectionViewFlowLayoutRotatePageType;
//    collectionV.pagingEnabled =YES;
//
//    [collectionV setCollectionViewLayout:lay animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
