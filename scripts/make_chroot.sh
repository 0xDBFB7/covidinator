MY_CHROOT=/home/arthurdent/chroots/$1
mkdir $MY_CHROOT
debootstrap jessie $MY_CHROOT http://deb.debian.org/debian/

#echo "proc $MY_CHROOT/proc proc defaults 0 0" >> /etc/fstab
#echo "sysfs $MY_CHROOT/sys sysfs defaults 0 0" >> /etc/fstab

cp /etc/hosts $MY_CHROOT/etc/hosts
cp /proc/mounts $MY_CHROOT/etc/mtab

#then install bash-completions
#put alias sudo="" in .bashrc
#
