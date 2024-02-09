if (! ( Get-LocalGroup -Name g-usuarios -ErrorAction SilentlyContinue )) {
    New-LocalGroup -Name g-usuarios
}
$usuarios = Get-LocalUser
foreach ($user in $usuarios) {
    Add-LocalGroupMember -Group g-usuarios -Member $user
}