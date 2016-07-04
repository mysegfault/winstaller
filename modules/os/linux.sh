

function os_install {
    SOURCE_NAME=$1
    log "Trying to install [$SOURCE_NAME]..."

    # Reset vars
    SOURCE_VERSION=""

    # Load source configuration
    source sources/$SOURCE_NAME && debug "Configuration loaded for [$SOURCE_NAME]..." || die "Missing source configuration for [$SOURCE_NAME]." $ERR_MISSING_SOURCE_CONFIG

    SOURCE_GET_TEST_CMD && os_install_already || os_install_run
}

function os_install_run {
    echo "Installing $SOURCE_NAME..."
    SOURCE_INSTALL && echo "$SOURCE_NAME successfully installed." || echo "Error while installing $SOURCE_NAME"

    # Force to go back to the current folder
    cd $CURRENT_DIR
}

function os_install_already {
    debug "getting version of $SOURCE_NAME"
    SOURCE_GET_VERSION
    echo "$SOURCE_NAME already installed ($SOURCE_VERSION)"
}
