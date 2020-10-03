# Python Flask app example
FROM heroku/heroku:18

RUN apt-get -qq update && \
    apt-get install -y \
        curl \
        python3 \
        python3-pip \
        bash && \
        pip3 --version && \
        python3 --version

# setup Python libs
ADD ./app/requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

# User account to use
RUN useradd -m carbonchat
USER carbonchat

ADD app /opt/carbonchat
WORKDIR /opt/carbonchat

# EXPOSE 5000
# default should be 5000
CMD gunicorn --bind 0.0.0.0:$PORT wsgi 