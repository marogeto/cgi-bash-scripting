#!/bin/bash

function head(){
    echo 'Content-Type: txt/html;
    
<!DOCTYPE html>
<html>
    <head>
        <title>Bash CGI Script</title>
        <meta charset="utf-8">
    </head>
    '
}

function body(){
    echo '
    <body>
        <h1>Bash CGI-Skript</h1>
        <p>Diese Seite ist komplett in Bash geschrieben. D.h., dass die gesendeten Formulardaten in 
            Bash aufgearbeitet und entsprechend weiterverarbeitet werden.</p>
        <p>Diese kleine Seite speichert Kontaktdaten in einer Datei und zeigt diese entsprechend an.</p>
        <div>
    '
}

function form(){
    echo '
        <form method="get">
            <p>Vorname: <input type="text" name="vname" /></p>
            <p>Nachname: <input type="text" name="nname" /></p>
            <p>Mail: <input type="text" name="mail" /></p>
            <p>Mobil: <input type="text" name="tel" /></p>
            <p><input type="reset" value="Abbrechen"/><input type="submit" value="Los"/></p>
        </form>
    '
}

function footer(){
    echo '
        </div>
    </body>
</html>
    '
}