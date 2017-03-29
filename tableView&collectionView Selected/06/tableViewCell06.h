//
//  tableViewCell06.h
//  tableViewAndCollectViewSel
//
//  Created by imac on 2017/3/3.
//  Copyright © 2017年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tableViewModel06.h"

@interface tableViewCell06 : UITableViewCell

/**
 添加图片
 */
@property(nonatomic,strong)UIImageView *selImgView;

@property (nonatomic,strong) tableViewModel06 *md;
@end
