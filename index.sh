#!/bin/bash

# Author: Martin Rösner
# Mail: roesner@elektronikschule.de
# Bash CGI-Script zum laden und aufbereiten von
# Formulardaten

. parts.sh
. source.sh

head
body
if [ -z "$QUERY_STRING" ]; then
    form
else
    cgi
    contacts
fi
footer
