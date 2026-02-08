FROM debian:bookworm-slim

WORKDIR /build

RUN apt-get update && apt-get install -y \
  build-essential \
  gnu-efi \
  && rm -rf /var/lib/apt/lists/*

CMD ["make"]
