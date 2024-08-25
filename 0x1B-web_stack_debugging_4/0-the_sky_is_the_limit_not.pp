# Increases the amount of traffic an Nginx server can handle.

# Increase the ULIMIT of the default file
# Manifest to fix Nginx open file limit configuration
exec { 'nginx fix':
  onlyif   => 'test -e /etc/default/nginx',
  command  => "sed -i s/'-n 15'/'-n 4096'/g /etc/default/nginx;  service nginx restart",
  provider => 'shell'
}
