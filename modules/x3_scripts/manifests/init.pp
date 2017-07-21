class x3_scripts {
     file { '/scripts':
          ensure  => directory,
          mode    => '0744',
          owner   => 'root',
          group   => 'root',
          source  => 'puppet:///.../scripts',
          recurse => 'remote',
          path    => '/scripts',
     }
}
