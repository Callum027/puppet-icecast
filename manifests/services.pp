# == Class: icecast::services
#
# Start services required by the module.
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
#  include icecast::services
#
#  class
#  { "icecast::services":
#          ensure => "stopped"
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
class icecast::services
(
	$ensure		= "present",
	$services 	= $icecast::params::darkice_services
) inherits icecast::params
{
	# Packages have to be installed before we can start services.
	unless(defined("icecast::packages"))
	{
		fail("icecast::services requires the icecast::packages class to be defined")
	}

	# Check if ensure has a valid value.
	if ($ensure == "present")
	{
		$service_ensure = "running"
	}
	elsif ($ensure == "absent")
	{
		$service_ensure = "stopped"
	}
	elsif ($ensure =~ /^(running|stopped|true|false)$/
	{
		$service_ensure = $ensure
	}
	else
	{
		fail("$ensure is not supported for ensure. Allowed values are 'present', 'absent', 'running', 'stopped', 'true' and 'false.")
	}

	service
	{ $services:
		ensure		=> $service_ensure,
		require		=> Class["icecast::packages"],
		subscribe	=> Class["icecast::config"],
	}
}
