//
//  DCollectionViewCell.m
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "Masonry.h"
#import "DCollectionViewCell02.h"

@implementation DCollectionViewCell02

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        self.tip= [[UIButton alloc]init];
        [self addSubview:self.tip];
        [self.tip mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.offset(3);
            make.right.offset(0);
            make.size.mas_offset((CGSizeMake(20, 20)));
        }];
//        self.tip.image = [UIImage imageNamed:@"unselect01"];
//        [self.tip setImage:[UIImage imageNamed:@"unselect01"] forState:UIControlStateNormal];
    }
    
    return self;
}


//重新赋值
-(void)setMd:(DCollectionViewModel02  *)md{
    
    _md = md;
    if (_md.isSelected == YES) {
        
//        self.tip.image = [UIImage imageNamed:@"select01"];
        [self.tip setImage:[UIImage imageNamed:@"select01"] forState:UIControlStateNormal];

    }
    else{
        
//        self.tip.image = [UIImage imageNamed:@"unselect01"];
        [self.tip setImage:[UIImage imageNamed:@"unselect01"] forState:UIControlStateNormal];

    }
}

@end
