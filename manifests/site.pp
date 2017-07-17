# site.pp file for production env

node default {
  include sudo
  include motd
}
