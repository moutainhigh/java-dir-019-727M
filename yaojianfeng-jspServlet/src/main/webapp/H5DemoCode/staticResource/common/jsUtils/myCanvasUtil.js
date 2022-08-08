/**
 * 获取canvas上下文对象
 * @param canvasObj
 * @param type
 * @returns {*}
 */
function getContextObj(canvasObj, type) {
    return canvasObj.getContext(type);
}

/**
 * 校验具体是哪个参数非法,返回参数的索引值 参数不可以小于0
 * @returns {{flag: boolean, elementIndex: number}}
 */
function validRulerOfRequire() {
    const validResult = {flag: true,elementIndex:0};
    for (let index = 0; index < arguments.length; index++) {
        if ("" === arguments[index] || parseInt(arguments[index]) < 0||typeof arguments[index] === "undefined") {
            validResult.flag = false;
            validResult.elementIndex = index;
            break;
        }
    }
    return validResult;
}
/**
 * 校验具体是哪个参数非法,返回参数的索引值 参数可以小于0
 * @returns {{flag: boolean, elementIndex: number}}
 */
function translateRulerOf() {
    const validResult = {flag: true,elementIndex:0};
    for (let index = 0; index < arguments.length; index++) {
        if ("" === arguments[index] ||typeof arguments[index] === "undefined") {
            validResult.flag = false;
            validResult.elementIndex = index;
            break;
        }
    }
    return validResult;
}

/**
 * 校验参数是否完整
 * @returns {boolean}
 */
function validParamRequired() {
    let flag =  true;
    for (let index = 0; index < arguments.length; index++) {
        if ("" === arguments[index] || parseInt(arguments[index]) < 0||typeof arguments[index] === "undefined") {
            flag = false;
            break;
        }
    }
    return flag;
}

//重置画布
function clearCanvas(canvas_name){
    var elementById = document.getElementById(canvas_name);
    var ctx = elementById.getContext("2d");
    //只能清除矩形区域的内容 但是清除不了渐变效果
    ctx.clearRect(0,0,elementById.width,elementById.height);

    //通过重置画布的宽高来重置画布
    // elementById.width = elementById.width;
}

/**
 * 将字符串型的数字样式的参数,转化为数字型参数
 * @returns {number[]}
 */
function stringToNumber() {
    //声明一个数组 用来存放结果
    var numberArr =[arguments.length];
    for (let index = 0; index < arguments.length; index++) {
        //每当解析一个参数 都将其赋值给结果集的一个位置
      numberArr[index] = parseInt(arguments[index]);
    }
    return numberArr;
}

/**
 * 使用canvas画一条直线
 * @param ctx
 * @param x1
 * @param y1
 * @param x2
 * @param y2
 * @param color
 * @param width
 */
function drawLine(ctx,x1,y1,x2,y2,color,width){
    ctx.beginPath();
    ctx.moveTo(x1,y1);
    ctx.lineTo(x2,y2);
    ctx.strokeStyle = color;
    ctx.lineWidth = width;
    ctx.stroke();
    ctx.closePath();
}