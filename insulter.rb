require 'sinatra'
require 'urmum'
require 'haml'

get '/' do
  haml :index
end

post '/' do
  @reply = Insulter.new.insult_with(params[:input]) unless params[:input].nil?
  haml :index
end

__END__

@@layout
%html
  %head
    %title Urmum: an insulter
    %link{rel: 'stylesheet', href: '/stylesheets/app.css'}
  %body
    = yield
    %footer
      %a{ href: "https://github.com/dgmstuart/urmum_web"} source on github 
      (Sinatra)

@@index
%form{ action:"/", method: "post" } 
  %input{ name: "input", type: "text" }>
  %button{ type: "submit" } GO
- unless @reply.nil? || @reply ==""
  %p.reply= @reply
