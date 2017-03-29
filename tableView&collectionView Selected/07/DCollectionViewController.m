//
//  DCollectionViewController.m
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "DCollectionViewController.h"
#import "DCollectionViewCell.h"
#import "DCollectHeaderReusableView.h"
#import "DCollectFooterReusableView.h"

@interface DCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *DcollectionView;
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@property (nonatomic,assign) BOOL isSel;

@property (nonatomic,strong) NSMutableArray *arry;
@end

//设置标识
static NSString *indentify = @"indentify";
@implementation DCollectionViewController
-(NSMutableArray *)arry{
    
    if (!_arry) {
        
        _arry = [NSMutableArray array];
        
        
        for (int i = 0; i<7; i++) {
            
            [_arry addObject:@"22"];
            
        }
        
        
    }
    return _arry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"CollectionView自定义单选";
    
    
    [self initCollectionViewMethod];
}

#pragma mark -- 初始化九宫格
-(void)initCollectionViewMethod{

    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设定垂直滚动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设定头部
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 30)];
    //设定尾部
    [flowLayout setFooterReferenceSize:CGSizeMake(self.view.frame.size.width, 30)];
    
    //设置uicollectionView
    self.DcollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    self.DcollectionView.backgroundColor = [UIColor lightGrayColor];
    
    //设置头尾部大小
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 30)];
    [flowLayout setFooterReferenceSize:CGSizeMake(self.view.frame.size.width, 30)];
    
    //代理
    self.DcollectionView.delegate = self;
    self.DcollectionView.dataSource =self;
    [self.view addSubview:self.DcollectionView];
    
   //注册头部和尾部和cell单元格
    [self.DcollectionView registerClass:[DCollectionViewCell class] forCellWithReuseIdentifier:indentify];
    [self.DcollectionView registerClass:[DCollectHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.DcollectionView registerClass:[DCollectFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
}


#pragma mark -- 组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

#pragma mark -- 个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 5;
}

#pragma mark -- 内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    DCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath ];
    if (!cell) {
        
        NSLog(@"无法创建九宫格");
    }
    
    if (_isSel && _selIndex == indexPath) {
        cell.tip.image = [UIImage imageNamed:@"select01"];
    }else{
        cell.tip.image = [UIImage imageNamed:@"unselect01"];
    }
    
    return cell;
}

#pragma mark -- 设置头尾部内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        
        DCollectHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        reusableView = headerView;
    }
    if (kind == UICollectionElementKindSectionFooter) {
        
        DCollectFooterReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        reusableView = footerView;
    }
    
    return reusableView;
    
}


/**********************collectionView布局***************************************/
#pragma mark -- 每个collectionView大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.height/8);
}

#pragma mark -- collectionView距离上左下右位置设置
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(20, 20, 20, 20);
}


#pragma mark --  collectionView之间最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 20;
}

#pragma mark -- collectionView之间最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 20;
}

#pragma mark -- 选中事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"选中了:%ld",indexPath.row);
    
    if (_isSel == NO) {
        _isSel = YES;
        _selIndex = indexPath;
    }else{
        
        if (_selIndex == indexPath) {
            _isSel = NO;
        }else{
            
            _selIndex = indexPath;
        }
    }
    
    
    [self.DcollectionView reloadData];
}


















@end
