# Class: passwd_root
# ===========================
#
# Author:  kishorethakur.rajput@gmail.com
#
# ===========================

class passwd_root (
	$passwd = undef,
) 

	user { root:
	 	ensure => present,
		password => $password,
}

	file {
	"/root":
		ensure => directory,
		owner => root,
		group => root,
		mode => 755;

	"/root/.bashrc":
		owner => root,
		group => root,
		mode => 755,
		source => "puppet:///modules/passwd_root/.bashrc";

	"/root/.exrc":
		owner => root,
		group => root,
		mode => 755,
		source => "puppet:///modules/passwd_root/.exrc";

	"/root/.kshrc":
		owner => root,
		group => root,
		mode => 755,
		source => "puppet:///modules/passwd_root/.kshrc";

	"/root/.profile":
		ensure => link,
		target => ".bashrc";

	"/root/.vimrc":
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/passwd_root/.vimrc";

	"/sbin/ksh":
		ensure => link,
		target => "/bin/ksh";

		
	}

