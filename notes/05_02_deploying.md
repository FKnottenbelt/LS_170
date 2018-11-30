# Deploying a Sinatra application to production (Heroku)
[05-02 and 05-03]

# preparing for deployment



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

4. Check that the the `RACK_ENV` environment variable to "production"
```
$ heroku config
=== ls-rb170-book-viewer Config Vars
LANG:     en_US.UTF-8
RACK_ENV: production
```

