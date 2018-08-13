#!/usr/bin/env bash

echo "------------------------------"
echo "creating aliases for all dot files in your home directory"
echo "------------------------------"
echo ""
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

backup_dir=".backup_old_dot_files"

for pathName in $HOME/dotfiles/*; do
  name=`basename "$pathName"`

  if [[ $name = "coffeelint.json" ]]; then
    target="$HOME/$name"
  else
    target="$HOME/.$name"
  fi

  un_included=('conf', 'init', 'scripts')

  # dotfiles: ignore *.md, *.sh, .files, directories
  if [[ ${name: -3} != ".sh" && ${name: -3} != ".md" && ${name[0]} != "." && ! ${un_included[*]} =~ "$name" ]]; then
    echo "$target"
    # check if file already exists
    if [ -e "$target" ]; then
      # check if file is a symlink.
      # if it is symlink we just delete it
      # if it's a real file we back it up
      if [ ! -L "$target" ]; then
        # create backup dir if it's not there
        if [ ! -d "$HOME/$backup_dir" ]; then
          mkdir -p "$HOME/$backup_dir"
        fi
        echo "Backing up .$name in $HOME/$backup_dir/ directory"
        cp -rf "$target" "$HOME/$backup_dir/.$name"
      fi
    fi

    echo "Deleting $name from $target"
    rm -rf "$target"

    if [[ $name = 'hosts' ]]; then
      sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache
      sudo rm -f /etc/hosts
      sudo ln -s "$pathName" /etc/hosts
    fi

    echo "Creating $target"
    ln -s "$pathName" "$target"
  fi

done

# ./scripts/install_vim_plugins.sh