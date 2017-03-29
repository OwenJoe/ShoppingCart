//
//  tableViewController03.m
//  tableViewSel
//
//  Created by imac on 2017/3/2.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "tableViewController03.h"

@interface tableViewController03 ()
@property (strong, nonatomic) NSMutableArray *selectIndexs;//多选选中的行
@end

@implementation tableViewController03

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"系统多选(可取消)";
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

    
    //设置勾
    cell.accessoryType = UITableViewCellAccessoryNone;
    for (NSIndexPath *index in _selectIndexs) {
        if (index == indexPath) { //改行在选择的数组里面有记录
            cell.accessoryType = UITableViewCellAccessoryCheckmark; //打勾
            break;
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取到点击的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) { //如果为选中状态
        cell.accessoryType = UITableViewCellAccessoryNone; //切换为未选中
        [_selectIndexs removeObject:indexPath]; //数据移除
        NSLog(@"选中了第%ld个",indexPath.row);
    }else { //未选中
        cell.accessoryType = UITableViewCellAccessoryCheckmark; //切换为选中
        [_selectIndexs addObject:indexPath]; //添加索引数据到数组
        NSLog(@"移除了第%ld个",indexPath.row);
    }
    
}

@end
