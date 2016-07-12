
CURRENT_DIR=`pwd`
EXE_NAME=`basename $0`

USER_CONFIG_FOLDER=~/Documents/winstaller-config-files
USER_WORKING_FOLDER=~/.winstaller

USER_BASH_PROFILE=$USER_WORKING_FOLDER/winstaller-bash.profile

ARCH=`uname -m`

# Read configuration
SOURCES=(
)
UNSOURCES=(
)

mkdir -p $USER_CONFIG_FOLDER/winstaller/
touch $USER_CONFIG_FOLDER/winstaller/sources.list
touch $USER_CONFIG_FOLDER/winstaller/unsources.list

for _sources in `cat $USER_CONFIG_FOLDER/winstaller/sources.list` ; do
    SOURCES+=($_sources)
done;

for _unsources in `cat $USER_CONFIG_FOLDER/winstaller/unsources.list` ; do
    SOURCES+=($_unsources)
done;
