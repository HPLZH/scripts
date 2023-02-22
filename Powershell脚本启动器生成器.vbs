rem GB 2312
rem 生成一个可以用于启动指定的Powershell脚本的vbs脚本
rem 注意避免覆盖现有文件

set ws = createobject("Wscript.Shell")
fn = inputbox("请输入文件名:" & chr(13) & "需要带后缀名 (一般为 .ps1)")
if len(fn) > 0 then
    if left(fn,1) <> "/" and left(fn,1) <> "\" and mid(fn , 2 , 1) <> ":" then fn = "./" + fn
    ws.run "cmd /a /q /c echo @powershell -ExecutionPolicy RemoteSigned " & chr(34) & fn & chr(34) & " > " & fn & ".cmd"
    msgbox fn & ".cmd" , 64 , "启动器已创建"
end if