# Foxhole — visuele richting (v1)

## Gevoel

Rustig, warm en uitnodigend. Geen afgerond verhaal, maar een open uitnodiging.
De pagina ademt: weinig tekst, veel witruimte, zachte overgangen.

## Kleurenpalet

| Rol | Kleur | Hex |
| --- | --- | --- |
| Achtergrond beige | warm papieren beige | `#F5F0E6` |
| Zand / zachte vlakken | zand | `#E8DDC7` |
| Donkergroen | diep bosgroen | `#20362A` |
| Mosgroen | middentoon | `#6E8A5F` |
| Licht mos | accent in illustratie | `#A8B892` |
| Hout | warm houtbruin | `#B2885E` |
| Klei | menselijke warmte | `#C98E6A` |

Geen felle accenten. Contrast komt uit donkergroen op beige, niet uit verzadiging.

## Typografie

- Koppen: serif (`Palatino / Georgia`), rustig en niet te zwaar.
- Lopende tekst: systeem-sans, ruime regelafstand (≈1.7).
- Schaal: hero-kop groot, overige teksten klein en kalm.

## Layout

```
[ header: foxhole               wie zijn wij? · samen ]

[ hero: korte kop + intro   |   groen landschap ]

[ zandvlak: co-creatie in één zin ]

[ donkergroen vlak: "Een plek die groeit met de mensen
  die er thuiskomen." ]

[ footer: foxhole · toekomstige pagina's ]

aparte pagina: wie-zijn-wij.html met ruimte voor Lin en Stef
```

- Desktop: twee kolommen in de hero, daarna volle breedte met interne maxbreedte.
- Tablet/mobiel: alles stapelt, illustratie onder de tekst.
- Secties met ruime `padding`, geen kaarten, randjes of schaduwen.

## Beeldtaal

Eén zachte, organische landschapillustratie als hoofdbeeld: lichte en donkere
groene heuvels, een eenvoudig huis, ronde bomen, een zandpad en twee mensen.
Geen blokjes of harde randen — vooral curved vormen en veel groen. Het beeld
staat in `assets/images/`, zodat later een galerij met meer scènes naast komt
te staan.

## Uitbreidbaarheid

- Kleuren en typografie staan als tokens bovenaan de CSS.
- HTML is opgedeeld in duidelijke secties met commented blokken.
- Toekomstige pagina's (activiteiten, ruimtes, mensen, werking) worden alleen
  genoemd in de footer; er worden nu geen extra pagina's gebouwd.
