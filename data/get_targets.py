import pandas as pd
import os

results = pd.read_csv('results_Helen.csv')

# get file names with correct targets
happy = os.listdir('happy')
sad = os.listdir('sad')

# loop through results and fill a dictionary which maps the NES file names to HAS or SAS
dict = {}
for file in results['file_name']:
    for face in happy:
        if 'NES' in file and file[0:4]==face[0:4] and face[4]=='_':
            dict[file]=face
    for face in sad:
        if 'NES' in file and file[0:4]==face[0:4] and face[4]=='_':
            dict[file]=face

results['file_name'].replace(dict, inplace=True)

results.to_csv('results_Helen_fixed.csv', index=False)