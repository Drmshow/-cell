//
//  MZhTableViewCell.h
//  04-彩色方块
//
//  Created by drmshow on 15/5/15.
//  Copyright (c) 2015年 drmshow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZhTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *imgView;




+ (NSString *)cellUseIdWithIndexPath:(NSIndexPath *)path;
@end
