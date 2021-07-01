#!/bin/env bash

pkg_path="pkgs.txt"

function install_all_pkgs()
{
	cat $pkg_path | yay -S --noconfirm -
}

function install_yay()
{
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si
	cd -
	rm -rf /tmp/yay
}

function compile()
{
	cd $1
	sudo make clean install
	cd -
}

function get_base_packages()
{
	sudo pacman -S --noconfirm git base-devel
}

function symlink_files()
{
	ln -sf "config" "$HOME/.config"
	ln -sf "local" "$HOME/.local"
}

function main()
{
	echo "Installing base packages needed for setup..."
	get_base_packages
	echo "Installing yay, an aur helper."
	install_yay
	echo "Installing all system packages."
	install_all_pkgs
	echo "Compiling dwm."
	compile dwm
	echo "Compiling dmenu."
	compile dmenu
	echo "Symlinking configuration files."
	symlink_files
}

main
