// 创建canvas节点
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
canvas.width = 512;
canvas.height = 480;
document.body.appendChild(canvas);


// 设置背景图片
var bgReady = false;
var bgImage = new Image();
bgImage.onload = function () {
    bgReady = true;
};
bgImage.src = "images/background.png";


// 人物图像
var daveReady = false;
var daveImage = new Image();
daveImage.onload = function () {
    daveReady = true;
};
daveImage.src = "images/dave.png";


// 恶魔图像
var monsterReady = false;
var monsterImage = new Image();
monsterImage.onload = function () {
    monsterReady = true;
};
monsterImage.src = "images/monster.png";


// 游戏对象
var dave = {
    //移速 单位为:  像素/秒
    speed: 256
};
// 恶魔对象
var monster = {};
// 捕获次数
var monstersCaught = 0;
//计时时间
var timeLeft = 30;

// 处理键盘控制
var keysDown = {};
addEventListener("keydown", function (e) {
    keysDown[e.keyCode] = true;
}, false);
addEventListener("keyup", function (e) {
    delete keysDown[e.keyCode];
}, false);


// 当玩家抓住怪物时重置游戏
var reset = function () {
    dave.x = canvas.width / 2;
    dave.y = canvas.height / 2;


    // 将怪物随机扔到屏幕上的某个地方
    monster.x = 32 + (Math.random() * (canvas.width - 64));
    monster.y = 32 + (Math.random() * (canvas.height - 64));
};


// 更新游戏对象
var update = function (modifier) {
    //如果时间还没有结束
    if (timeLeft > 0) {
        if (dave.y > 0 && 38 in keysDown) {
            //玩家在等待
            dave.y -= dave.speed * modifier;
        } else if (dave.y <= 0 && 38 in keysDown) {
            timeLeft = 0;
            daveImage.src = "images/dead.png";
        }
        if (dave.y < 448 && 40 in keysDown) {
            //玩家按住
            dave.y += dave.speed * modifier;
        } else if (dave.y >= 448 && 40 in keysDown) {
            //玩家按住
            timeLeft = 0;
            daveImage.src = "images/dead.png";
        }
        if (dave.x > 0 && 37 in keysDown) {
            //玩家保持左边
            dave.x -= dave.speed * modifier;
        } else if (dave.x <= 0 && 37 in keysDown) {
            timeLeft = 0;
            daveImage.src = "images/dead.png";
        }
        if (dave.x < 480 && 39 in keysDown) {
            // 玩家保持右边
            dave.x += dave.speed * modifier;
        } else if (dave.x >= 480 && 39 in keysDown) {
            timeLeft = 0;
            daveImage.src = "images/dead.png";

        }

        // 是否捕获怪物
        if (
            dave.x <= (monster.x + 32)
            && monster.x <= (dave.x + 32)
            && dave.y <= (monster.y + 32)
            && monster.y <= (dave.y + 32)
        ) {
            ++monstersCaught;
            reset();
        }
    } else {
        //清楚定时器
        clearInterval(timerGameMain);
        clearInterval(timerGame);


        if (!localStorage.highestScore)
            localStorage.highestScore = 0;

        if (localStorage.highestScore < monstersCaught) {
            localStorage.highestScore = monstersCaught;
            alert("恭喜你!你得分最高!!");
        }

        alert("游戏结束!\n在30秒内你捕获了 " + monstersCaught + "次怪物!");
    }
};


// Draw
var render = function () {
    if (bgReady) {
        ctx.drawImage(bgImage, 0, 0);
    }


    if (daveReady) {
        ctx.drawImage(daveImage, dave.x, dave.y);
    }


    if (monsterReady) {
        ctx.drawImage(monsterImage, monster.x, monster.y);
    }


    // 分数统计
    ctx.fillStyle = "rgb(250, 250, 250)";
    ctx.font = "24px Helvetica";
    ctx.textAlign = "left";
    ctx.textBaseline = "top";
    document.getElementById("dispScore").innerHTML = "<b> 最高分 :</b>" + localStorage.highestScore;
    document.getElementById("infoDiv").innerHTML = "<b>   捕获怪物次数:</b> " + monstersCaught + "    <b>剩余时间:</b> " + timeLeft + " 秒";

};


// 游戏循环
var main = function () {
    var now = Date.now();
    var delta = now - then;
    update(delta / 1000);
    render();
    then = now;
};

//时间限制
var timeRestrection = function () {
    timeLeft--;
}

// 开始游戏
reset();
var then = Date.now();
//尽可能快地执行
var timerGameMain = setInterval(main, 1);
var timerGame = setInterval(timeRestrection, 1000);


