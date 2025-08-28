function saveFile(path, content)
    local file = fs.open(path, "w")
    if file then    
        file.write(content)
        file.close()
        print("File saved successfully to " .. path)
    else
        print("Error: Could not open file for writing.")
    end
end


print("Please enter the path in which you want to save the file: ")
local path = read()

-- Print a message to prompt the user
print("Please enter the URL to retrieve:")

-- Use the read() function to get the user's input
-- The program will wait here until the user types something and presses Enter 
local url = read()

-- Check if the input is a valid string
if url then
    -- Attempt to make the HTTP GET request
    local response = http.get(url)

    -- Check if the request was successful
    if response then
        -- Read and print the content
        local content = response.readAll()
        print("Response received:")
        saveFile(path, content)
        response.close()
    else
        -- Print an error message if the request failed
        print("Error: Failed to connect to the provided URL.")
    end
else
    -- Print an error if no URL was entered
    print("No URL was entered. Exiting program.")
end