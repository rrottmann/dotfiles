#!/bin/sh
u=rottmrei
pw=`tr -dc [:alnum:] < /dev/urandom | head -c 10`

if ! [ "`id -u`" -eq 0 ]; then
    echo "Error: This script needs to be run as root. Exiting."
    exit 1
fi
if ! [ -f /etc/redhat-release ]; then
    echo "Error: This script needs to be run on a Red Hat based distro. Exiting."
    exit 1
fi
y=yum
which dnf >/dev/null && y=dnf
$y install -y git vim ctags screen perl perl-encoding
if ! getent passwd $u; then
    useradd -m $u
    echo -n "$pw" | passwd --stdin $u
    echo "Your new password is: $pw"
    usermod -G wheel $u
fi
grep -q "^%wheel  ALL = (ALL) NOPASSWD: ALL" /etc/sudoers || echo "%wheel  ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo su - $u -c "[ -d ~/git ] || mkdir ~/git"
sudo su - $u -c "cd ~/git && git clone https://github.com/rrottmann/dotfiles.git"
sudo su - $u -c "cd ~/git/dotfiles && sh ./link.sh | sh -x"
[ -f /home/$u/.ssh/id_rsa ] || sudo su - $u -c "ssh-keygen -t rsa -f /home/$u/.ssh/id_rsa -N ''"
