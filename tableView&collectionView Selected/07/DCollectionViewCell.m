//
//  DCollectionViewCell.m
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "Masonry.h"
#import "DCollectionViewCell.h"

@implementation DCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        self.tip= [[UIImageView alloc]init];
        [self addSubview:self.tip];
        [self.tip mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.offset(3);
            make.right.offset(0);
            make.size.mas_offset((CGSizeMake(20, 20)));
        }];
        self.tip.image = [UIImage imageNamed:@"unselect01"];
    }
    
    return self;
}

@end
