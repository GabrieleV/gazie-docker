# GAzie Docker

Forked by GabrieleV

## Perché Gazie-Docker

GAzie sta Gestione Aziendale.
Il software è opensource e liberamente caricabile dal sito:

https://sourceforge.net/p/gazie/code/HEAD/tree/trunk/

Il sito ufficiale di GAzie è: http://www.devincentiis.it/

Grazie a Gazie-Docker potrai installare l'ultima versione
stabile di Gazie in meno di 10 minuti.

Avrai così la tua infrastruttura Gazie con NGINX, PHP-FPM e database MARIADB.


## Installazione

Per l'installazione occorre in primo luogo avere installato
l'applicativo docker

https://www.docker.com/

Copiare il file .config.origin in conf

`cp .config.origin conf`

Modificare il file di configurazione conf

`vi conf`

ed eseguire il build per creare le immagini Gazie-Docker, Gazie-Nginx

`make build`

Potete per esempio lavorare sul vostro pc senza installare mysql o php, ma semplicemente docker.


## Esecuzione Immagini Docker

Per eseguire le immagini docker create scrivere

`make start`

Per stoppare le immagini docker eseguire

`make stop`

## Backup Database


Per effettuare il backup logico del database basta digitare

`./backup.sh [ nome-backup.sql ]`

Il risultato sarà un file sql, di tutte le tabelle e le righe
del database.
Se si vuole comprimere i backup aggiungere il comando

`gzip [ nome-backup.sql ]`

Il risultato è un file compresso .gz che potrà essere ripristinato.


## Restore Database di Backup


Se hai un backup da ripristinare puoi semplicemente editare:

`./restore.sh  [ file-dump-gzip ]`

Il comando ripristina il database sul database Mariadb.

## Esecuzione PHPMYADMIN

Per utilizzare PHPMYADMIN occorre eseguire il file:

`./run_phpmyadmin.sh`

Si potrà poi consultare il database eseguendo:

http://localhost:8080/

## Modificare i file PHP


Se si deve testare la versione di gazie e modificare qualche file .php
si può accedere all'immagine ove risiede Gazie con il seguente comando:

`docker exec  -ti phpfpm bash`

A questo punto comparirà la shell e si potranno editare i file con il
come tools vim:

Es:
root@cdec42c9aa5c:/var/www/html# vi config/config/gconfig.php

## Sviluppo di Gazie Con Docker

Quando inserisci la versione di Gazie puoi semplicemente digitare

`$GAZIE_VERSION=dev`

Il software costruirà le macchine di web e server, menetre potrai aggiornare il software all'interno della cartella

`gazie/`

gestibile con il software svn.
