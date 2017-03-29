//
//  tableViewController01.m
//  tableViewSel
//
//  Created by imac on 2017/3/2.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "tableViewController01.h"

@interface tableViewController01 ()
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@end

@implementation tableViewController01

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"系统单选(必选一个)";
    self.view.backgroundColor = [UIColor whiteColor];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 26;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *iDs = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];
    
    //当上下拉动的时候，因为cell的复用性，我们需要重新判断一下哪一行是打勾的
    if (_selIndex == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //之前选中的，取消选择
    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
    celled.accessoryType = UITableViewCellAccessoryNone;
    //记录当前选中的位置索引
    _selIndex = indexPath;
    //当前选择的打勾
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSLog(@"选中了第%ld个",indexPath.row);
}
@end
