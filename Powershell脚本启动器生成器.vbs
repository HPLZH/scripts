rem GB 2312
rem ����һ��������������ָ����Powershell�ű���vbs�ű�
rem ע����⸲�������ļ�

set ws = createobject("Wscript.Shell")
fn = inputbox("�������ļ���:" & chr(13) & "��Ҫ����׺�� (һ��Ϊ .ps1)")
if len(fn) > 0 then
    if left(fn,1) <> "/" and left(fn,1) <> "\" and mid(fn , 2 , 1) <> ":" then fn = "./" + fn
    ws.run "cmd /a /q /c echo @powershell -ExecutionPolicy RemoteSigned " & chr(34) & fn & chr(34) & " > " & fn & ".cmd"
    msgbox fn & ".cmd" , 64 , "�������Ѵ���"
end if