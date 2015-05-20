# == Class: icecast::packages
#
# Install packages required by the module.
#
# === Parameters
#
# [*ensure*]
#   What state the packages should be in. Uses the same valid values as the ensure parameter
#   for the package resource.
#
# [*packages*]
#   The list of packages to install. Valid value types are a string or an array of strings.
#
# === Variables
#
# === Examples
#
#  include icecast::packages
#
#  class
#  { "icecast::packages":
#          ensure => "latest"
#  }
#
# === Authors
#
# Callum Dickinson <callum@huttradio.co.nz>
#
# === Copyright
#
# Copyright 2015 Callum Dickinson.
#
class icecast::packages
(
	$ensure		= "installed",
	$packages 	= $icecast::params::icecast_packages
) inherits icecast::params
{
	package
	{ $packages:
		ensure	=> $ensure,
	}
}
