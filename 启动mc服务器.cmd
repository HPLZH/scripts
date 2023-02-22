rem GB 2312
rem 启动 Minecraft JE 服务器
rem 启动命令是由Mojang提供的，可以在服务器软件下载页面找到
rem 你需要先下载好服务器软件
rem 下载页面: https://www.minecraft.net/zh-hans/download/server

rem 初次使用
rem 首先安装好Java并准备好服务器软件 (server.jar)
rem 然后将此文件与server.jar置于同一目录下
rem 然后双击运行此文件，这时程序会在当前目录下生成一些文件然后退出
rem 找到eula.txt，将最后一行的false改成true并保存
rem 然后再次双击运行此文件，这时服务器会正常启动并且生成一个新世界
rem 以后双击运行此文件即可启动服务器

java -Xmx1024M -Xms1024M -jar server.jar nogui