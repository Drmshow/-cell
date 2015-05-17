//
//  MZhTableViewCell.m
//  04-彩色方块
//
//  Created by drmshow on 15/5/15.
//  Copyright (c) 2015年 drmshow. All rights reserved.
//

#import "MZhTableViewCell.h"

@implementation MZhTableViewCell



+ (NSString *)cellUseIdWithIndexPath:(NSIndexPath *)path{
    if (path.row % 2 == 0) {
        return @"1cell";
    }
    
    return @"2cell";

}
- (void)awakeFromNib{
    self.layer.anchorPoint = CGPointMake(1.0, 1.0);
}
@end
