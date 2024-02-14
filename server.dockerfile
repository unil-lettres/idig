FROM golang:1.20-bullseye

# Set the working directory
WORKDIR /server

# Download necessary Go modules
# from the server directory
COPY idig-server/go.mod ./
COPY idig-server/go.sum ./
RUN go mod download

# Copy the Go source code from the server
# directory into the image
COPY idig-server/*.go ./

# Build the server
RUN go build -o /usr/local/go/bin/idig-server

# Create root directory for the server data
RUN mkdir ./data

# Start the server (listening on port 9000 by default)
CMD ["idig-server", "start"]
