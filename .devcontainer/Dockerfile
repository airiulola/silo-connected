FROM ubuntu:22.04

# Install required packages
RUN apt-get update && \
    apt-get install -y curl git jq tar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Go
ENV VERSION=1.22.0 \
    OS=linux \
    ARCH=amd64
RUN curl -OL https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz && \
    tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz && \
    rm go$VERSION.$OS-$ARCH.tar.gz

# Create a non-root user `user` and setup home directory
RUN useradd -m user

# Set environment variables for Go and user `user`
ENV PATH="$PATH:/usr/local/go/bin:/home/user/go/bin:/home/user/.cargo/bin" \
    GOPATH="/home/user/go" \
    GOBIN="/home/user/go/bin"

# Change ownership of the go directory and workspace to `user`
RUN mkdir -p /home/user/go/bin /home/user/go/src /home/user/.cargo/bin && \
    chown -R user:user /home/user

# Switch to your user
USER user

# Set working directory to the user's home directory
WORKDIR /home/user

# Copy setup script and execute
COPY setup.sh .
RUN bash setup.sh
