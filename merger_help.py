import sys;
import json;
import os;
json_arr = json.load(sys.stdin)
for val in json_arr:
    url = val['clone_url']
    os.system("git clone {}".format(url))
