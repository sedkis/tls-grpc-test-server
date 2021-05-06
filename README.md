# tls-grpc-test-server


## From Source

1. To run, simply run:
```
$ go run server.go
```

we can then curl it from the command line.

2. add 'tls-grpc-test-server' to your `/etc/hosts`

3. then, use grpcurl to request data from the server.
```bash
$ grpcurl -insecure -proto route_guide.proto -d '{"latitude": 413628156, "longitude":-749015468}' tls-grpc-test-server:10000 routeguide.RouteGuide/GetFeature
```
We give it "insecure" flag because of the self-signed certificates. 

Response:
```json
{
     "name": "U.S. 6, Shohola, PA 18458, USA",
     "location": {
       "latitude": 413628156,
       "longitude": -749015468
     }
   }
```


## Docker

To build and run a docker image:
```
$ docker build -t sedkis/tls-grpc-test-server:1.0.0 .
```

Run:
```
$ docker run --rm -p 10000:10000 sedkis/tls-grpc-test-server:1.0.0         
2021/05/06 20:22:40 TLS ON.
```