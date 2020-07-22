#powershell -ExecutionPolicy ByPass -File duh.ps1

ForEach ($i in (Get-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\*  -ErrorAction SilentlyContinue -Name 'URL Protocol').PSChildName) {
$RegPath = 'Registry::HKEY_CLASSES_ROOT\'+$i+'\shell\open\command'
$p = (Get-ItemProperty -Path  $RegPath -ErrorAction SilentlyContinue).'(default)'
if ($p)
{
	Write-Output "$i`t$p" | Format-Table -Auto
}
}
