# Class: passwd_root
# ===========================
#
# Author:  kishorethakur.rajput@gmail.com
#
# ===========================

class passwd_root {

  file { passwd_root:
      fpath => "/etc/passwd",
      from => '^root:.*$',
      to => "root:x:0:0:root\${hostname}:/root:/bin/bash",
      sep => ';'
   }


case $operatingsytem {
   redhat: { 
          package { "ruby-shadow":
                     ensure => installed,
		     require => User[root],
                 }
            }

   CentOS: {
	  package { "ruby-shadow":
		    ensure => installed,
		    require => User(root),
                }
           }
}

if( $dc == 'devopsi' ){
      $root_password = '$6$2Tpi/XJi$399Pk0XLrXylZ5vEPERb4/LTauVcfKUVCr16R.ZNjJhbAW9uyPyPPMOAxcKGoWdUN0r1RYKrVruebeYHft3ck0'
   } else {
      $root_password = '$6$2Tpi/XJi$399Pk0XLrXylZ5vEPERb4/LTauVcfKUVCr16R.ZNjJhbAW9uyPyPPMOAxcKGoWdUN0r1RYKrVruebeYHft3ck0'
   }


   user { "root":
        ensure => present,
        password => $root_password
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

}

