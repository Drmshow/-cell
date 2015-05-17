//
//  MyTableViewController.m
//  带动画的cell
//
//  Created by drmshow on 15/5/17.
//  Copyright (c) 2015年 drmshow. All rights reserved.
//

#import "MyTableViewController.h"
#import "AnimationCell.h"
@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 取消滚动条
    self.tableView.showsVerticalScrollIndicator = NO;

}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animation cell"];
    // 设置cell随机背景色
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0) / 255.0 green:arc4random_uniform(255.0) / 255.0 blue:arc4random_uniform(255.0) / 255.0 alpha:1];
    cell.layer.anchorPoint = CGPointMake(0.0, 0.0);
   return cell;
}

#pragma mark -代理方法
- (void)tableView:(UITableView *)tableView willDisplayCell:(AnimationCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
      [self animationFromCell:cell];
}

#pragma mark -设置cell的动画
- (void)animationFromCell:(AnimationCell *)cell {
    
    cell.alpha = 0;
    cell.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10.0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        cell.alpha = 1;
        cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {}];
    
    [self AnimationFromCellSubview:cell];
}

#pragma mark- 设置的是 cell 里面控件的动画
- (void)AnimationFromCellSubview:(AnimationCell *)cell {
    
    cell.imgView.alpha = 0;
    cell.imgView.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        cell.imgView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        cell.imgView.alpha = 1;
    }completion:^(BOOL finished) {}];
}

@end
