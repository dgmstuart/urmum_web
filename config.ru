require './insulter'
require 'sass/plugin/rack'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sinatra::Application
