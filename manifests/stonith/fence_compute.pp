# == Define: pacemaker::stonith::fence_compute
#
# Module for managing Stonith for fence_compute.
#
# WARNING: Generated by "rake generate_stonith", manual changes will
# be lost.
#
# === Parameters
#
# [*tenant_name*]
#   Keystone Admin Tenant or v3 Project
#
# [*auth_url*]
#   Keystone Admin Auth URL
#
# [*port*]
#   Physical plug number, name of virtual machine or UUID
#
# [*passwd_script*]
#   Script to retrieve password
#
# [*region_name*]
#   Region Name
#
# [*passwd*]
#   Login password or passphrase
#
# [*endpoint_type*]
#   Nova Endpoint type
#
# [*action*]
#   Fencing Action
#
# [*login*]
#   Login Name
#
# [*plug*]
#   Physical plug number, name of virtual machine or UUID
#
# [*username*]
#   Login Name
#
# [*password*]
#   Login password or passphrase
#
# [*password_script*]
#   Script to retrieve password
#
# [*insecure*]
#   Allow Insecure TLS Requests
#
# [*domain*]
#   DNS domain in which hosts live
#
# [*project_domain*]
#   Keystone v3 Project Domain
#
# [*user_domain*]
#   Keystone v3 User Domain
#
# [*instance_filtering*]
#   Allow instances to be evacuated
#
# [*no_shared_storage*]
#   Disable functionality for dealing with shared storage
#
# [*record_only*]
#   Only record the target as needing evacuation
#
# [*verbose*]
#   Verbose mode
#
# [*debug*]
#   Write debug information to given file
#
# [*debug_file*]
#   Write debug information to given file
#
# [*separator*]
#   Separator for CSV created by operation list
#
# [*power_wait*]
#   Wait X seconds after issuing ON/OFF
#
# [*login_timeout*]
#   Wait X seconds for cmd prompt after login
#
# [*delay*]
#   Wait X seconds before fencing is started
#
# [*power_timeout*]
#   Test X seconds for status change after ON/OFF
#
# [*shell_timeout*]
#   Wait X seconds for cmd prompt after issuing command
#
# [*retry_on*]
#   Count of attempts to retry power on
#
#  [*interval*]
#   Interval between tries.
#
# [*ensure*]
#   The desired state of the resource.
#
# [*tries*]
#   The number of tries.
#
# [*try_sleep*]
#   Time to sleep between tries.
#
# [*pcmk_host_list*]
#   List of Pacemaker hosts.
#
# [*meta_attr*]
#   (optional) String of meta attributes
#   Defaults to undef
#
# === Dependencies
#  None
#
# === Authors
#
# Generated by rake generate_stonith task.
#
# === Copyright
#
# Copyright (C) 2016 Red Hat Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
define pacemaker::stonith::fence_compute (
  $tenant_name        = undef,
  $auth_url           = undef,
  $port               = undef,
  $passwd_script      = undef,
  $region_name        = undef,
  $passwd             = undef,
  $endpoint_type      = undef,
  $action             = undef,
  $login              = undef,
  $plug               = undef,
  $username           = undef,
  $password           = undef,
  $password_script    = undef,
  $insecure           = undef,
  $domain             = undef,
  $project_domain     = undef,
  $user_domain        = undef,
  $instance_filtering = undef,
  $no_shared_storage  = undef,
  $record_only        = undef,
  $verbose            = undef,
  $debug              = undef,
  $debug_file         = undef,
  $separator          = undef,
  $power_wait         = undef,
  $login_timeout      = undef,
  $delay              = undef,
  $power_timeout      = undef,
  $shell_timeout      = undef,
  $retry_on           = undef,

  $meta_attr          = undef,
  $interval           = '60s',
  $ensure             = present,
  $pcmk_host_list     = undef,

  $tries              = undef,
  $try_sleep          = undef,

) {
  $tenant_name_chunk = $tenant_name ? {
    undef   => '',
    default => "tenant_name=\"${tenant_name}\"",
  }
  $auth_url_chunk = $auth_url ? {
    undef   => '',
    default => "auth_url=\"${auth_url}\"",
  }
  $port_chunk = $port ? {
    undef   => '',
    default => "port=\"${port}\"",
  }
  $passwd_script_chunk = $passwd_script ? {
    undef   => '',
    default => "passwd_script=\"${passwd_script}\"",
  }
  $region_name_chunk = $region_name ? {
    undef   => '',
    default => "region_name=\"${region_name}\"",
  }
  $passwd_chunk = $passwd ? {
    undef   => '',
    default => "passwd=\"${passwd}\"",
  }
  $endpoint_type_chunk = $endpoint_type ? {
    undef   => '',
    default => "endpoint_type=\"${endpoint_type}\"",
  }
  $action_chunk = $action ? {
    undef   => '',
    default => "action=\"${action}\"",
  }
  $login_chunk = $login ? {
    undef   => '',
    default => "login=\"${login}\"",
  }
  $plug_chunk = $plug ? {
    undef   => '',
    default => "plug=\"${plug}\"",
  }
  $username_chunk = $username ? {
    undef   => '',
    default => "username=\"${username}\"",
  }
  $password_chunk = $password ? {
    undef   => '',
    default => "password=\"${password}\"",
  }
  $password_script_chunk = $password_script ? {
    undef   => '',
    default => "password_script=\"${password_script}\"",
  }
  $insecure_chunk = $insecure ? {
    undef   => '',
    default => "insecure=\"${insecure}\"",
  }
  $domain_chunk = $domain ? {
    undef   => '',
    default => "domain=\"${domain}\"",
  }
  $project_domain_chunk = $project_domain ? {
    undef   => '',
    default => "project_domain=\"${project_domain}\"",
  }
  $user_domain_chunk = $user_domain ? {
    undef   => '',
    default => "user_domain=\"${user_domain}\"",
  }
  $instance_filtering_chunk = $instance_filtering ? {
    undef   => '',
    default => "instance_filtering=\"${instance_filtering}\"",
  }
  $no_shared_storage_chunk = $no_shared_storage ? {
    undef   => '',
    default => "no_shared_storage=\"${no_shared_storage}\"",
  }
  $record_only_chunk = $record_only ? {
    undef   => '',
    default => "record_only=\"${record_only}\"",
  }
  $verbose_chunk = $verbose ? {
    undef   => '',
    default => "verbose=\"${verbose}\"",
  }
  $debug_chunk = $debug ? {
    undef   => '',
    default => "debug=\"${debug}\"",
  }
  $debug_file_chunk = $debug_file ? {
    undef   => '',
    default => "debug_file=\"${debug_file}\"",
  }
  $separator_chunk = $separator ? {
    undef   => '',
    default => "separator=\"${separator}\"",
  }
  $power_wait_chunk = $power_wait ? {
    undef   => '',
    default => "power_wait=\"${power_wait}\"",
  }
  $login_timeout_chunk = $login_timeout ? {
    undef   => '',
    default => "login_timeout=\"${login_timeout}\"",
  }
  $delay_chunk = $delay ? {
    undef   => '',
    default => "delay=\"${delay}\"",
  }
  $power_timeout_chunk = $power_timeout ? {
    undef   => '',
    default => "power_timeout=\"${power_timeout}\"",
  }
  $shell_timeout_chunk = $shell_timeout ? {
    undef   => '',
    default => "shell_timeout=\"${shell_timeout}\"",
  }
  $retry_on_chunk = $retry_on ? {
    undef   => '',
    default => "retry_on=\"${retry_on}\"",
  }

  $pcmk_host_value_chunk = $pcmk_host_list ? {
    undef   => '$(/usr/sbin/crm_node -n)',
    default => $pcmk_host_list,
  }

  $meta_attr_value_chunk = $meta_attr ? {
    undef   => '',
    default => "meta ${meta_attr}",
  }

  # $title can be a mac address, remove the colons for pcmk resource name
  $safe_title = regsubst($title, ':', '', 'G')

  Exec<| title == 'wait-for-settle' |> -> Pcmk_stonith<||>

  $param_string = "${tenant_name_chunk} ${auth_url_chunk} ${port_chunk} ${passwd_script_chunk} ${region_name_chunk} ${passwd_chunk} ${endpoint_type_chunk} ${action_chunk} ${login_chunk} ${plug_chunk} ${username_chunk} ${password_chunk} ${password_script_chunk} ${insecure_chunk} ${domain_chunk} ${project_domain_chunk} ${user_domain_chunk} ${instance_filtering_chunk} ${no_shared_storage_chunk} ${record_only_chunk} ${verbose_chunk} ${debug_chunk} ${debug_file_chunk} ${separator_chunk} ${power_wait_chunk} ${login_timeout_chunk} ${delay_chunk} ${power_timeout_chunk} ${shell_timeout_chunk} ${retry_on_chunk}  op monitor interval=${interval} ${meta_attr_value_chunk}"

  if $ensure != 'absent' {
    ensure_resource('package', 'fence-agents-compute', { ensure => 'installed' })
    Package['fence-agents-compute'] -> Pcmk_stonith["stonith-fence_compute-${safe_title}"]
  }
  pcmk_stonith { "stonith-fence_compute-${safe_title}":
    ensure           => $ensure,
    stonith_type     => 'fence_compute',
    pcmk_host_list   => $pcmk_host_value_chunk,
    pcs_param_string => $param_string,
    tries            => $tries,
    try_sleep        => $try_sleep,
  }
}
