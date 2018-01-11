## 功能点介绍
1. 实现截取某个控件并生成image的功能。
2. 实现MP4格式视频流的播放和暂停以及获取某一帧（视频流截图）的功能。
3. 实现m3u8格式视频流的播放和暂停以及获取某一帧（视频流截图）的功能。

## 注意事项
1. 播放视频时需要配置info.plist中的NSAppTransportSecurity，否则可能会出现视频无法播放的问题。
2. 在视频播放页面push到别的页面时需要停止视频的播放，否则视频会一直在播放。

## 代码介绍
1. MMScreenshotsManager中封装了三种截屏方法。
2. MMVideoPlayer中封装了一个简单的视频播放器。
3. 调用示例在对应的ViewController中，可供参考。

## 代码运行效果预览
### 截屏入口
![](https://github.com/zhanqin/screenshots/blob/master/VideoScreenshots/Resources/preview_1.png)
### imageView截图
![](https://github.com/zhanqin/screenshots/blob/master/VideoScreenshots/Resources/preview_2.png)
### MP4格式视频流截屏
![](https://github.com/zhanqin/screenshots/blob/master/VideoScreenshots/Resources/preview_3.png)
### m3u8格式视频流截屏
![](https://github.com/zhanqin/screenshots/blob/master/VideoScreenshots/Resources/preview_4.png)
