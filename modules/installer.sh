
# Create main user configuration folder
mkdir -p $USER_CONFIG_FOLDER
# Create working folder
mkdir -p $USER_WORKING_FOLDER

# Install all sources declared
for i in ${SOURCES[@]}; do
    os_install "${i}"
done

# Remove duplicates in the bash profile file
TMPFILE=`tempfile`
cat $USER_BASH_PROFILE | uniq > $TMPFILE && cat $TMPFILE > $USER_BASH_PROFILE
