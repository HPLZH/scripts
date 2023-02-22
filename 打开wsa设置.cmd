rem GB 2312
rem 打开WSA的设置应用，需要adb
rem 你需要先启动WSA，并且允许调试

adb connect 127.0.0.1:58526
adb shell am start -n com.android.settings/.Settings