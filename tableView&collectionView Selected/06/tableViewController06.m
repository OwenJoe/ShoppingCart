//
//  tableViewCell05.m
//  tableViewSel
//
//  Created by imac on 2017/3/2.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "tableViewController06.h"
#import "tableViewCell06.h"
#import "tableViewModel06.h"
#import "Masonry.h"
@interface tableViewController06 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) tableViewModel06 *model;
@property (nonatomic,strong) NSMutableArray *arry;//本地随机数组
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIButton *selectBtn;//全选/全不选按钮
@property (nonatomic,assign) BOOL isSelBtn;//全选按钮lable布尔值
@end

@implementation tableViewController06

-(tableViewModel06 *)model{
    
    if (!_model) {
        _model = [[tableViewModel06 alloc]init];
    }
    return _model;
}

-(NSMutableArray *)arry{
    
    if (!_arry) {
        
        _arry = [NSMutableArray array];
        
        
        for (int i = 0; i<30; i++) {
            
            tableViewModel06 *md = [[tableViewModel06 alloc]init];
            
            md.isSelected = NO;
            
            [_arry addObject:md];
        }
        
        
    }
    return _arry;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"自定义多选(可取消)";
    self.view.backgroundColor = [UIColor whiteColor];
   
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

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


#pragma mark -- 全选按钮点击方法
-(void)seletAll{
    
    
    if (_isSelBtn == YES) {
        //因为处于"全选"状态,所以按钮文字要显示为"全不选",可以参照淘宝购物车
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
    
    [self.tableView reloadData];
}

#pragma mark -- 删除按钮
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
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *iDs = @"cell";
    tableViewCell06 *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        
        cell = [[tableViewCell06 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    cell.textLabel.text = @"测试";
    //数组组装到模型
    cell.md = self.arry[indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    _model = self.arry[indexPath.row];
    
    _model.isSelected = !_model.isSelected;
    
    if (_model.isSelected ==YES) {
        
//        NSLog(@"选中了第%ld个",indexPath.row);
    } else {
        
//        NSLog(@"删除了第%ld个",indexPath.row);
    }
    
    [self.tableView reloadData];
}



@end
