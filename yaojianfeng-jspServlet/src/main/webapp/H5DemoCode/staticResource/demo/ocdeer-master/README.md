<div align="center">
    <img width="150" height="150"  src="https://www.ocdeer.cn/show/logo/426.png" > 
</div>
<h2 align="center">OCDeer - 让作品遇见全世界</h2>
<div align="center">

![](https://img.shields.io/badge/Language-html+css-red) ![](https://img.shields.io/badge/Version-0.2.0-blue) ![](https://img.shields.io/badge/QQ-1691469549-green) [![](https://img.shields.io/badge/展示网站-show.ocdeer.cn-yellow)](https://show.ocdeer.cn/)

</div>

---

## 关于OCDeer  
OCDeer提供全应用场景的动效css样式，帮助开发者跳过复杂的调试过程，直接在项目引入样式即可，无须浪费太多的精力在界面设计，以腾出更多时间去专注于页面逻辑和服务功能。  

## 功能分类  
按库功能分为两类，第一类为定式(OCDeer)，所有样式和动效都设计搭配好并写死固定，适合引入即用。第二类为动式(OneClass)，由[zwyboom](https://gitee.com/zwyboom)提供,利用伪类：before和：after在保证原有的样式不改变的情况下增加css动态效果，简而言之我们只规定了动效而未规定样式，组件样式仍由开发者决定，相比第一种更加灵活。  

## 使用说明  
#### 1.OCDeer
下载对应css库并引入，对照帮助文档，在HTML中直接使用class引用对应样式。
<p style="color: #DC143C;">建议对照wiki使用</p>  

#### 2.OneClass
下载oneClass.css并引入，在div中引用对应动效的class。
## 软件架构  
#### 1. OCDeer  
**1. 按结构划分为样式整合包和css库，按自身需求自行取用**  
**2. button.css 按钮类css库**   
**3. Text.css 文本类css库**  
**4. Input.css 输入搜索框类css库**  
**5. Card.css 卡片类css库**  
**6. Films.css 动画类css库**  
**7. Forms.css 表单类css库**  
**8. Navs.css 导航栏类css库**  
**9. Pagination.css 分页符框类css库**  
**10. Modal.css 输入搜索框类css库**  

#### 2. OneClass
暂未细分

## 帮助文档  
#### 1.OCDeer  

导入css库后,直接在HTML中引用对应的类选择器。

```html
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

上例为最简单的一种，还有多选择器的样式，例如[btn-3 波动按钮](https://www.ocdeer.cn/ocdeer/ocdeer/btn3.html)。  
该样式下有两个分类，up，left，区别于波动起点位置及颜色不同。  
首先引用该选择器class="btn-3"  
然后引用选择器下的具体样式分类class="up"或class="left"  
```html
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
建议使用者对照详细文档使用该库，地址：  
OCDeer详细文档地址：[OCDeer.md](https://gitee.com/mtnlmm/ocdeer/blob/master/OCDeer.md)  
WiKi地址：[wiki](https://gitee.com/mtnlmm/ocdeer/wikis)
#### 2.OneClass  
OneClass全部为单一类选择器，直接在HTML中引用clss即可。  
```html
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
OneClass详细文档地址：[OneClass.md](https://gitee.com/mtnlmm/ocdeer/blob/master/OneClass.md)  

## 样式展示  
#### 1.OCDeer  
样式相册地址：[https://show.ocdeer.cn/](https://show.ocdeer.cn/)  
GitHub地址：[https://github.com/1691469549/OCDeer.css](https://github.com/1691469549/OCDeer.css)  
站内不方便放置太多图片，以表格形式跳转到外部实例。  
 **1. Button**  
| 序号  | 类选择器名  | 外部实例  |
|---|---|---|
| 1  | btn-1  | [流光溢彩](https://www.ocdeer.cn/ocdeer/ocdeer/btn1.html)  |
| 2  | btn-2  | [flash](http://www.ocdeer.cn/ocdeer/ocdeer/btn2.html)  |
| 3  | btn-3  | [波动效果](http://www.ocdeer.cn/ocdeer/ocdeer/btn3.html)  |
| 4  | btn-4  | [流光边框](http://www.ocdeer.cn/ocdeer/ocdeer/btn4.html)  |
| 5  | btn-5  | [折叠双层按钮](http://www.ocdeer.cn/ocdeer/ocdeer/btn5.html)  |
| 6  | btn-6  | [流光边框2](https://www.ocdeer.cn/ocdeer/btn6/index6.html)  |
| 7  | btn-7  | [边框变色](https://www.ocdeer.cn/ocdeer/btn7/index.html)  |
| 8  | btn-8  | [边框绘制](https://www.ocdeer.cn/ocdeer/abutton/btn8.html)  |
| 9  | btn-9  | [边框绘制2](https://www.ocdeer.cn/ocdeer/btn9/index.html)  |
| 10  | btn-10  | [波动按钮](https://www.ocdeer.cn/ocdeer/btn10/index.html)  |
| 11  | btn-11  | [故障风格](https://www.ocdeer.cn/ocdeer/btn11/index.html)  |
| 12  | btn-12  | [绘制边框-流光](https://www.ocdeer.cn/ocdeer/btn12/index.html)  |  

 **2.Text**  
| 序号  | 类选择器名  | 外部实例  |
|---|---|---|
| 1  | text-1  | [收缩扩展](http://www.ocdeer.cn/ocdeer/ocdeer/text1.html)  |
| 2  | text-2  | [聚光灯](http://www.ocdeer.cn/ocdeer/ocdeer/text2.html)  |
| 3  | text-3  | [文字分裂](https://www.ocdeer.cn/ocdeer/text3/text3.html)  |
| 4  | text-4  | [炫光文字](http://www.ocdeer.cn/ocdeer/ocdeer/text4.html)  |
| 5  | text-5  | [水波](https://www.ocdeer.cn/ocdeer/text5/index.html)  |  

 **3.Input**  
| 序号  | 类选择器名  | 外部实例  |
|---|---|---|
| 1  | input-1  | [输入框-绘制](https://www.ocdeer.cn/ocdeer/input/input1.html)  |
| 2  | input-2  | [搜索框-悬停扩展](https://www.ocdeer.cn/ocdeer/input/input2.html)  |
| 3  | input-3  | [搜索框-点击扩展](https://www.ocdeer.cn/ocdeer/input/input3.html)  |

#### 2.OneClass  
OneClass独立仓库地址：[https://gitee.com/zwyboom/zwyCss](https://gitee.com/zwyboom/zwyCss)  
OneClass在线预览地址：[https://zwyboom.gitee.io/zwycss](https://zwyboom.gitee.io/zwycss)  
GitHub地址：[https://github.com/seventhcode/oneClass](https://github.com/seventhcode/oneClass)  
 



