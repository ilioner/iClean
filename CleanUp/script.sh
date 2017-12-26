#!/bin/bash
echo "1.========>    正在打开回收站！"
echo "\n"
cd ~/.Trash
echo "2.========>    正在进行授权!"
echo "\n"
chflags -R nouchg *
echo "3.========>    查看存在文件！"
echo "\n"
ls
cd ~/.Trash
echo "4.========>    即将删除，请稍后，删除时间可能根据文件大小有延迟！"
rm -rf *
echo "5.========>    删除程序执行完成！"
echo "\n"
echo "6.========>    再次查看存在文件！"
ls
echo "******** 若依然未完全删除，请手动尝试或者联系作者 *******"

#exit 5
