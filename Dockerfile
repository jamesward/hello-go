FROM golang:1.12 as builder

WORKDIR /go/src/github.com/jamesward/hello-go
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -v -o helloworld

FROM alpine
RUN apk add --no-cache ca-certificates

COPY --from=builder /go/src/github.com/jamesward/hello-go/helloworld /helloworld

CMD ["/helloworld"]