maintainer       "RightScale, Inc."
maintainer_email "support@rightscale.com"
license          "Copyright RightScale, Inc. All rights reserved."
description      "Installs the tomcat application server."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "13.3.0"

# supports "centos", "~> 5.8", "~> 6"
# supports "redhat", "~> 5.8"
# supports "ubuntu", "~> 10.04", "~> 12.04"

depends "app"
depends "repo"
depends "rightscale"
depends "app_tomcat"

recipe "app_whosay_www::setup_vhost",
  "Sets up the www app vhosts: www + sayly"

attribute "app_whosay_www/short/vhost",
  :display_name => "vhost for short-codes",
  :description => "The vhost name for the shortcode url",
  :required => "required",
  :default => "changeme",
  :recipes => [ "app_whosay_www::setup_vhost" ]
