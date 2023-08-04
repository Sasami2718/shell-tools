rem CHCP 65001
@echo off
rem ==================================================
rem 用于定时清空指定文件夹中的过时文件,
rem 参数注释:
rem set loop_second=300 设置循环检测文件夹的时间(秒)
rem $temp_dir = 'D:\temp\' 设置检测文件夹路径
rem $minute_before_now = 10 设置文件过时的时间(分钟), 如:设置10, 则删除文件夹中最后修改时间为10分钟之前的所有文件和文件夹
rem ==================================================
@echo on
set loop_second=300
:loop
PowerShell -Command "$temp_dir = 'D:\temp\'; $minute_before_now = 10; Get-ChildItem -Path $temp_dir | ForEach-Object -Process {if ($(new-timespan $_.LastWriteTime $(get-date)).totalminutes -gt $minute_before_now) {Remove-Item $temp_dir$_ -Recurse}}"

timeout /t %loop_second%
goto loop
pause