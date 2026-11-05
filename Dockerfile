FROM alpine:3.20

RUN apk add --no-cache git openssh-client ca-certificates bash

COPY clone.sh /bin/clone.sh
RUN chmod +x /bin/clone.sh

ENTRYPOINT ["/bin/clone.sh"]
