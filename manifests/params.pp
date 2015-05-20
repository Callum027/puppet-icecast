# == Class: icecast::params
#
# Defines system-specific parameters for the module.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  include icecast::params
#
# === Authors
#
# Callum Dickinson <callum@huttradio.co.nz>
#
# === Copyright
#
# Copyright 2015 Callum Dickinson.
#
class icecast::params
{
	case $::osfamily
	{
		"Debian":
		{
			# Executable files.

			# Icecast configuration variables.
			$icecast_packages	= [ "icecast2" ]
			$icecast_services	= [ "icecast2" ]
		}

		# RedHat support will come at a later time!

		default:
		{
			fail("Sorry, but this module does not support the $::osfamily OS family at this time")
		}
	}
}
