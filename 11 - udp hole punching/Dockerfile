FROM gcc:latest
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN gcc -o introducer introducer.c
CMD ["./introducer"]
