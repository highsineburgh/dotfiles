"""
Symlink the dotfiles to the user's home directory
"""

from os import getcwd, listdir, remove, symlink
from os.path import isfile, join, lexists, expanduser

IGNORED_FILES = [".gitmodules", ".gitignore", "LICENSE", "README.md", "symlink.py"]
WORKING_DIR = getcwd()

src_files = [ f for f in listdir('.') if isfile(join(WORKING_DIR, f))]
target_dir = expanduser('~')

for src_file in src_files:
    if src_file in IGNORED_FILES:
        continue
    target_file = join(target_dir, src_file)
    if lexists(target_file):
        print "Symlink already exists, deleting existing symlink..."
        remove(target_file)
    print "Creating symlink {0} -> {1}".format(join(WORKING_DIR, src_file), target_file)
    symlink(join(WORKING_DIR, src_file), target_file)
