//
//  ViewController.m
//  04-彩色方块
//
//  Created by drmshow on 15/5/15.
//  Copyright (c) 2015年 drmshow. All rights reserved.
//

#import "ViewController.h"
#import "MZhTableViewCell.h"
@interface ViewController ()

@property (nonatomic, assign) CGFloat rowNum;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置cell不可以选中
    self.tableView.allowsSelection = NO;
    self.rowNum = 0;
    self.tableView.showsVerticalScrollIndicator = NO;
    
}

#pragma mark -数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ID = [MZhTableViewCell cellUseIdWithIndexPath:indexPath];
    MZhTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView willDisplayCell:(MZhTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  
    cell.alpha = 0;
    cell.transform = CGAffineTransformMakeScale(0.0, 0.0);
    // 设置锚点
    cell.layer.anchorPoint = CGPointMake(1.0, 1.0);
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10.0 options:UIViewAnimationOptionTransitionNone animations:^{
        cell.alpha = 1;
        cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
        cell.layer.anchorPoint = CGPointMake(0.0, 0.0);
    } completion:^(BOOL finished) {}];
        [self subviewAnimationWithCell:cell andIndex:indexPath];
}

#pragma mark - 动画
- (void)subviewAnimationWithCell:(MZhTableViewCell *)cell andIndex:(NSIndexPath *)path{
    cell.imgView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    cell.imgView.alpha = 0;
    cell.imgView.layer.cornerRadius = 35 * 0.5;
    cell.imgView.layer.masksToBounds = YES;

    // 动画
    CGFloat time = arc4random_uniform(10) * 0.1;
    [UIView animateWithDuration:time delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionRepeat animations:^{
        cell.imgView.alpha = 1;
        
        if (path.row < self.rowNum) {
            cell.imgView.layer.anchorPoint = CGPointMake(1.0, 1.0);
            self.rowNum = path.row;
        }else{
        
            cell.imgView.layer.anchorPoint = CGPointMake(0.0, 0.0);
            self.rowNum = path.row;
        }
    } completion:^(BOOL finished) {
        
    }];

}
@end
