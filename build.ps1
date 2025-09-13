if (($args.Length -gt 0) -And ($args[0] -eq "-v")) {$verb = "-v"} else {$verb = ""}
#echo $args, $verb
$dir = split-path $pwd -leaf

$pdb_path = "$dir.pdb"
if ([System.IO.File]::Exists($path)) {
    Remove-Item $pdb_path
}
$jack_files = Get-ChildItem -Path . -Filter *.jack
foreach ($j in $jack_files) {
    echo "Compiling $j"
    C:\work\hack\target\debug\jcomp.exe -i $j $verb
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}
echo "Linking"
C:\work\hack\target\debug\linker.exe -i . --lib C:\work\hack\os\ $verb
C:\work\hack\target\debug\vcomp.exe -i .\$dir.vm -a $verb
echo "Assembling for Hackem"
C:\work\hack\target\debug\assembler.exe -i .\$dir.asm -f hx -l .\$dir.lst -o .\$dir.hx $verb
echo "Assembling for CPUEmulator"
C:\work\hack\target\debug\assembler.exe -i .\$dir.asm -f b   -o .\$dir.hack $verb