# Download Videos # 

## youtube-dl


### install

- Linux:

```
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

- Mac OS: `brew install youtube-dl`



### 常用命令


```
youtube-dl -i -f mp4 --yes-playlist 'https://www.youtube.com/watch?v=7Vy8970q0Xc&list=PLwJ2VKmefmxpUJEGB1ff6yUZ5Zd7Gegn2'

youtube-dl -i PLwJ2VKmefmxpUJEGB1ff6yUZ5Zd7Gegn2

#Download YouTube playlist videos in separate directory indexed by video order in a playlist
youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'  https://www.youtube.com/playlist?list=PLE72E21ED4751B5EC

```

## youku-dl


TBA


## 视频转图像

```
ffmpeg -i "你是我的小呀小苹果儿.mp4" -r 1 -q:v 2 -f image2 image-3%d.jpeg
```
- -i选项用来获取输入文件，在这里是视频文件名你是我的小呀小苹果儿.mp4，  
- -r选项设置每秒提取图片的帧数。我想要每秒提取一帧。  
- -q:v 设置提取到的图片质量。设置2来从视频中获取高质量图片。

####  rtsp to image
```
ffmpeg -i rtsp://IP_ADDRESS/live.sdp -f image2 -r 1 img%01d.jpg
ffmpeg -i rtsp://192.168.123.13:554/onvif1 -r 1/5 -f image2 -updatefirst 1 img1.jpg
```

####  关键帧提取
```
 ffmpeg -i rtsp://192.168.123.13:554/onvif1 -r 1 -s 160x90 -q:v 2 -vf select='eq(pict_type\,I)' -f image2 image-3%d.jpeg
```

- -vf: 表示过滤图形的描述选择过滤器select会选择帧进行输出：包括过滤器常量pict_type和对应的类型:PICT_TYPE_I 表示是I帧，即关键帧。
- -vsync 2:阻止每个关键帧产生多余的拷贝
- -s 160x90:分辨率

or 

```
ffmpeg -ss <start_time> -i video.mp4 -t <duration> -q:v 2 -vf select="eq(pict_type\,PICT_TYPE_I)" -vsync 0 frame%03d.jpg
```