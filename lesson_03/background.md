# Server
taken together as unified concept, the server-side infrastructure in
its entirety is the "server" to the client
```
       webserver
           ^
           v
    application server
           ^
           v
        data store
```
3 primary server-sideinfrastructure pieces: a `web server`,
an `application server` and a `data store`.

A `web server` is typically a server that responds to static assets:
files, images, css, javascript, etc. These requests don't require
any data processing, so can be handled by a simple web server.

An `application server`, on the other hand, is typically where
application or business logic resides, and is where more complicated
requests are handled. This is where your server-side code lives when
deployed.

The application server will often consult a `persistent data store`,
like a relational database, to retrieve or create data. Data stores
can also be simple files, key/value stores, document stores and many
other variations, as long as it can save data in some format for
later retrieval and processing.

