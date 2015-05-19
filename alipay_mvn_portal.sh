#!/bin/bash
#-U: clean mobilesdk and -update
#-D: -Ddev=true

DEV=""
U=""
SKIP=""

#判断入参
while getopts "uUds" arg #选项后面的冒号表示该选项需要参数
do
    case $arg in
        u)
            #echo "u's arg:$OPTARG" #参数存在$OPTARG中
            #todo 判断M2_REPO是否为空
            if [ -z "$M2_REPO" ]
            then
                echo "delete mvn bundle mpass fail: env var M2_REPO not defined!"
            else
                echo "delete mvn bundle mpass(mobilesdk and mobilecommon)"
                rm -r $M2_REPO/repository/com/alipay/android/phone/mobilesdk
                rm -r $M2_REPO/repository/com/alipay/android/phone/mobilecommon
            fi
            U="-U"
            ;;
        U)
            U="-U"
            ;;
        d)
            DEV="-Ddev=true"
            ;;
        s)
            SKIP="-Dskipcheck=true"
            ;;
        ?)  #当有不认识的选项的时候arg为?
            echo -e "[help]"
            echo -e "-u: rm m2 repo mpass(mobilesdk and mobilecommon) and update snapchat(mvn -U)"
            echo -e "-U: mvn -U"
            echo -e "-s: -Dskipcheck-true"
            echo -e "-d: -Ddev=true"
            exit 1
            ;;
    esac
done

#$DEV = -Ddev=rue
#$U = -U

#显示命令
echo "-------------------------mvn clean install $DEV $U $SKIP-------------------------------------"
mvn clean install $DEV $U $SKIP
