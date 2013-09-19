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
  %body
    = yield

@@index
%form{ action:"/", method: "post" } 
  %input{ name: "input" }
  %input{ type: "submit" }
- unless @reply.nil? || @reply ==""
  %p.reply= @reply
