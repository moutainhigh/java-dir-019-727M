### 1. Button类
- 1.0.1 [流光溢彩](https://www.ocdeer.cn/ocdeer/ocdeer/btn1.html) btn-1 <br>
    单一类选择器，直接引用class="btn-1"

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <button type="button" class="btn-1">BUTTON</button>	
    </body>
</html>
```
- 1.0.2 [flash](http://www.ocdeer.cn/ocdeer/ocdeer/btn2.html) btn-2 <br>
    单一类选择器，直接引用class="btn-2"

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <button type="button" class="btn-2">BUTTON</button>	
    </body>
</html>
```
- 1.0.3 [波动效果](http://www.ocdeer.cn/ocdeer/ocdeer/btn3.html) btn-3 <br>
    复合样式，该样式下有两个分类，up，left，区别于波动起点位置及颜色不同，将css中始末位置互换可达成top和right效果。<br>
    首先引用样式<div class="btn-3"></div>，然后再div标签内引用具体样式分类up或者left

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <div class="btn-3">
            <button type="button" class="up">BUTTON</button>
        </div>
    </body>
</html>
```
- 1.0.4 [流光边框](http://www.ocdeer.cn/ocdeer/ocdeer/btn4.html) btn-4 <br>
    因为该样式是按钮边框样式，button标签自带按钮边框，所以该样式使用的是```<a>```标签而非```<button>```<br>
    边框样式使用```<span>```标签定义<br>
    引用```<a class="btn-4">```<br>
    调用四个边框样式<br>
```html
    <span></span>
    <span></span>
    <span></span>
    <span></span>
```

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <a class="btn-4">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            One Button
        </a>
    </body>
</html>
```
- 1.0.5 [折叠双层按钮](http://www.ocdeer.cn/ocdeer/ocdeer/btn5.html) btn-5 <br>
    该样式同样使用```<span>```规定,为双层按钮，左悬停为按钮1，右悬停为按钮2<br>
    该样式分为有边框和无边框两种，使用的是```<a>```标签为无边框样式，使用```<button>```则有边框<br>
    引用```<button class="btn-5">```或```<a class="btn-5">```
    调用样式
```html
    <span>This Button1</span>
    <span>This Button2</span>
```

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <button class="btn-5">
            <span>This Button1</span>
	    <span>This Button2</span>
	</button> 
    </body>
</html>
```
- 1.0.6 [流光边框2](https://www.ocdeer.cn/ocdeer/btn6/index6.html) btn-6 <br>
    边框样式，使用的是```<a>```标签<br>
    边框样式使用```<span>```标签定义<br>
    引用```<a href="#" class="btn-6">Button</a>```<br>
    共有三种样式<br>

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <a href="#" class="btn-6">Button</a>
	<a href="#" class="btn-6">Button</a>
	<a href="#" class="btn-6">Button</a>
    </body>
</html>
```
- 1.0.7 [边框变色](https://www.ocdeer.cn/ocdeer/btn7/index.html) btn-7 <br>
   复合样式，首先引用样式 ```<div class="container">``` ，然后再div标签内引用button样式```<button class="btn-7">```
```HTML
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/button.css" rel="stylesheet">
        <title></title>
    </head>
    <body>
        <div class="container">
            <button class="btn-7">
                <label>Button</label>
            </button>
        </div>
</body>
</html>
```
- 1.0.8 [边框绘制](https://www.ocdeer.cn/ocdeer/abutton/btn8.html) btn-8 <br>
    首先引用样式```<div class="btn-8">```<br>
    svg定义形状元素，rect()方法创建矩形<br>
```
<svg width="240" height="60">
                  <rect
                    class="rectangle"
                    width="240"
                    height="60"
                  />
                </svg>
```
调用button字体的样式```<div class="btn" >```
```HTML
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="css/button.css" rel="stylesheet">
		<title></title>
	</head>
	<body>
            <div class="btn-8">
                <svg width="240" height="60">
                  <rect
                    class="rectangle"
                    width="240"
                    height="60"
                  />
                </svg>
        <div class="btn" >
         Button
        </div>
        </div>
	</body>
</html>
```
- 1.0.9 [边框绘制2](https://www.ocdeer.cn/ocdeer/btn9/index.html) btn-9 <br>
    边框样式，使用```<a>```标签，边框样式使用```<span>```定义<br>
    引用```<a href="#" class="btn-9">```<br>
```
<a href="#" class="btn-9">
	<span>
				
	</span>
	button
</a>
```
```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>
    <body>
        <a href="#" class="btn-9">
	    <span>
				
	    </span>
	    button
	</a>
    </body>
</html>
```
- 1.1.0 [波动按钮](https://www.ocdeer.cn/ocdeer/btn10/index.html) btn-10 <br>
鼠标悬停按钮产生波动效果。
单一类选择器，直接引用class="btn-10"

```HTML
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/button.css"/>
    </head>
    <body>
        <button class="btn-10">Button</button>
    </body>
</html>
```
- 1.1.1 [故障风格](https://www.ocdeer.cn/ocdeer/btn11/index.html) btn-10 <br>
故障风按钮，引用第三方库，加载可能会比较慢
单一类选择器，直接引用class="btn-11"

```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.font.im/css?family=Do+Hyeon" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/button.css"/>
</head>
<body>
    <div class="btn-11">Button</div>
</body>
</html>
```
- 1.1.2 [绘制边框-流光](https://www.ocdeer.cn/ocdeer/btn12/index.html) btn-12 <br>
```<span>```定义边框样式<br>
引用```<a class="btn-12" target="blank">```<br>

```
<a class="btn-12" target="blank">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
        night
 </a>
```
```HTML
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/button.css"/>
    </head>
    <body>
        <a class="btn-12" target="blank">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            night
        </a>
</body>
</html>
```

### 2. text类
- 2.0.1 [收缩扩展](http://www.ocdeer.cn/ocdeer/ocdeer/text1.html) text-1 <br>
    引用样式class="btn-1"<br>
    该样式默认状态下缩进状态，鼠标悬停时触发扩展效果，显示全文。<br>
    默认状态样式直接规定标签选择器，所以我们直接使用span标签即为默认样式，```<span>W</span>```
    
```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/text.css" />
    </head>
    <body>
	<div class="text-1">
	    <span>W</span>
	    <span class="s">e</span>
	    <span class="s">l</span>
	    <span class="s">c</span>
	    <span class="s">o</span>
	    <span class="s">m</span>
	    <span class="s">e</span>

	    <span>O</span>
	    <span class="s">m</span>
	    <span class="s">n</span>
	    <span class="s">i</span>
	    <span class="s">p</span>
	    <span class="s">o</span>
	    <span class="s">t</span>
	    <span class="s">e</span>
	    <span class="s">n</span>
	    <span class="s">t</span>

	    <span>C</span>
	    <span class="s">o</span>
	    <span class="s">l</span>
	    <span class="s">o</span>
	    <span class="s">r</span>

	    <span>D</span>
	    <span class="s">e</span>
	    <span class="s">e</span>
	    <span class="s">r</span>
        </div>
    </body>
</html>
```
- 2.0.2 [聚光灯](http://www.ocdeer.cn/ocdeer/ocdeer/text2.html) text-2 <br>
    引用class="text-2"<br>
    但在实际应用同场景中使用较为麻烦，需要调节文字内容和大小，聚光点的大小等。

    该样式的设计思路并非灯光照耀在文字上显现彩色光芒，而是提前规定好文字（这里是指背景绘制区域，为了方便大家理解称暂称文字）的色彩样式并设置镂空效果，然后生成一个圆形可视区域在文字上来回滚动播放，圆形可视区域所在的地方文字不透明，显示为我们规定好的文字色彩样式。而非圆形可视区域的文字表现为透明。

    修改文字内容：content: 'ocdeer';

    修改文字大小：font-size: 8rem; 

    修改文字默认状态下颜色：.text-2{color: #FFFFFF;}

    开发思路：

    首先设置文字颜色透明：color: transparent;

    绘制背景区域：background-image: linear-gradient(to right,#c23616,#192a56,#00d2d3,yellow,#6d214f,#2e86de,#4cd137,#e84118);<br><br>

    当值为text 的时候，代表设置了文字的镂空效果：background-clip: text;

    创建元素的可显示区域，circle表示创建了圆形，100px表示圆形的直径,0%和50%表示圆形的圆心，圆形的直径和圆形的圆心利用at关键字隔开：clip-path: circle(100px at 0% 50%);

infinite 无限次播放：animation: move 5s infinite;

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/text.css" />
    </head>
    <body>
        <h1 class="text-2">ocdeer</h1>	
    </body>
</html>
```
- 2.0.3 [文字分裂](https://www.ocdeer.cn/ocdeer/text3/text3.html) text-3 <br>

    首先引用样式：class="text-3"

    引用text-3下的a类型class="a"（这里是类选择器a，不是a标签）

    ```<a>```标签添加链接

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/text.css" />
    </head>
    <body>
        <section>
            <div class="text-3">
                <div class="a">Welcome</div>
                <div class="a">Welcome</div>
                <a href="#">馒头拿来摸摸</a>
            </div>
        </section>
    </body>
</html>
```
- 2.0.4 [炫光文字](http://www.ocdeer.cn/ocdeer/ocdeer/text4.html) text-4 <br>

    首先引用样式：class="text-4"

    使用```<span>```标签规定样式，标签内为悬停炫光样式，不被包裹的则为原有样式


```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/text.css" />
    </head>
    <body>
        <h2 class="text-4"><span>Welcome</span></h2>
    </body>
</html>
```
- 2.0.5 [水波](https://www.ocdeer.cn/ocdeer/text5/index.html) text-5 <br>

双层span，底层绘制文本区域，上层实现波动效果。

首先引用第一层text-5-1 class="text-5-1"实现文本区域的绘制，然后引用第二层实现效果。

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/text.css" />
    </head>
    <body>
        <span class="span text-5-1">OCDeer</span>
	<span class="span text-5-2">OCDeer</span>
    </body>
</html>
```
### 3. input类
- 3.0.1 [输入框-绘制](https://www.ocdeer.cn/ocdeer/input/input1.html) input-1 <br>

    首先引用样式：```<div class="input-1">```
    
    分别引用边框的上下左右四个边框的对应样式
```
<input type="text" />
<span class="left"></span>
<span class="right"></span>
<span class="top"></span>
<span class="bottom"></span>
```

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/input.css" />
    </head>
    <body>
        <div class="input-1">
	    <input type="text" />
	    <span class="left"></span>
	    <span class="right"></span>
	    <span class="top"></span>
	    <span class="bottom"></span>
	</div>
    </body>
</html>
```
- 3.0.2 [搜索框](https://www.ocdeer.cn/ocdeer/input/input2.html) input-2 <br>

    首先引用样式：```<div class="input-2">```
    
    引用input样式```<input type="text" class="b">```

    使用```<a>```标签绘制悬停时高亮圆圈```<a href="#" class="c">```
    
    该样式的图标为矢量图```<img src="img/input.png" style="width: 30px;">```,矢量图可从阿里巴巴矢量库下载

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" type="text/css" href="css/input.css" />
    </head>
    <body>
        <div class="input-2">
            <input type="text" class="b">
            <a href="#" class="c">
                <img src="img/input.png" style="width: 30px;">
            </a>
    </div>
    </body>
</html>
```
- 3.0.3 [搜索框-点击扩展](https://www.ocdeer.cn/ocdeer/input/input3.html) input-3 <br>

    创建一个盒子：```<div class="middle">```
    
    创建form表单```<form action="index.html" class="search-box" method="post">```，获取数据用

    输入框样式```<input type="text" class="input-3" name="" valur="">```
    
    按钮样式```<button type="button" class="input3-btn" name="button"></button>```，点击前以及点击后的叉号

    因为有点击动作，所以需要添加js点击事件

```js
<script type="text/javascript">
    $(".input3-btn").on("click",function() {
      $(".input-3").toggleClass("inclicked");
      $(".input3-btn").toggleClass("close");
    });
</script>
```

```html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>可展开搜索框</title>
    <link rel="stylesheet" href="css/input.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="middle">
      <form action="index.html" class="search-box" method="post">
        <input type="text" class="input-3" name="" valur="" id="val">
        <button type="button" class="input3-btn" name="button"></button>
      </form>
    </div>

  <script type="text/javascript">
    $(".input3-btn").on("click",function() {
      $(".input-3").toggleClass("inclicked");
      $(".input3-btn").toggleClass("close").on("click",function(){
          $(val).val("")
	  });
    });
  </script>
  </body>
</html>

```
> 不引用JQuery的方法
```html
<!-- 由：A-Normal-User 提供-->
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>可展开搜索框</title>
    <link rel="stylesheet" href="css/input.css">
</head>

<body>
    <div class="middle">
        <form action="index.html" class="search-box" method="post">
            <input type="text" class="input-3" name="" valur="">
            <button type="button" class="input3-btn" name="button"></button>
        </form>
    </div>

    <script type="text/javascript">
        document.querySelector('.input3-btn').addEventListener("click", function () {
            if (document.querySelector('.input-3').className.indexOf("inclicked") == -1) {
                document.querySelector(".input-3").className = "input-3 inclicked";
                document.querySelector(".input3-btn").className = "input3-btn close";
            }
            else {
                document.querySelector(".input-3").className = "input-3";
                document.querySelector(".input3-btn").className = "input3-btn";
            }
        })
    </script>
</body>
</html>
```
### 3. Navs类
- 3.0.1 [导航栏-竖式](https://www.ocdeer.cn/ocdeer/navs/navs-1/index.html#) navs-1 <br>
分别绘制展开前和展开后的盒子大小，展开前展开后class="navs-1"，展开后class="navs-1 active"  
同时，箭头跟随展开前后变化，展开前">"，展开后"<"，类选择器分别为class="toggle"和class="toggle active"

图标以列表标签的方式置于盒子内  
```html
<li>
    <a href="#">
        <span class="icon"><i class="fa fa-home"></i></span>
        <span class="title">Home</span>
    </a>
</li>
```  
点击事件，扩展回收
```js
<script>
     const navigation = document.querySelector('.navigation');
     document.querySelector('.toggle').onclick = function(){
        this.classList.toggle('active');
        navigation.classList.toggle('active');
    }
</script>
```  
注意引用font的图标```<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
		
        <div class="navs-1">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-home"></i></span>
                        <span class="title">Home</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-user"></i></span>
                        <span class="title">User</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-comment"></i></span>
                        <span class="title">News</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-question-circle"></i></span>
                        <span class="title">Help</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-cog"></i></span>
                        <span class="title">Setting</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-lock"></i></span>
                        <span class="title">Password</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-sign-out"></i></span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="toggle"></div>
    </div>
    <script>
        const navigation = document.querySelector('.navigation');
        document.querySelector('.toggle').onclick = function(){
            this.classList.toggle('active');
            navigation.classList.toggle('active');
        }
    </script>
</body>
</html>
```