
# Create main user configuration folder
mkdir -p $USER_CONFIG_FOLDER
# Create working folder
mkdir -p $USER_WORKING_FOLDER

if [ ! -n "$SOURCES" ] && [ ! -n "$UNSOURCES" ]; then
    echo "***************************"
    echo "*** WELCOME TO $EXE_NAME ***"
    echo "***************************"
    echo "Looks like you have not yet configured $EXE_NAME."
    echo "So we will go to the setup mode."
    echo "Note: you can run setup again by running [$EXE_NAME --setup]"
    echo ""

    SETUPMODE=1;
fi

if [ "$SETUPMODE" = "1" ]; then
    echo "***************************"
    echo "*** $EXE_NAME SETUP MODE ***"
    echo "***************************"
    echo ""
    echo "Please choose a list of sources to automatically INSTALL and INSTALL:"

    # Reset SOURCES and UNSOURCES
    ## TODO: suggest the already configured option here
    SOURCES=()
    UNSOURCES=()

    for _sources in `ls sources` ; do
        if [ "${_sources,}" = "winstaller" ]; then
            continue;
        fi

        ## TODO: suggest the already configured option here
        echo -n "Install(I)/Uninstall(U)/None(ENTER) $_sources (ENTER/i/u): "
        read _ANSWER
        if [ "${_ANSWER,}" = "i" ]; then
            echo "  + Adding $_sources to the installation list."
            SOURCES+=($_sources)
        elif [ "${_ANSWER,}" = "u" ]; then
            echo "  - Adding $_sources to the UNinstallation list."
            UNSOURCES+=($_sources)
        else
            echo "  Do nothing with $_sources."
        fi
    done;

    # Reset files
    echo -n "" > $USER_CONFIG_FOLDER/winstaller/sources.list
    echo -n "" > $USER_CONFIG_FOLDER/winstaller/unsources.list

    for i in ${UNSOURCES[@]}; do
        echo "${i}" >> $USER_CONFIG_FOLDER/winstaller/unsources.list
    done

    # Install all sources declared
    for i in ${SOURCES[@]}; do
        echo "${i}" >> $USER_CONFIG_FOLDER/winstaller/sources.list
    done

    echo ""
    echo "Setup successfull. Press any key to continue."
    read $_TMP
    echo ""

fi

# force winstaller to be in the SOURCES list
SOURCES+=('winstaller')

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
