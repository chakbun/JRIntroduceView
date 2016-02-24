//
//  JRIntroduceView.m
//
//  Created by JR on 16/2/19.
//  Copyright © 2016年 JR. All rights reserved.
//

#import "JRIntroduceView.h"

@interface JRIntroduceView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *introduceScrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation JRIntroduceView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
     
        self.introduceScrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.introduceScrollView.backgroundColor = [UIColor whiteColor];
        self.introduceScrollView.pagingEnabled = YES;
        self.introduceScrollView.showsHorizontalScrollIndicator = NO;
        self.introduceScrollView.delegate = self;
        [self addSubview:self.introduceScrollView];
        
        self.enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.enterButton.backgroundColor = [UIColor redColor];
        [self.enterButton setTitle:@"开始体验" forState:UIControlStateNormal];
        [self.enterButton addTarget:self action:@selector(enterButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonWidth = 200;
        CGFloat buttonHeight = 40;
        CGFloat buttonBottom = 60;

        self.enterButton.frame = CGRectMake((frame.size.width-buttonWidth)/2.0, (frame.size.height - buttonHeight - buttonBottom), buttonWidth, buttonHeight);
        
        self.enterButton.layer.masksToBounds = YES;
        self.enterButton.layer.cornerRadius = buttonHeight/4.0;
        self.enterButton.layer.borderColor = [UIColor clearColor].CGColor;
        self.enterButton.layer.borderWidth = 1.0;
        
        [self addSubview:self.enterButton];
        self.enterButton.alpha = 0.0;
        
        CGFloat controlWidth = 39;
        CGFloat controlHeight = 37;
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((frame.size.width-controlWidth)/2.0, self.enterButton.frame.origin.y+buttonHeight+20, controlWidth, controlHeight)];
        [self addSubview:self.pageControl];
    }
    
    return self;
}

- (void)setIntroduceImages:(NSArray *)introduceImages {
    _introduceImages = introduceImages;
    
    self.pageControl.numberOfPages = introduceImages.count;
    self.pageControl.currentPage = 0;
    
    for(int i = 0; i < introduceImages.count; i++) {
        NSString *imageName = introduceImages[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(JRSCREEN_WIDTH * i, 0, JRSCREEN_WIDTH, JRSCREEN_HEIGHT);
        [self.introduceScrollView addSubview:imageView];
    }
    
    [self.introduceScrollView setContentSize:CGSizeMake(JRSCREEN_WIDTH * introduceImages.count, JRSCREEN_HEIGHT)];
}

#pragma mark - ButtonAction

- (void)enterButtonAction:(id)sender {
    
    __weak __typeof(self) weakSelf = self;

    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
    
    if (self.enterActionBlock) {
        self.enterActionBlock(sender);
    }
}

#pragma mark - ScrollView Delegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    int page = targetContentOffset->x / JRSCREEN_WIDTH;
    self.pageControl.currentPage = page;
    
    __weak __typeof(self) weakSelf = self;

    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.enterButton.alpha = (page == weakSelf.introduceImages.count - 1)?1:0;
    }];
}

@end
