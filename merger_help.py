import sys;
import json;
import os;
json_arr = json.load(sys.stdin)
for val in json_arr:
    os.system("git clone {}['clone_url']".format(val))
