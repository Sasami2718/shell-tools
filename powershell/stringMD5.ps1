# 计算 inputStr 的 MD5
# 并且去除运算结果中的短线- , 并且将所有字符变成小写

$inputStr = "key=123456789"

$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider

$utf8 = New-Object -TypeName System.Text.UTF8Encoding
[System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($inputStr))).replace('-','').ToLower()