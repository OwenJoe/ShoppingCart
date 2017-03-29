//
//  tsCusSelCell.m
//  tableViewAndCollectViewSel
//
//  Created by imac on 2017/3/2.
//  Copyright © 2017年 imac. All rights reserved.
//

#import "tableViewCell06.h"
#import "Masonry.h"

@implementation tableViewCell06 


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self initCellSelectImgView];
    return self;
}


//重新赋值
-(void)setMd:(tableViewModel06  *)md{
    
    _md = md;
    if (_md.isSelected == YES) {
        
        self.selImgView.image = [UIImage imageNamed:@"select01"];
    }
    else{
        
        self.selImgView.image = [UIImage imageNamed:@"unselect01"];
    }
}



-(void)initCellSelectImgView{
    
    self.selImgView = [[UIImageView alloc]init];
    //添加到cell上
    [self.contentView addSubview:self.selImgView];
    //    self.selImgView.image = [UIImage imageNamed:@"unselect01"];
    
    //坐标位置
    [self.selImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);
        make.centerY.equalTo(self.self.contentView);
        make.height.mas_equalTo(22);
        make.width.mas_equalTo(22);
    }];
}



@end
