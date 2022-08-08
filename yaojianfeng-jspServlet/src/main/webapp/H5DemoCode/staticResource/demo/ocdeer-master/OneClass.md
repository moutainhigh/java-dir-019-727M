- 1.0.1 浮动效果 zwyFly <br>
    单一类选择器，直接引用class="zwyFly"

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
         <div class="bubble zwyFly">气泡</div>
    </body>
    <style>
        .bubble{
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #007AFF;
            color: white;
            text-align: center;
            line-height: 60px;
        }
    </style>
</html>
```
- 1.0.2 气泡点击效果 zwyHover2<br>
    单一类选择器，直接引用class="zwyHover2"

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
         <!-- count:Number || infinite; -->
        <div class="bubble zwyHover3" style="--count:infinite;">气泡</div>
    </body>
    <style>
        .bubble{
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #007AFF;
            color: white;
            text-align: center;
            line-height: 60px;
        }
    </style>
</html>
```
- 1.0.3摇晃效果 zwyShake <br>

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
      <!-- transform-origin: top;top:上基准摇晃 bottom:下基准摇晃 -->
      <img class="zwyShake" style="transform-origin: center bottom;width: 40px;height: 40px;" src="static/logo.png" />
    </body>
    <style>
        
    </style>
</html>
```
- 1.0.4 缩小点击效果 zwyHover1 <br>
```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
       <!-- count:Number || infinite -->
       <div class="btn zwyHover1" style="--count:infinite;">按钮</div>
    </body>
    <style>
         .btn{	
			min-width: 100px;
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 0 20px;
			height: 40px;
			border-radius: 40px;
			color: white;
            background-color: #007AFF;
  	      }
    </style>
</html>
```
- 1.0.5 添加黑色波纹 zwyHot <br>
```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
        <!-- color:rgba(0, 0, 0, 0.15); 黑色    color:rgba(255, 255, 255, 0.6); 白色 -->
       	<div class="bubble zwyHot" style="--color:rgba(0, 0, 0, 0.15);"></div>
    </body>
    <style>
         	.bubble{
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #007AFF;
            color: white;
            text-align: center;
            line-height: 60px;
        }
    </style>
</html>
```
- 1.0.6 箭头 zwyChevron <br>

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
        <div class="chevronBox" style="transform: rotate(0deg);">
            <div style="animation-delay:0s" class="zwyChevron" ></div>
            <div style="animation-delay:1s" class="zwyChevron" ></div>
            <div style="animation-delay:2s" class="zwyChevron" ></div>
            <!-- <div v-for="(item,index) in 3" :style="{'animation-delay':`${index}s`}" class="zwyChevron" :key="index" ></div> -->
       </div>
    </body>
    <style>
	.chevronBox{
		width: 80px;
		height: 80px;
		display: flex;
		align-items: flex-start;
		justify-content: center;
	}
    </style>
</html>
```
- 1.0.7 直播 zwyLive <br>
```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
		<div style="width: 50px;height: 50px;display: flex;align-items: center;justify-content: center;">
        		<div class="zwyLive" style="--color:red;"></div>
        </div>
    </body>
    <style>
	.chevronBox{
		width: 80px;
		height: 80px;
		display: flex;
		align-items: flex-start;
		justify-content: center;
	}
    </style>
</html>
```
- 1.0.8 直播头像 zwyPortrait zwyBeat <br>
```
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
		<div class="zwyPortrait" style="--color:#ff0081;">
        	<div class="bubble zwyBeat">气泡</div>
        </div>
    </body>
    <style>

    </style>
</html>
```
- 1.0.9 流光效果2 zwyHeightSec <br>
```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
		<div class="btn zwyHeightSec">流光2</div>
    </body>
    <style>

    </style>
</html>
```
- 1.1.0 红包展示 zwyMidSkewShow <br>

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
        <!-- count:Number || infinite || both; -->
		<div class="zwyMidSkewShow" style="
                    --count:infinite;--speed:1s;
        			width: 50px;height: 80px;background-color: red;border-radius: 5px;"
        ></div>
    </body>
    <style>

    </style>
</html>
```
- 1.1.1 按钮动画 zwyDot <br>

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
		<div class="btn" style="position: relative;width: 160px;">
        	<div class="zwyDot" style="--left:0%;--right:400%;--bg:#000000;"></div>
        粒子</div>
    </body>
    <style>
        .btn{	
                min-width: 100px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0 20px;
                height: 40px;
                border-radius: 40px;
                color: white;
                background-color: #007AFF;
        }
    </style>
</html>
```
- 1.1.2 提示点击效果 zwyJittery1 <br>

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/oneClass.css" />
    </head>
    <body>
		<div class="btn zwyJittery1" style="--count:infinite;">按钮</div>
    </body>
    <style>
  		.btn{	
                min-width: 100px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0 20px;
                height: 40px;
                border-radius: 40px;
                color: white;
                background-color: #007AFF;
        }
    </style>
</html>
```
### 图片示例

   <img height="500" src="https://img-cdn-aliyun.dcloud.net.cn/stream/plugin_screens/a08f4930-a6da-11ea-be2a-c777b2fde1a6_0.jpg?v=1625815060" style="zoom:25%;" />

   <img height="500" src="https://img-cdn-aliyun.dcloud.net.cn/stream/plugin_screens/a08f4930-a6da-11ea-be2a-c777b2fde1a6_1.jpg?v=1625815066" style="zoom:25%;" />


