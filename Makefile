MNT=mnt
OPK=opk
BUILDROOT=../buildroot
LINUX=../linux
VMLINUX=$(LINUX)/vmlinux
ROOTFS=$(BUILDROOT)/output/images/rootfs.squashfs

all: vmlinux boot.img data.img

vmlinux:
	cp ${VMLINUX} $@

boot.img:
	mkdir -p ${MNT}
	dd if=/dev/zero of=$@ bs=1M count=128
	mkdosfs $@
	sudo mount $@ ${MNT}
	sudo cp ${ROOTFS} ${MNT}
	sudo umount ${MNT}

data.img:
	dd if=/dev/zero of=$@ bs=1M count=512
	mkfs.ext4 $@
	sudo mount $@ ${MNT}
	sudo mkdir -p ${MNT}/apps
	sudo cp ${OPK}/*.opk ${MNT}/apps
	sudo umount ${MNT}

clean:
	rm -rf ${MNT} vmlinux boot.img data.img
