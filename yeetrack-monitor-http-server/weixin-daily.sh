currentDir=$(cd "$(dirname "$0")"; pwd)
/home/work/xuemengwang/jdk1.7.0_67/bin/java -jar ${currentDir}/weixin-alert.jar  "现在时刻，`date +"%Y年%m月%d日, %A, %H:%M"`, 报警账号正常"
