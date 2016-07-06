
function os_uninstall {
    SOURCE_NAME=$1
    log "Trying to uninstall [$SOURCE_NAME]..."

    # Reset vars & functions
    function SOURCE_UNINSTALL {
        return;
    }

    # Load source configuration
    if [ ! -f sources/$SOURCE_NAME ]; then
        echo "Missing source configuration for [$SOURCE_NAME]."
        return;
    fi
    source sources/$SOURCE_NAME && debug "Configuration loaded for [$SOURCE_NAME]..." || die "Error while loading [$SOURCE_NAME]." $ERR_MISSING_SOURCE_CONFIG

    SOURCE_UNINSTALL && echo "Uninstallation of [$SOURCE_NAME] successfull" || echo "Could not uninstall [$SOURCE_NAME]!"

    sudo apt -qq autoremove

    # Force to go back to the current folder
    cd $CURRENT_DIR
}

function os_install {
    SOURCE_NAME=$1
    log "Trying to install [$SOURCE_NAME]..."

    # Reset vars & functions
    SOURCE_VERSION=""
    function SOURCE_INSTALL {
        return;
    }
    function SOURCE_GET_VERSION {
        return;
    }
    function SOURCE_GET_TEST_CMD {
        return;
    }
    function SOURCE_FINALIZE {
        return;
    }
    ## Creates a .bash empty configuration file and activates it
    ## so every source can be customize later by the user
    function SOURCE_BASH_SCRIPT {
        mkdir -p $USER_CONFIG_FOLDER/$SOURCE_NAME/
        cd $USER_CONFIG_FOLDER/$SOURCE_NAME/

        if [ ! -f $SOURCE_NAME.bash ]; then
            echo "# Enter here your $SOURCE_NAME configuration" > $SOURCE_NAME.bash
        fi

        echo "source `pwd`/$SOURCE_NAME.bash" >> $USER_BASH_PROFILE
    }
    
    # Load source configuration
    if [ ! -f sources/$SOURCE_NAME ]; then
        echo "Missing source configuration for [$SOURCE_NAME]."
        return;
    fi
    source sources/$SOURCE_NAME && debug "Configuration loaded for [$SOURCE_NAME]..." || die "Error while loading [$SOURCE_NAME]." $ERR_MISSING_SOURCE_CONFIG

    SOURCE_GET_TEST_CMD && os_install_already || os_install_run

    SOURCE_BASH_SCRIPT

    SOURCE_FINALIZE

    # Force to go back to the current folder
    cd $CURRENT_DIR
}

function os_install_run {
    echo "Installing $SOURCE_NAME..."
    SOURCE_INSTALL && echo "$SOURCE_NAME successfully installed." || echo "Error while installing $SOURCE_NAME"
}

function os_install_already {
    debug "getting version of $SOURCE_NAME"
    SOURCE_GET_VERSION
    echo "$SOURCE_NAME already installed ($SOURCE_VERSION)"
}
