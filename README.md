# ph-whitelist ([pihole.noads.it]())

![](https://pihole.noads.it/images/pihole-llc_phwhitelist_test.jpg)

Partendo dall'[ottimo lavoro di anudeepND](https://github.com/anudeepND/whitelist) ho voluto realizzare **ph-whitelist**, un fork che in un solo script racchiude la possibilità di modificare dinamicamente la whitelist utilizzata da [Pi-hole](https://pi-hole.net/).

Lo script permette infatti di aggiungere rapidamente siti web [dichiarati leciti dal forum ufficiale della comunità](https://discourse.pi-hole.net/t/commonly-whitelisted-domains/212/27), sbloccare l'uso di Social Network (che spesso vedono finire loro domini in blacklist comunemente utilizzate), integrare siti web che mancano all'appello delle liste di anudeepND, file che sono comunque alla base del funzionamento di ph-whitelist.

## Download & Utilizzo

```bash
wget -N https://raw.githubusercontent.com/gioxx/ph-whitelist/master/scripts/whitelist.sh
chmod +x whitelist.sh
sudo ./whitelist safe|referral|stats|facebook
```
Per maggiori informazioni e ulteriori esempi visita https://pihole.noads.it/#download

### In analisi

Nuove blacklist per Pi-hole saltano fuori come funghi quasi quotidianamente. Alcune di queste magari sono anche valide, per questo motivo cerco di tenerle d'occhio e raccoglierle all'interno del file [In analisi.md](https://github.com/gioxx/ph-whitelist/blob/master/In%20analisi.md) che trovi in questo stesso repository.

***

## Licenza d'uso originale
```
MIT License

Copyright (c) 2018 Anudeep ND <anudeep@protonmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
