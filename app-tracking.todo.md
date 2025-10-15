# To Do's For Tracking App's Installed

### Apt 
- [ ] Create a shell function that adds the name of an app to be downloaded into a registry list (only if successfully downloaded)
    - [ ] Add the app name to the list
    - [ ] Check the output from the `apt-get` call to see if it was successful
        - [ ] If I have the time, get all of the other names of dependencies that were downloaded and keep track of who installed them (and maybe even who else needs them)
    - [ ] Silence the output? If so, report success or failure
- [ ] Create a shell function that will remove an app from the registry list whenever the app is removed 
    - [ ] See if I need to remove the dependencies manually? Is it already handled by `apt`? 
- [ ] Add to the bootstrap function to loop through each line of the registry file and call `sudo apt-get $APP_NAME -y`

### Go
- [ ] Create a function that will log all of the go bin installs to a registry list 
    - [ ] Check the output to ensure that the install succeeded
        - [ ] Optionally keep track of the dependencies that are being installed and who needs them 
            - [ ] If i do this for all of the installs, should use a database to keep track of them
                - [ ] Backup the database every time that there is an install that happens
    - [ ] Move the installed binaries from the `$GOBIN` to my `desktop-config` git repo and create a symlink to in in the `$GOBIN`
- [ ] Create a function to remove the apps from the repository list when they aren't needed anymore
    - [ ] Not sure how dependencies are removed when this happens. If we are tracking who needs the dependencies, can remove manually
- [ ] Add to the bootstrap function to loop through each line of the registry file and call `go install $PACKAGE_NAME`

### Webi
- [ ] Create a shell function that will call `webi` for me, and then logs the bin to a registry list 
    - [ ] Check the output to ensure that it was successful
- [ ] Create a shell function that will remove the name from the registry when it is removed 
- [ ] Add to the bootstrap function to call `webi` for each name in the registry

### Flatpak
- [ ] Create a shell function that will call `flatpak` for me, and then logs the bin to a registry list 
    - [ ] Check the output to ensure that it was successful
- [ ] Create a shell function that will remove the name from the registry when it is removed 
- [ ] Add to the bootstrap function to call `flatpak` for each name in the registry

### Manual
- [ ] I will have to manually add entries for the manually installed apps to a registry list
