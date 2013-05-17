#
# Cookbook Name:: app_whosay_www
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# Setup apache virtual host and corresponding tomcat configs
  port = 80

  log "  Configuring apache vhost for misc whosay vhosts"
  web_app "z_http-#{port}-#{node[:app_whosay_www][:domain_name]}.vhost" do
    template 'bare_vhost.erb'
    cookbook 'app_whosay_lb'
    vhost_port port.to_s
    server_name node[:app_whosay_www][:domain_name]
  end

  web_app "z_http-#{port}-#{node[:app_whosay_www][:short_name]}.vhost" do
    template 'short_vhost.erb'
    cookbook 'app_whosay_lb'
    vhost_port port.to_s
    server_name node[:app_whosay_www][:short_name]
  end

  web_app "z_http-#{port}-#{node[:app_whosay_www][:combo_name]}.vhost" do
    template 'combo_vhost.erb'
    cookbook 'app_whosay_lb'
    vhost_port port.to_s
    server_name node[:app_whosay_www][:combo_name]
  end
