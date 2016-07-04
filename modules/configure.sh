
function configure_bash {
    log "Configuring bash..."

    echo "
# winistaller bash configuration file
if [ -f $USER_BASH_PROFILE ]; then
    . $USER_BASH_PROFILE
fi
" >> "$HOME/.bashrc"
}

grep $USER_BASH_PROFILE "$HOME/.bashrc" &> /dev/null && debug "Bash is configured" || configure_bash
