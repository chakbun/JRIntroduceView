//
//  JRIntroduceView.h
//
//  Created by JR on 16/2/19.
//  Copyright © 2016年 JR. All rights reserved.
//

#import <UIKit/UIKit.h>

#define JRSCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define JRSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface JRIntroduceView : UIView

@property (nonatomic, strong) NSArray *introduceImages;

@property (nonatomic, strong) UIButton *enterButton;

@property (nonatomic, strong) void(^enterActionBlock)(UIButton *sender);

@end
