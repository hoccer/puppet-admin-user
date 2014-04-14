class admin-user::install {

  group { 'administrator':
    ensure => present,
    name => 'administrator',
  }

  user { 'administrator':
    ensure => present,
    comment => 'Login account for admins',
    gid => 'administrator',
    home => '/home/administrator',
    managehome => true,
    name => 'administrator',
    shell => '/bin/bash',
    require => Group['administrator'],
    groups => ['adm'],
  }

  file { '/home/administrator':
    ensure => directory,
    mode => 755,
    owner => 'administrator',
    group => 'administrator',
    require => User['administrator'],
  }

  file { '/home/administrator/.ssh':
    ensure => directory,
    mode => 700,
    owner => 'administrator',
    group => 'administrator',
    require => File['/home/administrator'],
  }

  file { '/home/administrator/.ssh/authorized_keys':
    ensure => present,
    mode => 600,
    owner => 'administrator',
    group => 'administrator',
    require => File['/home/administrator/.ssh'],
  }

  file { '/etc/sudoers.d/administrator':
    owner   => root,
    group   => root,
    mode    => 440,
    content => 'administrator ALL=(ALL) NOPASSWD:ALL
',
    require => User['administrator'],
  }

  ssh_authorized_key { 'administrator_kaazoo':
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAxNJeGh7iLgMZxkahVMMtvEZLlGeZZM/wV3+sPoFMd7NiTWJCBhI7oO4fknJaJtxAYkVhdn+GxrJAXZsvbNw7KfCiGdBp2OGzIrFW14zwBpnPPVyOVfeAkZz1x35dDyp2LKH3xgp7knuggsA2n+hjQBCuYOZNRBwRZnlkNbSTIacYVufss8nD6EsfE4shg4Rky40MZocqmdLxEalqzyUYf10Mi5Yya/10gcjBZoM5KNYSCPKDYhBr7h7mz3n42LYMfsBYgEzhcvTxgWmEoa1bS40hQLzWWC89/jPBq6pDfF+ukx+efV5v58aEu7y8A1JuUc2sPC5J4eY5MD4ZnULqjQ==',
    type => 'ssh-rsa',
    user => 'administrator',
    require => File['/home/administrator/.ssh/authorized_keys'],
  }

  ssh_authorized_key { 'administrator_rasca':
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAtc77hEN+5rCv9hCLIwtpHnAsv0NV7kCl/l2Y7aAOXFQ933b66h8Pnn1vMjVruAfUKlBWJq3CKPWTXK3FnUOVgcXkzzRzKq8hGPpLUHWHcj/yXi5YgOHMUIAyAggaD6HK26QGN9vL9BHpOd4j4DsmuGnWqskrcK0k5cv0Fhrv/2pHV4tdwy4CMVzv+YEfv/t2BKcK3zU1zLUNOd+RrbsMjYBvlMjKRCcfO8+ro/O5w3Ds7g/Rh+NRqLUs54UZ5G/kJ1z3VNv+PTEnwLNzF4ZibGd9AlXmF2qclc+7BD82q0UfHnAMr0lP3RH6QM9EZ4oQqZ+GXoLWS/QpAG8/MbuveQ==',
    type => 'ssh-rsa',
    user => 'administrator',
    require => File['/home/administrator/.ssh/authorized_keys'],
  }

  ssh_authorized_key { 'administrator_chris':
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDOUNlUYqXRFG7gpozaimz1GhY62qwj0pen+b94CN+WwWVfhSiJeNYRgra3fEIVsBo8wfCMEuKB5HHtJAUngt/duxzDzRNo/Unv79muLOJ3jpGlIIPQOocX9qfZX0TQfGkjyc1vJd+SesD7z4zPQEtTAbUO27xmylqVtvbpypx7dA2QiRk1egKbitju1ZD/6HC9imnlRJlOqG3h2fEtjRoTpLLskn17u3Sdoz/nIjNf/abLDeN7gc5gxDq9utnL1fJsk/lT6U/PDBY84OBFuub3Cm8pJKhyWx5xhvoiwm5oIvkBNXbw3+5JYxtoknfkY9ruX8u9BOoCIdnYJTW7PqHT7Fk1uhC/bW8gJa4XQ/u5b+lihqYfVLTgxflng+jaoH41QPNJsBpmFdVqDFYr1Ahdh6U06iBpv1gttE+BWvcyxMZnk7lqEfAXZANDDqGvohmbGajO0J8nLC0jgYICOoL/ztNobdDPWnltLaYBr9yzwxuUZG1Q8L/HLheetpW8fHe9Uz4Sxi7NrJuH/V9vfJKyXkcfi8jjpgWQUzAJQcymMztfyOtOEdf6nvzBNks4kQpW7K/4w6eNBVDGXmvSR5Ck8/l+dKXJyZ4P/RFQG71igJn0/eEdY8+toBiqDNrRz1Fbnnn9EZkMScF6uj630zDS9ZY4k5m6edzWFj6uT05z1w==',
    type => 'ssh-rsa',
    user => 'administrator',
    require => File['/home/administrator/.ssh/authorized_keys'],
  }

  ssh_authorized_key { 'administrator_becks':
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAABJQAAAgBx+TUiBOEvvJZ4ERSZftoN6lVhE++8SQcJ1jxt5f6FvJwH59TTnV5qySzRY38uBoG2Pws+UsLaDK68Gun9fW5KDvb8bPNIalFYYMZzlMLkd2qA/GJEaLlpD8VDoIr7r73u3WJUUKqlG8SF0ImbT283aX6pf+F0Vh+bdoPoepQ3NbJko/zJMXc1EC0ZWzFDbwzm9m3tdp6VZScOvDGa2fg0uIcBkFIyMXnp458i2YtRZ0uFBP/VcVmKeRSJCqz8NNxaMBUMgOp+IyRUpBp6pxbXYPPa7vPOAHZitqDUoajbj1DYl4vlGMIOYgcx3CA8wr8MqGsUPvGbrPGOUCm4UncYw99e2OUvnPBlP3R+R/SG6RBadvtWjcPP7XkOBfJ4oBk1u24juQoIlkR4nCz7zXSsR6Z8x73PPTJ1XWdOUnxmpF7tlTT+BNHp9fb84cnF9W9uc0wao8L1r3bOdSRX0trN2WE7jah1s5qFtVJPaX78b3UXyl2mFnqkCHxT1Y0e3z0xfmPywtc3d2S0qr0K+0GfHzxqDe2lisypesvx8Eh0faJ3nMMwBcsC7V+ZPocKykuCWV8bpxhvknZYZuTRsR7KGrppIVDe9RZTCZ9A9uWl2Kuf1xbDJn+wVfntVHTUg/FXu8urmp0KBuJ2c4Y2eIVLx0n/JAClSaB+9qrUUAFzAw==',
    type => 'ssh-rsa',
    user => 'administrator',
    require => File['/home/administrator/.ssh/authorized_keys'],
  }

  if ! defined(Package['apt-dater-host']) {
    package { 'apt-dater-host': ensure => present, }
  }

}

