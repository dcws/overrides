#
# Cookbook Name:: app_whosay_www
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# Setup apache virtual host and corresponding tomcat configs
  port = new_resource.port
  app_root = new_resource.root
  version = node[:app][:version].to_i
  apache_docroot = "#{app_root}/current/ROOT"

  log "  Configuring apache vhost for www"
  # See https://github.com/rightscale/cookbooks/blob/master/apache2/definitions/web_app.rb for the "web_app" definition.
  web_app "http-#{port}-#{node[:web_apache][:server_name]}.vhost" do
    template 'www_vhost.erb'
    cookbook 'app_whosay_www'
    docroot apache_docroot
    vhost_port port.to_s
    server_name node[:web_apache][:server_name]
    allow_override node[:web_apache][:allow_override]
    apache_log_dir node[:apache][:log_dir]
  end

  web_app "z_http-#{port}-#{node[:web_apache][:server_name]}.vhost" do
    template 'short_vhost.erb'
    cookbook 'app_whosay_www'
    docroot apache_docroot
    vhost_port port.to_s
    server_name node[:web_apache][:server_name]
    allow_override node[:web_apache][:allow_override]
    apache_log_dir node[:apache][:log_dir]
  end
