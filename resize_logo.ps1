Add-Type -AssemblyName System.Drawing

$sourcePath = "e:\Antigravity\HTwebsite\assets\HT Logo.png"
$destPath = "e:\Antigravity\HTwebsite\assets\logo_small.png"

$image = [System.Drawing.Image]::FromFile($sourcePath)
# Calculate new dimensions (width 300px)
$newWidth = 300
$newHeight = [int]($image.Height * ($newWidth / $image.Width))

$bitmap = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
$graph = [System.Drawing.Graphics]::FromImage($bitmap)
$graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

$graph.DrawImage($image, 0, 0, $newWidth, $newHeight)

$bitmap.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)

$image.Dispose()
$bitmap.Dispose()
$graph.Dispose()

Write-Host "Resized image saved to $destPath"
