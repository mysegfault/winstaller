# Understand winstaller
_winstaller_ automatically install and configure your packages and softwares you tell him to process.
Another short definition is: run _winstaller_ and it will install all your own softwares with their configuration. 

For instance, after you installed a new linux distribution / windows installation / macOS installation, you want to quickly recover your sofwares and their configuration.
_winstaller_ will remember the list of these softwares with the corresponding configuration and after launching it, you will be ready to use your new installation like you want it.

Example:
- install a custom list of softwares that are not always packaged (found within apt/yum packages) like emacs, meld, git, the android SDK...
- recover automatically your softwares configurations: bash aliases, git configuration...

The details of the installation and configuration are shared by the community, so you won't loose time knowing how to install this tool because the complexity of the installation/configration will be handheld by _winstaller_.

Example:
- installing skype could be pain in the *** on linux. Just add "skype" to the list of sources to install and it will be installed whatever your OS / distribution / hardware architecture.

Some softwares need be declared in the system so you can use them quickly.

Example:
- by installing the "android-sdk" source, you will be able to run the included tools straight from the terminal (ex: adb, android, ziptool...)
- the shell variables will be automatically set with the correct values

You can also run _winstaller_ in order to install the new versions of the tools you already choose to install.

Example:
- if you use the "visual-studio-code" source, it will check if you are using the latest version and will update it automatically if needed 

Add customized sources to the tool so you can tell _winstaller_ to install/update/configure any software you need.

Exemple:
- add a "mytool" source in your own configuration and it will behave like any other declared source, so you call tell how to install, configure and update this software

# Installation
## With npm
* You can use "npm" to install the tool
```bash
npm install -g git://github.com/mysegfault/winstaller.git
```
* then you can run "winstaller" from the terminal

## By downlaoding the master source code
```bash
wget -O winstaller-master.zip https://codeload.github.com/mysegfault/winstaller/zip/master
unzip winstaller-master.zip
```
* then you can run "./winstaller-master/bin/winstaller" from the terminal

# Configuration
## Change your sources configuration
_TODO_

## User defined sources
In the case of a private/unlisted source (not an source file included in the winstaller sources list), you can define your own source easily:
* go to your  user configuration folder (default:  ~/Documents/winstaller-config-files/)
cd ~/Documents/winstaller-config-files
* go to your "winstaller" folder
cd winstaller
* create a "sources" folder
mkdir sources
* create a new source definition file (i.e. "mytool")
* create the bash methods *SOURCE_GET_TEST_CMD*,*SOURCE_GET_VERSION*,*SOURCE_INSTALL*,*SOURCE_FINALIZE* customized for your tool. Have a look to the existing sources file to know how to write the function code.

_Full developer documentation is needed._
