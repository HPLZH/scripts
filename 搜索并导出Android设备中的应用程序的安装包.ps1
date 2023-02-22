# GB 2312
# 导出包名含有指定字符串的Android应用程序的安装包
# 导出路径为 apk/{0}/
# {0}为一个自然数
# 需要adb并提前连接好设备

$search = """" + (Read-Host "搜索字符串") + """"
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
    Write-Progress -Activity "搜索安装包路径" -CurrentOperation $pkgs[$i] -PercentComplete (100*$i/$pkgs.Count)
    $pathout = adb shell pm path $pkgs[$i]
    $paths[$i] = $pathout.Split(":")[1]
}
Write-Progress -Activity "搜索安装包路径" -Completed
for ($i = 0; $i -lt $paths.Count; $i++) {
    Write-Progress -Activity "导出安装包" -CurrentOperation $pkgs[$i] -PercentComplete (100 * $i / $pkgs.Count)
    adb pull $paths[$i] (New-Item -Path $outp -Name $pkgs[$i] -ItemType Directory).FullName
}
Write-Progress -Activity "导出安装包" -Completed
