FROM jpetazzo/dind

RUN apt-get update -y
RUN apt-get install -y software-properties-common

# Install docker-compose
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update -y
RUN apt-get install -y build-essential python-pip git
RUN pip install docker-compose