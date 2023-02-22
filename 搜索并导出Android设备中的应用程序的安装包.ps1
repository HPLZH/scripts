# GB 2312
# ������������ָ���ַ�����AndroidӦ�ó���İ�װ��
# ����·��Ϊ apk/{0}/
# {0}Ϊһ����Ȼ��
# ��Ҫadb����ǰ���Ӻ��豸

$search = """" + (Read-Host "�����ַ���") + """"
if (!(Test-Path "apks")) {
    New-Item "apks" -ItemType Directory
}
$index = 0
while (Test-Path ("apks/" + $index)) {
    $index++
} 
$outp = New-Item -Path "apks/" -Name $index -ItemType Directory
Write-Output ("Output path: " + $outp.FullName)
$pkgout = adb shell pm list packages | find.exe $search
$pkgout = $pkgout.Split()
$pkgs = 1..$pkgout.Count
for ($i = 0; $i -lt $pkgout.Count; $i++) {
    $pkgs[$i] = $pkgout[$i].Split(":")[1] 
}
$paths = 1..$pkgout.Count
for ($i = 0; $i -lt $pkgs.Count; $i++) {
    Write-Progress -Activity "������װ��·��" -CurrentOperation $pkgs[$i] -PercentComplete (100*$i/$pkgs.Count)
    $pathout = adb shell pm path $pkgs[$i]
    $paths[$i] = $pathout.Split(":")[1]
}
Write-Progress -Activity "������װ��·��" -Completed
for ($i = 0; $i -lt $paths.Count; $i++) {
    Write-Progress -Activity "������װ��" -CurrentOperation $pkgs[$i] -PercentComplete (100 * $i / $pkgs.Count)
    adb pull $paths[$i] (New-Item -Path $outp -Name $pkgs[$i] -ItemType Directory).FullName
}
Write-Progress -Activity "������װ��" -Completed
