//
//  DCollectionViewCell.h
//  tableView和UICollectionView 多选
//
//  Created by owen on 16/3/24.
//  Copyright © 2016年 owen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DCollectionViewModel02.h"
@interface DCollectionViewCell02 : UICollectionViewCell

@property (nonatomic,strong) DCollectionViewModel02 *md;

@property (nonatomic,strong) UIButton *tip;
@end
