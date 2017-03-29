//
//  DCollectHeaderReusableView.m
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "DCollectHeaderReusableView.h"

@implementation DCollectHeaderReusableView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        self.headerLab = [[UILabel alloc]init];
        self.headerLab.text = @"这里是头部";
        self.headerLab.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.headerLab.textColor = [UIColor blackColor];
        self.headerLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.headerLab];
        
    }
    return self;
}
@end
