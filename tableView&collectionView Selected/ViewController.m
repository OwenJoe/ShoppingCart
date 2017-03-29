//
//  ViewController.m
//  tableView&collectionView Selected
//
//  Created by owen on 2017/3/27.
//  Copyright © 2017年 owen. All rights reserved.
//

#import "ViewController.h"
#import "tableViewCell05.h"
#import "tableViewController01.h"
#import "tableViewController02.h"
#import "tableViewController06.h"


#import "tableViewController03.h"
#import "tableViewController09.h"
#import "tableViewController05.h"

#import "DCollectionViewController.h"
#import "DCollectionViewController02.h"

#define tableTitile @"系统单选(必选一个)",@"侧滑删除",@"系统多选(可取消)",@"自定义单选(可取消)",@"自定义多选(可取消)",@"自定义单选(必选一个)"
#define collectTitile @"自定义单选", @"自定义多选"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *ZTableView;

@property (nonatomic,strong) NSMutableArray *arry;
@property (nonatomic,strong) NSMutableArray *brry;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"tableView & collectionView";
    
    self.arry = [NSMutableArray arrayWithObjects:tableTitile, nil];
    self.brry = [NSMutableArray arrayWithObjects:collectTitile,nil];
    
    self.ZTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.ZTableView.delegate = self;
    self.ZTableView.dataSource = self;
    [self.view addSubview:self.ZTableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section ==0) {
        
        return @"tableView部分";
    }
    else{
    
        return @"collectionView部分";
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section==0) {
        
        return self.arry.count;
    }
    else{
  
        return self.brry.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   static NSString *iDs = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        
        cell  =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    
    if (indexPath.section == 0) {
        
        cell.textLabel.text = self.arry[indexPath.row];
    }
    else{
    
        cell.textLabel.text = self.brry[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section ==0) {
        
        if (indexPath.row==0) {
            [self tabVc01];
        }
        if (indexPath.row==1) {
            [self tabVc02];
        }
        if (indexPath.row==2) {
            [self tabVc03];
        }
        if (indexPath.row==3) {
            [self tabVc05];
        }
        if (indexPath.row==4) {
            [self tabVc06];
        }
        if (indexPath.row==5) {
            [self tabVc09];
        }
        
    }
    else{
      
        if (indexPath.row==0) {
        
            [self collectVc01];
        }
        else{
        
            [self collectVc02];
        }
    }
    
}

#pragma mark -- 修改头部颜色
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *v = (UITableViewHeaderFooterView *)view;
    v.backgroundView.backgroundColor = [UIColor yellowColor];
}


- (void)tabVc01  {
    
    tableViewController01 *tabVc01 = [[tableViewController01 alloc]init];
    [self.navigationController pushViewController:tabVc01 animated:YES];
}


- (void)tabVc02  {
    
    tableViewController02 *tabVc02 = [[tableViewController02 alloc]init];
    [self.navigationController pushViewController:tabVc02 animated:YES];
}


- (void)tabVc03   {
    
    tableViewController03 *tabVc03 = [[tableViewController03 alloc]init];
    [self.navigationController pushViewController:tabVc03 animated:YES];
}



- (void)tabVc05   {
    
    tableViewController05 *tabVc05 = [[tableViewController05 alloc]init];
    [self.navigationController pushViewController:tabVc05 animated:YES];
}

- (void)tabVc06   {
    tableViewController06 *tabVc06 = [[tableViewController06 alloc]init];
    [self.navigationController pushViewController:tabVc06 animated:YES];
}



- (void)collectVc01   {
    
    //#import "DCollectionViewController.h"
    DCollectionViewController *collectVc01 = [[DCollectionViewController alloc]init];
    [self.navigationController pushViewController:collectVc01 animated:YES];
}


- (void)collectVc02   {
    
    DCollectionViewController02 *collectVc02 = [[DCollectionViewController02 alloc]init];
    [self.navigationController pushViewController:collectVc02 animated:YES];
}




- (void)tabVc09   {
    
    tableViewController09 *tabVc09 = [[tableViewController09 alloc]init];
    [self.navigationController pushViewController:tabVc09 animated:YES];
}


@end
