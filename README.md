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






