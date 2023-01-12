#!/bin/bash

#
#
#
#

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
