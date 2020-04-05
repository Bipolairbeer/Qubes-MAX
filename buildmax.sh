#!/bin/bash
sudo dnf -y install make git pacman gnupg createrepo rpm-build make wget rpmdevtools python3-sh dialog rpm-sign dpkg-dev debootstrap PyYAML devscripts perl-Digest-MD5 perl-Digest-SHA
sudo dnf -y update && sudo dnf -y upgrade

sudo git clone https://github.com/QubesOS/qubes-secpack.git
sudo chmod -R 777 /home/user/qubes-secpack

gpg --import qubes-secpack/keys/*/*
gpg --command-fd 0 --edit-key 36879494 <<EOF
fpr
trust
5
y
quit
EOF

cd /home/user/qubes-secpack/canaries/
gpg --verify canary-001-2015.txt.sig.joanna canary-001-2015.txt
gpg --verify canary-001-2015.txt.sig.marmarek canary-001-2015.txt

cd
sudo git clone https://github.com/QubesOS/qubes-builder.git
sudo chmod -R 777 /home/user/qubes-builder

cd /home/user/qubes-builder/
git tag -v `git describe`

cd
sudo cp /home/user/Qubes-MAX/builder.conf /home/user/qubes-builder/builder.conf

cd /home/user/qubes-builder/
make install-deps
make get-sources
make qubes
make iso
