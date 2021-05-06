FROM golang:1.15-alpine

RUN apk add --no-cache git

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src//app/go-sample-app

# We want to populate the module cache based on the go.{mod,sum} files.
COPY . .

# Build the Go app
RUN go get -v
RUN go build -o server

# This container exposes port 10000 to the outside world
EXPOSE 10000

# Run the binary program produced by `go install`
CMD ["./server"]