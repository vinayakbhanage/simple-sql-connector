FROM python:3.10-slim

# Install required ODBC driver and libraries
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    unixodbc-dev \
    unixodbc \
    freetds-dev \
    freetds-bin \
    tdsodbc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Install pip requirements
RUN pip install -r requirements.txt

CMD ["python3", "main.py"]


# # FROM ubuntu:18.04

# # RUN apt update -y  &&  apt upgrade -y && apt-get update
# # RUN apt update && apt install -y python3-pip openjdk-8-jdk unixodbc-dev

# # # Add SQL Server ODBC Driver 17 for Ubuntu 18.04
# # RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
# # RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
# # RUN apt-get update
# # RUN ACCEPT_EULA=Y apt-get install -y --allow-unauthenticated msodbcsql17
# # RUN ACCEPT_EULA=Y apt-get install -y --allow-unauthenticated mssql-tools
# # RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
# # RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

# # WORKDIR /app
# # COPY . .

# # # Install pip requirements
# # RUN pip install -r requirements.txt

# # CMD ["python3", "main.py"]

#####Error while docker run######

# Traceback (most recent call last):
#   File "/app/main.py", line 14, in <module>
#     cnxn = pyodbc.connect(connection_string)
# pyodbc.Error: ('01000', "[01000] [unixODBC][Driver Manager]Can't open lib 'ODBC Driver 17 for SQL Server' : file not found (0) (SQLDriverConnect)")

##################################
