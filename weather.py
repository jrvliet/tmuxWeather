import urllib2
import json

scriptLoc = '/home/jacob/scripts/'
key = '69662d6dc2f90711'
url = 'http://api.wunderground.com/api/{0:s}/conditions/q/88001.json'

f = urllib2.urlopen(url.format(key))
json_string = f.read()
parsed_json = json.loads(json_string)
temp_f = parsed_json['current_observation']['temp_f']
humid = parsed_json['current_observation']['relative_humidity']
wind = parsed_json['current_observation']['wind_mph']
sky = parsed_json['current_observation']['icon']
f.close()
s = '{0:.1f}, {1:s}, {2:.0f}mph, {3:s}\n'.format(temp_f,humid,wind,sky)
with open(scriptLoc+'status', 'w') as f:
    f.write(s)




