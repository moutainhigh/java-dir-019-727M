function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    // 解决中文乱码 return (decodeURI(r[2]));
    if (r != null) { return (unescape(r[2])); } else {
        return null;
    }

}