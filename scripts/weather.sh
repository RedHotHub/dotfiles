!#/bin/sh

http --json "http://api.openweathermap.org/data/2.5/weather?q=Amsterdam&appid=77f3ecc037d5e00e40b5487ca31f7367&units=metric" | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["'weather'"][0]["'description'"] +", "+ str(obj["'main'"]["'temp'"]) + " - " + str(obj["'main'"]["'temp_min'"]) + "\\" + str(obj["'main'"]["'temp_max'"]) + " ~" + str(obj["'main'"]["'humidity'"])'