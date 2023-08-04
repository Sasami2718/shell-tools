# 计算文件的MD5
# 并将结果转换成小写


(Get-FileHash C:\Windows\notepad.exe -Algorithm MD5).hash.ToLower()