# Get path of folder to rename files in
$folder=$args[0]
# write-host "$folder"

# Get confirmation from user to rename files
$confirmation = read-host "Are you sure you want to rename the files in $folder? (type 'yes' to continue)"
if ($confirmation -ne 'yes') {
    Write-Host "Roger that. Closing in 2 seconds..."
    Start-Sleep 2
    Exit
}

# Get filename header
$header = read-host "What header would you like your files to start with?"

# Get Count Start
$countStart = read-host "What number would you like the count to start on?"

# $folderPath = $folder
# $folderPath = "E:\images"
$files = Get-ChildItem -Path $folder

$counter = [int]$countStart
foreach ($file in $files) {
    $newName = "$header-$counter" + $file.Extension
    Rename-Item -Path $file.FullName -NewName $newName
    $counter++
}

# Finish Response
write-host "Finished Renaming Files"
Start-Sleep 1

write-host "Closing in 3 Seconds"
Start-Sleep 3