# Foxhole

Eerste versie van de homepage: kort, warm en co-creatief.

## Bekijken

Open `index.html` in een browser. Er is geen build-stap of server nodig.

## Structuur

```
index.html                     homepage
css/style.css                  stijl + design tokens
assets/images/voxel/          voxel-illustraties (later: galerij)
design/01-visuele-richting.md ontwerpbeslissingen
tools/generate-voxel.ps1       bron voor de hoofdillustratie
```

## Aanpassen

- **Teksten:** rechtstreeks in `index.html`, per sectie.
- **Kleuren en typografie:** de variabelen bovenaan `css/style.css`.
- **Illustratie:** pas `tools/generate-voxel.ps1` aan en voer hem uit met
  PowerShell. Het SVG-bestand wordt opnieuw geschreven.
- **Later:** extra scènes komen als losse SVG's in `assets/images/voxel/`
  terecht; een galerij kan daar los van deze homepage op bouwen.
