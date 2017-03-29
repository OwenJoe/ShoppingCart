//
//  DCollectionViewController.m
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "DCollectionViewController02.h"
#import "DCollectionViewCell02.h"
#import "DCollectHeaderReusableView02.h"
#import "DCollectFooterReusableView02.h"
#import "Masonry.h"

#import "DCollectionViewModel02.h"

@interface DCollectionViewController02 ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *DcollectionView;
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@property (nonatomic,assign) BOOL isSel;

@property (nonatomic,strong) NSMutableArray *arry;

@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,assign) BOOL isSelBtn;

@property (nonatomic,strong) DCollectionViewModel02 *model;

@end

//设置标识
static NSString *indentify = @"indentify";
@implementation DCollectionViewController02
-(NSMutableArray *)arry{
    
    
    if (!_arry) {
        
        _arry = [NSMutableArray array];
        
        
        for (int i = 0; i<7; i++) {
            
            DCollectionViewModel02 *md = [[DCollectionViewModel02 alloc]init];
            
            md.isSelected = NO;
            
            [_arry addObject:md];
        }
        
        
    }
    return _arry;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"CollectionView自定义多选";
    
    
    [self initCollectionViewMethod];
    
    [self initSelectBtnAndDelectBtn];
}


#pragma mark -- 初始化全选和删除按钮
-(void)initSelectBtnAndDelectBtn{
    
    
    //多选按钮
    self.isSelBtn = YES;//默认按钮布尔值是1
    self.selectBtn = [[UIButton alloc]init];
    [self.view addSubview:self.selectBtn ];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.offset(-10);
        make.size.sizeOffset(CGSizeMake(60, 30));
        make.left.offset(35);
    }];
    [self.selectBtn setTitle:@"全选" forState:UIControlStateNormal];
    [self.selectBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.selectBtn.layer.borderWidth = 1;
    self.selectBtn.layer.borderColor = [UIColor blackColor].CGColor;
    [self.selectBtn addTarget:self action:@selector(seletAll) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //删除按钮
    UIButton *delectBtn = [[UIButton alloc]init];
    [self.view addSubview:delectBtn];
    [delectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.offset(-10);
        make.size.sizeOffset(CGSizeMake(60, 30));
        make.left.mas_equalTo(self.selectBtn.mas_right).offset(30);
    }];
    [delectBtn setTitle:@"删除" forState:UIControlStateNormal];
    [delectBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    delectBtn.layer.borderWidth = 1;
    delectBtn.layer.borderColor = [UIColor blackColor].CGColor;
    [delectBtn addTarget:self action:@selector(delectAll) forControlEvents:UIControlEventTouchUpInside];
}



-(void)seletAll{
    
    
    if (_isSelBtn == YES) {
        
        [self.selectBtn setTitle:@"全不选" forState:UIControlStateNormal];
        [self selectAllForIcon:YES];
    }
    else{
        
        [self.selectBtn setTitle:@"全选" forState:UIControlStateNormal];
        
        [self selectAllForIcon:NO];
    }
    
    _isSelBtn = !_isSelBtn;
}


#pragma mark -- 全选按钮的变化
-(void)selectAllForIcon:(BOOL)isSelect{
    
    //全选/全不选后,如点击了其中某条或几条,然后再次点击全选/全不选,必须将刚才的记录清除
    for (int i =0; i<self.arry.count; i++) {
        
        _model = self.arry[i];
        if (isSelect== YES) {
            
            _model.isSelected = YES;
            
        } else {
            
            _model.isSelected = NO;
        }
        //        _model.isSelected = !_model.isSelected;
        
    }
    
    [self.DcollectionView reloadData];
}


#pragma mark -- 删除
-(void)delectAll{
    
    NSLog(@"总个数:%ld",self.arry.count);
    for (int k =0; k<self.arry.count; k++) {
        
        _model = self.arry[k];
        if (_model.isSelected == YES) {
            
            //            [tempArr addObject:_model];
            [self.arry removeObject:self.arry[k]];
            k--;
        }
    }
    NSLog(@"剩余个数:%ld",self.arry.count);
    [self.DcollectionView reloadData];
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
    [self.DcollectionView registerClass:[DCollectionViewCell02 class] forCellWithReuseIdentifier:indentify];
    [self.DcollectionView registerClass:[DCollectHeaderReusableView02 class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.DcollectionView registerClass:[DCollectFooterReusableView02 class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
}


#pragma mark -- 组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

#pragma mark -- 个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.arry.count;
}

#pragma mark -- 内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DCollectionViewCell02 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath ];
    if (!cell) {
        
        NSLog(@"无法创建九宫格");
    }
    
    //数组组装到模型
    cell.md = self.arry[indexPath.row];
     return cell;
}

#pragma mark -- 设置头尾部内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        
        DCollectHeaderReusableView02 *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        reusableView = headerView;
    }
    if (kind == UICollectionElementKindSectionFooter) {
        
        DCollectFooterReusableView02 *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
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
    
    
    _model = self.arry[indexPath.row];
    
    _model.isSelected = !_model.isSelected;
    
    if (_model.isSelected ==YES) {
        
        //        NSLog(@"选中了第%ld个",indexPath.row);
    } else {
        
        //        NSLog(@"删除了第%ld个",indexPath.row);
    }

    
    [self.DcollectionView reloadData];
}


















@end
