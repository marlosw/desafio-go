FROM golang:alpine3.10 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -ldflags "-w" .

FROM scratch

WORKDIR /usr/app

COPY --from=builder /usr/src/app/hello .

CMD ["./hello"]
