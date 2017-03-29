//
//  tableViewCell05.m
//  tableViewSel
//
//  Created by imac on 2017/3/2.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "tableViewController09.h"
#import "tableViewCell09.h"



@interface tableViewController09 ()
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行

@property (nonatomic,strong) NSMutableArray *arry;

@property (nonatomic,assign) BOOL isSel;
@end

@implementation tableViewController09


-(NSMutableArray *)arry{
    
    if (!_arry) {
        
        _arry = [NSMutableArray array];
        
        
        for (int i = 0; i<26; i++) {
            
           [_arry addObject:@"22"];
        }
        
        
    }
    return _arry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"自定义单选(必选一个)";
    self.view.backgroundColor = [UIColor whiteColor];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *iDs = @"cell";
    tableViewCell09 *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        
        cell = [[tableViewCell09 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
        //        cell.selImgView.image = [UIImage imageNamed:@"unselect01"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
    if (_selIndex == indexPath) {
        cell.selImgView.image = [UIImage imageNamed:@"select01"];
    }else {
       cell.selImgView.image = [UIImage imageNamed:@"unselect01"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //之前选中的，取消选择
    tableViewCell09 *celled = [tableView cellForRowAtIndexPath:_selIndex];
    celled.selImgView.image = [UIImage imageNamed:@"unselect01"];
    //记录当前选中的位置索引
    _selIndex = indexPath;
    //当前选择的打勾
    tableViewCell09 *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selImgView.image = [UIImage imageNamed:@"select01"];
    
    NSLog(@"选中了第%ld个",indexPath.row);
}


@end
