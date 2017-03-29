//
//  DCollectFooterReusableView.m
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "DCollectFooterReusableView.h"

@implementation DCollectFooterReusableView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        self.footLab = [[UILabel alloc]init];
        self.footLab.text = @"这里就是尾部";
        self.footLab.textColor = [UIColor blackColor];
        self.footLab.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.footLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.footLab];

    }
    return self;
}
@end
