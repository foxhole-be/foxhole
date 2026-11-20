# Bron voor de voxel-illustratie.
# Genereert: assets/images/voxel/foxhole-house.svg
# Aanpassen: kleuren hieronder, roostercellen via Add-Voxel.

$specs = New-Object System.Collections.ArrayList

function Add-Voxel {
  param(
    [int]$I,
    [int]$J,
    [int]$Level = 0,
    [string]$Color,
    [double]$Scale = 1,
    [int]$Dx = 0,
    [int]$Dy = 0
  )

  $apexX = 320 + 20 * ($I - $J) + $Dx
  $apexY = 150 + 12 * ($I + $J) - 24 * $Level + $Dy
  $w = 40 * $Scale
  $h = 48 * $Scale

  [void]$specs.Add([pscustomobject]@{
    Depth = $I + $J
    Level = $Level
    X = $apexX - ($w / 2)
    Y = $apexY
    W = $w
    H = $h
    Color = $Color
  })
}

# Palet
$grass     = '#6E8A5F'
$moss      = '#3F5B42'
$sage      = '#A8B892'
$lightSage = '#C7D2B4'
$wood      = '#B2885E'
$woodDark  = '#8A6547'
$sand      = '#E3D2B4'
$clay      = '#C98E6A'
$wall      = '#D9C9A9'
$wallWarm  = '#C9B794'
$roof      = '#2F4A36'
$head      = '#E8D8BE'

#losse tuinblokjes
$decor = @(
  @(0,0,$sage), @(1,0,$grass), @(4,0,$grass), @(5,1,$grass),
  @(6,1,$sage), @(0,4,$grass), @(0,5,$sage), @(1,5,$grass),
  @(5,6,$grass), @(6,6,$sage), @(1,1,$lightSage), @(5,5,$lightSage)
)
foreach ($d in $decor) { Add-Voxel -I $d[0] -J $d[1] -Level 0 -Color $d[2] }

#pad naar de deur
foreach ($p in @(@(3,5), @(3,6), @(4,5))) { Add-Voxel -I $p[0] -J $p[1] -Level 0 -Color $sand }

#huis: fundering, muren, dak en daktuin
foreach ($i in 2..4) {
  foreach ($j in 2..4) {
    Add-Voxel -I $i -J $j -Level 0 -Color $wood
    Add-Voxel -I $i -J $j -Level 3 -Color $roof

    $isPerimeter = ($i -eq 2 -or $i -eq 4 -or $j -eq 2 -or $j -eq 4)
    if ($isPerimeter) {
      if (-not ($i -eq 3 -and $j -eq 4)) { # deuropening
        $c = if (($i + $j) % 2 -eq 0) { $wall } else { $wallWarm }
        Add-Voxel -I $i -J $j -Level 1 -Color $c
      }
      if (-not ($i -eq 4 -and $j -eq 3)) { # raamopening
        Add-Voxel -I $i -J $j -Level 2 -Color $wall
      }
    }
  }
}

Add-Voxel -I 2 -J 2 -Level 4 -Color $sage
Add-Voxel -I 3 -J 3 -Level 4 -Color $lightSage
Add-Voxel -I 4 -J 4 -Level 4 -Color $sage
Add-Voxel -I 4 -J 2 -Level 4 -Color $clay
Add-Voxel -I 4 -J 2 -Level 5 -Color $wallWarm

#bomen
function Add-Tree([int]$I, [int]$J) {
  Add-Voxel -I $I -J $J -Level 0 -Color $woodDark
  Add-Voxel -I $I -J $J -Level 1 -Color $woodDark
  Add-Voxel -I $I -J $J -Level 2 -Color $moss
  Add-Voxel -I $I -J ($J + 1) -Level 2 -Color $moss
  Add-Voxel -I $I -J $J -Level 3 -Color $grass
}
Add-Tree 0 3
Add-Tree 6 3
Add-Tree 2 5

#mensen
function Add-Person([int]$I, [int]$J) {
  Add-Voxel -I $I -J $J -Level 0 -Color $clay
  Add-Voxel -I $I -J $J -Level 1 -Color $head -Scale 0.62
}
Add-Person 4 5
Add-Person 5 4

#render
$cubes = $specs | Sort-Object Depth, Level, X | ForEach-Object {
  $x = '{0:0.##}' -f $_.X
  $y = '{0:0.##}' -f $_.Y
  $w = '{0:0.##}' -f $_.W
  $h = '{0:0.##}' -f $_.H
  '    <use href="#cube" x="{0}" y="{1}" width="{2}" height="{3}" style="color:{4}"/>' -f $x, $y, $w, $h, $_.Color
}

$svg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="120 60 400 360" role="img" aria-labelledby="foxhole-title foxhole-desc">
  <title id="foxhole-title">Foxhole voxel-huis</title>
  <desc id="foxhole-desc">Een speelse isometrische wereld van groene blokjes met een gemeenschapshuis, tuin, bomen en mensen die samenkomen.</desc>
  <defs>
    <symbol id="cube" viewBox="0 0 40 48">
      <path d="M20 0 40 12 40 36 20 48 0 36 0 12Z" fill="currentColor"/>
      <path d="M20 0 40 12 20 24 0 12Z" fill="#ffffff" opacity=".26"/>
      <path d="M0 12 20 24 20 48 0 36Z" fill="#17261c" opacity=".10"/>
      <path d="M40 12 20 24 20 48 40 36Z" fill="#17261c" opacity=".24"/>
    </symbol>
  </defs>

  <ellipse cx="320" cy="350" rx="172" ry="26" fill="#E8DDC7"/>

  <!-- eiland -->
  <path d="M320 150 460 234 320 318 180 234Z" fill="#6E8A5F"/>
  <path d="M180 234 320 318 320 352 180 268Z" fill="#8A6547"/>
  <path d="M460 234 320 318 320 352 460 268Z" fill="#B2885E"/>

  <!-- blokjes, van achter naar voren -->
$($cubes -join "`n")
</svg>
"@

$out = Join-Path $PSScriptRoot '..\assets\images\voxel\foxhole-house.svg'
New-Item -ItemType Directory -Force -Path (Split-Path $out) | Out-Null
Set-Content -Path $out -Value $svg -Encoding UTF8
Write-Host "Gegenereerd: $out"
