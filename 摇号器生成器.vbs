rem GB 2312
rem ����һ����������С��ָ����ֵ�������������vbs�ű�
rem ע����⸲�������ļ�

set ws = createobject("Wscript.Shell")
n = int(abs(inputbox("������������:" , "����ҡ����" , 100)))
n = n/n*n
fn = inputbox("�������ļ���:" & chr(13) & "ע����⸲�������ļ�" , "����ҡ����" , "ҡ��")
ws.run "cmd /a /q /c echo randomize : msgbox int(rnd*" & n & "+1) > " & fn & ".vbs"
msgbox fn & ".vbs" & chr(13) & "���뷶Χ: 1~" & n , 64 , "ҡ�����Ѵ���"