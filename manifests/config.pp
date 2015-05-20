# == Class: icecast::packages
#
# Set up configuration files.
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Callum Dickinson <callum@huttradio.co.nz>
#
# === Copyright
#
# Copyright 2015 Callum Dickinson.
#
class icecast::config
(
	$ensure = "present"
) inherits icecast::params
{
	# require Class["icecast::packages"]
}
