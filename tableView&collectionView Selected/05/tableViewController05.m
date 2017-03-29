//
//  tableViewCell05.m
//  tableViewSel
//
//  Created by imac on 2017/3/2.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "tableViewCell05.h"


#import "tableViewController05.h"

@interface tableViewController05 ()
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行

@property (nonatomic,strong) NSMutableArray *arry;

@property (nonatomic,assign) BOOL isSel;
@end

@implementation tableViewController05


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
    
    self.title= @"自定义单选(可取消)";
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
    tsCusSelCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        
        cell = [[tsCusSelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
        //        cell.selImgView.image = [UIImage imageNamed:@"unselect01"];
    }
    
    if (_isSel && _selIndex == indexPath) {
        cell.selImgView.image = [UIImage imageNamed:@"select01"];
    }else{
        cell.selImgView.image = [UIImage imageNamed:@"unselect01"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
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
    
    
    
    [self.tableView reloadData];
}



@end
