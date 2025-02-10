#!/bin/bash

# Set the desired URL
URL="http://localhost:5200"

# Run the .NET application with the specified URL
dotnet run --urls "$URL"
