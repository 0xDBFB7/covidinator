MY_CHROOT=/home/arthurdent/chroots/$1

mount proc $MY_CHROOT/proc -t proc
mount sysfs $MY_CHROOT/sys -t sysfs

mount --bind $MY_CHROOT/root/opt/openEMS/ /home/arthurdent/Programs/OpenEMS
mount --bind $MY_CHROOT/openEMS-Project/ /home/arthurdent/Programs/OpenEMS-Project
mount --bind /home/arthurdent/covidinator $MY_CHROOT/covidinator

chroot $MY_CHROOT /bin/bash

umount -lf $MY_CHROOT/proc
umount -lf $MY_CHROOT/sys
umount /home/arthurdent/Programs/OpenEMS
umount $MY_CHROOT/covidinator
