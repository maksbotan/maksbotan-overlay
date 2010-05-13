# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Library for accessing and modifying virtual machine disk images"
HOMEPAGE="http://libguestfs.org"
SRC_URI="http://libguestfs.org/download/libguestfs-${PV}.tar.gz"

LICENSE="GPLv2+
LGPLv2+
"
SLOT="0"
KEYWORDS="~x86"
IUSE="ocaml perl python ruby java haskell inspector tools +debian fedora kvm"

DEPEND="perl-core/podlators
		fedora? ( >=dev-util/febootstrap-2.6 )
		debian? ( dev-util/debootstrap )
		>=app-admin/augeas-0.5.0
		sys-libs/readline
		app-cdr/cdrkit
		dev-libs/libxml2
		kvm? ( >=app-emulation/qemu-kvm-0.10.7 )
		!kvm? ( >=app-emulation/qemu-0.10.7 )
		app-arch/createrepo
		sys-libs/libselinux
		sys-fs/fuse
		sys-fs/lvm2
		sys-fs/ntfs3g
		sys-apps/util-linux
		sys-apps/net-tools
		sys-apps/file
		sys-apps/module-init-tools
		sys-process/procps
		dev-util/strace
		net-misc/iputils
		sys-fs/dosfstools
		sys-process/lsof
		sys-apps/parted
		sys-fs/btrfs-progs
		sys-fs/hfsplusutils
		sys-fs/nilfs-utils
		sys-fs/reiserfsprogs
		sys-fs/jfsutils
		sys-fs/xfsprogs
		sys-boot/grub
		sys-fs/ntfsprogs
		ocaml? ( dev-lang/ocaml )
		ocaml? ( dev-ml/findlib )
		ocaml? ( dev-ml/xml-light )
		perl? ( dev-lang/perl )
		perl? ( perl-core/Test-Simple )
		perl? ( dev-perl/Test-Pod )
		perl? ( dev-perl/Test-Pod-Coverage )
		perl? ( perl-core/ExtUtils-MakeMaker )
		perl? ( dev-perl/XML-Writer )
		perl? ( dev-perl/libintl-perl )
		python? ( dev-lang/python )
		ruby? ( dev-lang/ruby )
		ruby? ( dev-ruby/rubygems )
		java? ( >=virtual/jdk-1.5.0 )
		java? ( >=virtual/jre-1.5.0 )
		sys-apps/fakeroot
		sys-apps/fakechroot
		app-arch/rpm
		sys-apps/yum	
"
RDEPEND="${DEPEND}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_compile() {
	econf \
		$(use_with perl ) \
		$(use_with python ) \
		$(use_with ruby ) \
		$(use_with ocaml ) \
		$(use_with java ) \
		$(use_with haskell ) \
		$(use_with inspector ) \
		$(use_with tools ) || die "econf filed"

	emake || die "emake failed"

}		


