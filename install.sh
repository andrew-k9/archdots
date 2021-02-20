#!/bin/bash
# This is NOT for installing arch on whatever device, this
# is a glorified package downloader and linker
# This will write over anything in your home folder!

DFP=`cd $(dirname $0) ; pwd -P`

symlink() {
	cd $1
	files=$(find | sed 's/^\.//g' | sed 's/^\///g')
	for f in $files; do 
		ln -sfn $1/$f $2/$f
		echo "$2/$f to $1/$f"
	done
}

# 1 - link the files
symlink "$DFP/vim" "$HOME"
symlink "$DFP/zsh" "$HOME"
symlink "$DFP/bash" "$HOME"
symlink "$DFP/git" "$HOME"
symlink "$DFP/system" "$HOME"
symlink "$DFP/qtile" "$HOME/.config/qtile"
symlink "$DFP/kitty" "$HOME/.config/kitty"

