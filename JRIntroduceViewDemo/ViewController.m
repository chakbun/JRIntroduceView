//
//  ViewController.m
//  JRIntroduceViewDemo
//
//  Created by cloudtech on 16/2/24.
//  Copyright © 2016年 chakbun. All rights reserved.
//

#import "ViewController.h"
#import "JRIntroduceView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JRIntroduceView *introduceView = [[JRIntroduceView alloc] initWithFrame:CGRectMake(0, 0, JRSCREEN_WIDTH, JRSCREEN_HEIGHT)];
    NSArray *images = @[@"guideImages_iphone6_P1",@"guideImages_iphone6_P2",@"guideImages_iphone6_P3",@"guideImages_iphone6_P4"];
    
    introduceView.introduceImages = images;
    introduceView.enterActionBlock = ^(UIButton *enterButton) {

    };
    
    [self.view addSubview:introduceView];
//    [[[UIApplication sharedApplication].delegate window] addSubview:introduceView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
