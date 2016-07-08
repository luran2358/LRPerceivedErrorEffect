//
//  LRPerceivedErrorCell.h
//  LRPerceivedErrorEffect
//
//  Created by 卢然 on 16/7/5.
//  Copyright © 2016年 scorpio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRPerceivedErrorCell : UITableViewCell

/**
 *  背景图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

/**
 *  Xib创建Cell
 */
+ (instancetype)perceicedErrorCellFromXib:(UITableView *)tableView;

/**
 *  背景图片y值设置
 */
- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view;


@end
