//
//  HughTableRefreshControl.m
//
//  Created by Hugh on 2018/11/10.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "HughTableRefreshControl.h"

@interface HughTableRefreshControl ()

@property (nonatomic, assign) UIScrollView *scrollView;
@property (nonatomic, assign) UIEdgeInsets originalContentInset;

@end

@implementation HughTableRefreshControl

- (instancetype)initInScrollView:(UIScrollView *)scrollView {
    if (self = [super init]){
        self = [super initWithFrame:CGRectMake(0, - 400, scrollView.frame.size.width, 400)];
        self.backgroundColor = [UIColor redColor];
        self.layer.masksToBounds = YES;
        
        self.scrollView = scrollView;
        self.originalContentInset = scrollView.contentInset;
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [scrollView addSubview:self];
        
        // KVO 导致程序切换到后台 crash
        [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"SunShineContentOffset"];
        [self.scrollView addObserver:self forKeyPath:@"contentInset" options:NSKeyValueObservingOptionNew context:@"SunShineContentInset"];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
}

- (void)endRefreshing {
    
}

@end
