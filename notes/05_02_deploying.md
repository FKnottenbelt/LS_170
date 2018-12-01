# Deploying a Sinatra application to production (Heroku)
[05-02 and 05-03]

# preparing for deployment
1. Prevent the application from reloading in production by
adding `if development?` to the line that requires
sinatra/reloader

2. Specify a Ruby version in Gemfile so that Heroku knows
the exact version of Ruby to use when serving the project
```
Gemfile
ruby '2.4.1'
```

3. Configure your application to use a production web server.
```
Gemfile
group :production do
  gem "puma"
end
```

4. Create a config.ru file in the root of the project that
tells the web server, which in this case will be Puma, how
to start the application
```
config.ru
require "./book_viewer"
run Sinatra::Application
```

5. Create a file called Procfile in the root of the project
with the following contents:
```
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
```
6. Test your Procfile locally. Use the `heroku local` command.


# delpoying to Heroku
1. Create a Heroku application using `heroku apps:create $NAME`, where
$NAME is the application name you wish to use.
```
$ heroku apps:create ls-rb170-book-viewer
```

2. Push the project to the new Heroku application using git push
heroku master (nb from you own master branch!):
```
$ git push heroku master
```

3. Visit your application and verify that everything is working
```
$heroku open
```

4. Check that the the `RACK_ENV` environment variable to "production"
```
$ heroku config
=== ls-rb170-book-viewer Config Vars
LANG:     en_US.UTF-8
RACK_ENV: production
```

***

> install Heroku Cli

test: heroku --version
The command to install Heroku on the cloud IDE.
```
$ source <(curl -sL https://cdn.learnenough.com/heroku_install)
```
see: https://www.railstutorial.org/book/beginning#sec-heroku_setup