rem GB 2312
rem 生成一个可以生成小于指定数值的随机正整数的vbs脚本
rem 注意避免覆盖现有文件

set ws = createobject("Wscript.Shell")
n = int(abs(inputbox("请输入最大号码:" , "生成摇号器" , 100)))
n = n/n*n
fn = inputbox("请输入文件名:" & chr(13) & "注意避免覆盖现有文件" , "生成摇号器" , "摇号")
ws.run "cmd /a /q /c echo randomize : msgbox int(rnd*" & n & "+1) > " & fn & ".vbs"
msgbox fn & ".vbs" & chr(13) & "号码范围: 1~" & n , 64 , "摇号器已创建"