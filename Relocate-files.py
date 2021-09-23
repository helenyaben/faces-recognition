# Script to relocate the files

import os
import shutil
import re

path = r"C:\Users\G531\Documents\1 - Universities\3 - DTU\002 - Course\04 - Cognitive Modelling\03 - Exercises\Project-1\KDEF_and_AKDEF\KDEF"

parent_dir = r"C:\Users\G531\Documents\1 - Universities\3 - DTU\002 - Course\04 - Cognitive Modelling\03 - " \
             r"Exercises\Project-1\KDEF_and_AKDEF\KDEF_sorted"

# Directories
af = 'Afraid'
an = 'Angry'
di = 'Disappointed'
ha = 'Happy'
ne = 'Neutral'
sa = 'Sad'
su = 'Surprised'




print('hello')
for root, folder, files in os.walk(path):
    print('Currently looking at: ', root)
    for f in files:
        if 'AFS.JPG' in str(f):
            print("match")
            if not os.path.exists(os.path.join(parent_dir, af)):
                os.makedirs(os.path.join(parent_dir, af))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, af))
        elif 'ANS.JPG' in str(f):
            if not os.path.exists(os.path.join(parent_dir, an)):
                os.makedirs(os.path.join(parent_dir, an))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, an))
        elif "DIS.JPG" in str(f):
            if not os.path.exists(os.path.join(parent_dir, di)):
                os.makedirs(os.path.join(parent_dir, di))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, di))
        elif "HAS.JPG" in str(f):
            if not os.path.exists(os.path.join(parent_dir, ha)):
                os.makedirs(os.path.join(parent_dir, ha))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, ha))
        elif "NES.JPG" in str(f):
            if not os.path.exists(os.path.join(parent_dir, ne)):
                os.makedirs(os.path.join(parent_dir, ne))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, ne))
        elif "SAS.JPG" in str(f):
            if not os.path.exists(os.path.join(parent_dir, sa)):
                os.makedirs(os.path.join(parent_dir, sa))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, sa))
        elif "SUS.JPG" in str(f):
            if not os.path.exists(os.path.join(parent_dir, su)):
                os.makedirs(os.path.join(parent_dir, su))
            shutil.copy(os.path.join(path, str(root), str(f)), os.path.join(parent_dir, su))
        else:
            pass
