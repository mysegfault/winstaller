
# Create main user configuration folder
mkdir -p $USER_CONFIG_FOLDER
# Create working folder
mkdir -p $USER_WORKING_FOLDER

# Uninstall all unsources declared
for i in ${UNSOURCES[@]}; do
    os_uninstall "${i}"
done

# Install all sources declared
for i in ${SOURCES[@]}; do
    os_install "${i}"
done

# Remove duplicates in the bash profile file
TMPFILE=`tempfile`
touch $USER_BASH_PROFILE
cat $USER_BASH_PROFILE | sort | uniq > $TMPFILE && cat $TMPFILE > $USER_BASH_PROFILE
