import pyodbc


# Get connection parameters from environment variables
server = 'SERVERNAME'
database = 'databasename'
username = 'username'
password = 'password'

# Create connection string
connection_string = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"

# Connect to SQL Server
cnxn = pyodbc.connect(connection_string)

# Execute SQL query
cursor = cnxn.cursor()
cursor.execute("SELECT * FROM Configuration")

# Fetch results
for row in cursor:
    print(row)