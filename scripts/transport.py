from pathlib import Path
import warsaw_data_api

apikey_file = Path(__file__).resolve().parent / '.apikey'
apikey = apikey_file.read_text().strip()

ztm = warsaw_data_api.ztm(apikey=apikey) # you can get your own at https://api.um.warszawa.pl/
schedule = ztm.get_bus_stop_schedule_by_id("7009", "01", "182")
print(schedule.rides)