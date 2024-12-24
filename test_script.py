import requests

# Test 1: Is the homepage responsive?
response = requests.get("http://localhost:8080")
assert response.status_code == 200, "Homepage is not responding!"

# Test 2: Check page content
assert "Welcome to Color App" in response.text, "Page content is incorrect!"
print("All tests are successful")
