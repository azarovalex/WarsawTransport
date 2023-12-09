from pathlib import Path
import warsaw_data_api

apikey_file = Path(__file__).resolve().parent / '.apikey'
apikey = apikey_file.read_text().strip()

ztm = warsaw_data_api.ztm(apikey=apikey) # you can get your own at https://api.um.warszawa.pl/
buses = ztm.get_buses_location()

for bus in buses:
    print(bus)