# ZFFunctionCode

结合网上的collectionView常用布局整合的collectionView使用工具

1.导入collectionView文件夹下的文件

2.在需要使用的地方加入ZFCollectionView
如下：

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

其中有五种布局方式
ZFCollectionViewLayoutType有两种
ZFCollectionViewLayoutCircleType,
ZFCollectionViewLayoutStackType

ZFCollectionViewFlowLayoutType有三种
ZFCollectionViewFlowLayoutRotatePageType,
ZFCollectionViewFlowLayoutWaterfallType,
ZFCollectionViewFlowLayoutLineType

根据需求设置数据
collectionV.cellInfos = self.infos;

数据必须是ZFCollectionViewCellModel类
可以自定义cell 将类名传给model （如果是使用代码自定义cell则传给cellName，xib自定义的cell则传给xibCellName）
详见demo

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
                
//                model.cellName =@"ZFCollectionViewCell";
                model.imgHeight =150;

                model.xibCellName =@"xibCollectionViewCell";

            }
            
            model.imgName =[NSString stringWithFormat:@"%i",i];
            [arr1 addObject:model];
        }
        _infos = arr1;
    }
    
    return _infos;
}



