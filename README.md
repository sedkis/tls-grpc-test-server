# tls-grpc-test-server


## Start

1. To run, simply run:
```
$ go run server.go
```

we can then curl it from the command line.

2. add 'tls-grpc-test-server' to your `/etc/hosts`

3. then, use grpcurl to request data from the server.
```bash
$ grpcurl -proto route_guide.proto -d '{"latitude": 413628156, "longitude":-749015468}' tls-grpc-test-server:10000 routeguide.RouteGuide/GetFeature
```

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