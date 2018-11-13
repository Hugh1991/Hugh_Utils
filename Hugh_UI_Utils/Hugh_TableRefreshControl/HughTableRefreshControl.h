//
//  HughTableRefreshControl.h
//
//  Created by Hugh on 2018/11/10.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HughTableRefreshControl : UIControl

/*
 * 初始化刷新组件
 */
- (instancetype)initInScrollView:(UIScrollView *)scrollView;

/*
 * 刷新结束
 */
- (void)endRefreshing;

@end
