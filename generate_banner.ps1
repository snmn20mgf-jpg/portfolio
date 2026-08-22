Add-Type -AssemblyName System.Drawing

$width = 1584
$height = 396
$bmp = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

# 1. Base Background Gradient (Crisp Slate-50 to White)
$rect = New-Object System.Drawing.Rectangle 0, 0, $width, $height
$c1 = [System.Drawing.Color]::FromArgb(255, 248, 250, 252) # #f8fafc
$c2 = [System.Drawing.Color]::FromArgb(255, 255, 255, 255) # #ffffff
$bgBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, $c1, $c2, 35.0
$g.FillRectangle($bgBrush, $rect)

# 2. Modern Subtle Grid Pattern
$gridPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(20, 16, 185, 129), 1)
for ($x = 0; $x -lt $width; $x += 44) {
    $g.DrawLine($gridPen, $x, 0, $x, $height)
}
for ($y = 0; $y -lt $height; $y += 44) {
    $g.DrawLine($gridPen, 0, $y, $width, $y)
}

# 3. Soft Ambient Glows
$glowPath = New-Object System.Drawing.Drawing2D.GraphicsPath
$glowPath.AddEllipse($width - 500, -150, 600, 500)
$pbg = New-Object System.Drawing.Drawing2D.PathGradientBrush $glowPath
$pbg.CenterColor = [System.Drawing.Color]::FromArgb(35, 16, 185, 129)
$pbg.SurroundColors = @([System.Drawing.Color]::FromArgb(0, 255, 255, 255))
$g.FillPath($pbg, $glowPath)

# 4. Top Accent Emerald Border
$topPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 16, 185, 129), 5)
$g.DrawLine($topPen, 0, 2, $width, 2)

# Helper function to draw rounded rectangles
function Draw-RoundedRectangle($graphics, $pen, $brush, $x, $y, $w, $h, $radius) {
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $diameter = $radius * 2
    $path.AddArc($x, $y, $diameter, $diameter, 180, 90)
    $path.AddArc($x + $w - $diameter, $y, $diameter, $diameter, 270, 90)
    $path.AddArc($x + $w - $diameter, $y + $h - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($x, $y + $h - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    if ($brush) { $graphics.FillPath($brush, $path) }
    if ($pen) { $graphics.DrawPath($pen, $path) }
}

# Fonts
$fontFamily = "Segoe UI"
$fKicker = New-Object System.Drawing.Font($fontFamily, 13, [System.Drawing.FontStyle]::Bold)
$fTitle = New-Object System.Drawing.Font($fontFamily, 36, [System.Drawing.FontStyle]::Bold)
$fBadge = New-Object System.Drawing.Font($fontFamily, 13, [System.Drawing.FontStyle]::Bold)
$fFootnote = New-Object System.Drawing.Font($fontFamily, 12, [System.Drawing.FontStyle]::Bold)

# Brushes
$bDark = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 15, 23, 42))       # #0f172a
$bGreen = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 5, 150, 105))    # #059669
$bGreenText = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 6, 95, 70)) # #065f46
$bMuted = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 71, 85, 105))   # #475569
$bBadgeBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(245, 255, 255, 255))
$pBadge = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 167, 243, 208), 2.0)

# Placement coordinates (X = 460 leaves left area for user profile picture)
$startX = 460
$curY = 55

# Kicker
$g.DrawString("LEONARDO LEVI JOAQUIN COLORADO", $fKicker, $bGreen, $startX, $curY)
$curY += 32

# Title
$g.DrawString("Software Developer & IT Solutions", $fTitle, $bDark, $startX, $curY)
$curY += 78

# Skill Badges
$skills = @("Java", "C++", "SQL Databases", "Next.js", "AI Workflows", "OOP Architecture")
$badgeX = $startX
foreach ($sk in $skills) {
    $size = $g.MeasureString($sk, $fBadge)
    $padX = 18
    $padY = 10
    $bW = [int]($size.Width + ($padX * 2))
    $bH = 42
    
    Draw-RoundedRectangle $g $pBadge $bBadgeBg $badgeX $curY $bW $bH 12
    $g.DrawString($sk, $fBadge, $bGreenText, ($badgeX + $padX), ($curY + 8))
    $badgeX += ($bW + 12)
}

$curY += 66

# Bottom Credentials
$creds = "B.S. in IT Administration (UNITEC)   |   4+ Yrs AEO Leadership & SME   |   Bilingual (EN / ES)"
$g.DrawString($creds, $fFootnote, $bMuted, $startX, $curY)

# Save image
$outPath = Join-Path $PSScriptRoot "assets\linkedin_banner_1584x396.png"
$bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)

$g.Dispose()
$bmp.Dispose()
Write-Output "Successfully updated: $outPath"
