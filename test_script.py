import requests

# Test 1: Anasayfa yanıt veriyor mu?
response = requests.get("http://localhost:8080")
assert response.status_code == 200, "Anasayfa yanıt vermiyor!"

# Test 2: Sayfa içeriği kontrolü
assert "Welcome to Chat App" in response.text, "Sayfa içeriği hatalı!"
print("Tüm testler başarıyla geçti.")
