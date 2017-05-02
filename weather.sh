#!/bin/bash

# Get the current weather and store in current.xml
url='http://api.wunderground.com/weatherstation/WXCurrentObXML.asp?ID=MNMC07'
out='test.xml'
output='status'

curl $url -o $out -s

# Get the temperature
temp=$(cat $out | awk '/temp_f/ {print $1}' | cut -d '<' -f 2 | cut -d '>' -f 2)

# Get the humidity
humid=$(cat $out | awk '/humidity/ {print $1}' | cut -d '<' -f 2 | cut -d '>' -f 2)

# Get the wind
wind=$(cat $out | awk '/wind_mph/ {print $1}' | cut -d '<' -f 2 | cut -d '>' -f 2)
printf '%s\n\n',$wind

catchcondition='Calm'
if [ "$wind" = "$catchcondition" ]; then
    windstring="calm"
else
    unit=mph
    windstring=$wind$unit
fi
# Get the sky state
sky=$(cat $out | awk '/weather_string/ {print $1}' | cut -d '<' -f 2 | cut -d '>' -f 2)

if [[ -z $sky ]]; then
    sky=clear
fi

printf '%sF, %s%%, %s, %s\n' $temp $humid $windstring $sky 





