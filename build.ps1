$dir = split-path $pwd -leaf
$jack_files = Get-ChildItem -Path . -Filter *.jack
foreach ($j in $jack_files) {
    $j
    C:\work\hack\target\debug\jcomp.exe -i $j
}

C:\work\hack\target\debug\linker.exe -i . --lib C:\work\hack\os\ 
C:\work\hack\target\debug\vcomp.exe -i .\$dir.vm -a
C:\work\hack\target\debug\assembler.exe -i .\$dir.asm -f hx -l .\$dir.lst -o .\$dir.hx
C:\work\hack\target\debug\assembler.exe -i .\$dir.asm -f b -l .\$dir.lst -o .\$dir.hack