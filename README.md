# JRIntroduceView
JRIntroduceView 一个用objective－c封装的轻量级控件，适用于 app 首次启动以图片方式引导展示。

###效果（Demo）


![](https://github.com/chakbun/JRIntroduceView/blob/master/demo.gif)


###用法 (How to use)
* 将JRIntroduceView文件夹中的文件拷贝到项目中。

* 在项目中的RootViewController引入头文件

```obj-c
	#import "JRIntroduceView.h"
```

* 实例化JRIntroduceView，

```obj-c
	JRIntroduceView *introduceView = [[JRIntroduceView alloc] initWithFrame:CGRectMake(0, 0, JRSCREEN_WIDTH, JRSCREEN_HEIGHT)];
```

* 告诉JRIntroduceView要展示的图片，通过其属性introduceImages实现。
```obj-c
    NSArray *images = @[@"guideImages_iphone6_P1",@"guideImages_iphone6_P2",@"guideImages_iphone6_P3",@"guideImages_iphone6_P4"];
    
    introduceView.introduceImages = images;
```

* 图片展示到最后一页会出现完成的按钮，按钮时间通过block实现
 
```obj-c
    introduceView.enterActionBlock = ^(UIButton *enterButton) {

    };
```

*最后将introduceView 加入到需要的视图中去。

```obj-c
[self.view addSubview:introduceView];
```









