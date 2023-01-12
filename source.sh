function cgi_decodevar() {
    [ $# -ne 1 ] && return
    local v t h
    # replace all + with whitespace and append %%
    t="${1//+/ }%%"
    while [ ${#t} -gt 0 -a "${t}" != "%" ]; do
        v="${v}${t%%\%*}" # digest up to the first %
        t="${t#*%}"       # remove digested part
        # decode if there is anything to decode and if not at end of string
        if [ ${#t} -gt 0 -a "${t}" != "%" ]; then
            h=${t:0:2} # save first two chars
            t="${t:2}" # remove these
            v="${v}"`echo -e \\\\x${h}` # convert hex to special char
        fi
    done
    # return decoded string
    echo "${v}"
    return
}

saveIFS=$IFS
IFS='=&'
VARS=($QUERY_STRING)
IFS=$saveIFS

for ((i=0; i<${#VARS[@]}; i+=2))
do
  curr="$(cgi_decodevar ${VARS[i]})"
  next="$(cgi_decodevar ${VARS[i+2]})"
  prev="$(cgi_decodevar ${VARS[i-2]})"
  value="$(cgi_decodevar ${VARS[i+1]})"

  array=${curr%"[]"}

  if  [ "$curr" == "$next" ] && [ "$curr" != "$prev" ] ;then
      j=0
      declare var_${array}[$j]="$value"
  elif [ $i -gt 1 ] && [ "$curr" == "$prev" ]; then
    j=$((j + 1))
    declare var_${array}[$j]="$value"
  else
    declare var_$curr="$value"
  fi
done
