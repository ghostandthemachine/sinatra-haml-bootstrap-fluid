# Sinatra + Haml + Bootstrap

##Main components of project

####Sinatra
- Sinatra [site](http://www.sinatrarb.com/)

####Haml
- Haml [site](http://haml.info/)

####Bootstrap
- Bootstrap [site](http://twitter.github.io/bootstrap/)
- The examples from the Twitter.github.com site can be found [here](http://twitter.github.com/bootstrap/examples.html)


#### Setup
All of the example projects and the bare bones project are set up with:
    - Bundler
    - Shotgun
    - Rack
    - Haml
    - Vlad the Deployer

To get up and running all that should be needed is to install the Ruby gem
Bundler if up don't already have it installed then run:
    
    $ bundle install

  That should install everything that is need for the app to run. To start it run:
    
    
    $ shotgun
    

Update the config.ru file to change Shotgun settings. Likewise /config/deploy.rb for the Vlad settings and
Gemfile for your bundler install settings



## Similar templates
The Sinatra, Haml, Bootstrap versions can be found here

- [Starter](https://github.com/ghostandthemachine/sinatra-haml-bootstrap-starter)
- [Hero](https://github.com/ghostandthemachine/sinatra-haml-bootstrap-hero)
- [Fluid](https://github.com/ghostandthemachine/sinatra-haml-bootstrap-fluid)
