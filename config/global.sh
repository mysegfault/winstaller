
SOURCES=(
)
UNSOURCES=(
)

USER_CONFIG_FOLDER=~/Documents/winstaller-config-files
USER_WORKING_FOLDER=~/.wininstaller
USER_BASH_PROFILE=$USER_WORKING_FOLDER/wininstaller-bash.profile

CURRENT_DIR=`pwd`

EXE_NAME=`basename $0`

# Read configuration
for _sources in `cat $USER_CONFIG_FOLDER/winistaller/sources.list` ; do
    SOURCES+=($_sources)
done;

for _unsources in `cat $USER_CONFIG_FOLDER/winistaller/unsources.list` ; do
    SOURCES+=($_unsources)
done;
