> Server

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

> HTTP over TCP/IP

HTTP is what's known as an `application layer protocol`, which means it's
just a convention or agreement between two parties. That's all HTTP is: an
agreement on how to format a string request.

`TCP` (Transmission Control Protocol) is a protocol that manages the sending
and receiving of data in the form of data packets.

HTTP is along the lines of a convention and only operates at the application
layer, while the OSI model specifies communication rules among systems on
the internet across all layers. HTTP uses TCP/IP under the hood as the
transport and network layers; it's actually TCP/IP that's doing all the
heavy lifting and ensuring that the request/response cycle gets completed
between your browser and the server.


> TCP

`TCP` (Transmission Control Protocol)
A protocol that manages the sending and receiving of data in the form of data
packets.
Packes may arrive out of order. Get checked at destination by TCP for
'completenes'. If all there, fine, get reassembled. If not, aks for
resend. TCP is 'checklist checker'

TCP provides the delivery of a stream of bytes from a program from one
computer to another computer. TCP is also in charge of controlling size,
flow control, the rate of data exchange, and network traffic congestion.

TCP provides communication services at an intermediate level between an
application program and the IP. What this means is that when an application
program wants to send a large piece of data across the internet using the
IP, instead of breaking the data into sizes that will fit the IP and using
a series of requests from the IP, the software is capable of issuing a
single request to TCP and let this protocol handle the details of the IP
transfer. TCP detects problems that arise in the IP, requests retransmission
of the packets that were lost, rearranges the order of the packets (so that
they are put back into their proper order), and helps to minimise network
congestion (in order to reduce the occurrence of other problems down the
line). Once all this has been done and the proper copy of the data has
been compiled, the packet is passed along to application program.


> create your own TCP server

we'll use a class that starts with `TCP` when we create a server.
When we do write our own TCP servers, we might call them "HTTP servers",
because we're sending HTTP-compliant requests and responses using the TCP
connection.

Keep the below diagram in your head as you follow along with creating
our own TCP (or HTTP) server:

```
'server':

       request                  response
          v                        ^
       -------------------------------
                our TCP server
                     ^
                     v
                our Ruby code
      ----------------------------------
```
In the above diagram, our entire application is comprised of our TCP server
and some Ruby code.