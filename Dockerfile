FROM ibmfunctions/action-python-v3.7

# This is for mongo client version 4.2 on Deb 9 stretch (which is what action-python-3.7 is based on). 

RUN /bin/sh -c " \
        apt-get update && \
        apt-get install -y apt-transport-https && \
        wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - && \
        echo \"deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main\" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
        apt-get update && \
        apt-get install -f -y mongodb-org-shell mongodb-org-tools && \
        pip install --upgrade ibm-cos-sdk ibm-cos-sdk-core ibm-cos-sdk-s3transfer"
