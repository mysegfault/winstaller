

function os_install {
    SOURCE_NAME=$1
    log "Trying to install [$SOURCE_NAME]..."

    # Reset vars
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
    
    # Load source configuration
    if [ ! -f sources/$SOURCE_NAME ]; then
        echo "Missing source configuration for [$SOURCE_NAME]."
        return;
    fi
    source sources/$SOURCE_NAME && debug "Configuration loaded for [$SOURCE_NAME]..." || die "Error while loading [$SOURCE_NAME]." $ERR_MISSING_SOURCE_CONFIG

    SOURCE_GET_TEST_CMD && os_install_already || os_install_run

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
