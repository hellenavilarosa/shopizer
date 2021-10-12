import requests

while True:
    response = requests.get('http://34.217.21.120:8080/shop/cart/shoppingCart.html')
    response = requests.get('http://34.217.21.120:8080/shop/customer/registration.html')
    response = requests.get('http://34.217.21.120:8080/shop/category/beach-bags.html/ref=c:1')
    response = requests.get('http://34.217.21.120:8080/shop/order/checkout.html')
    response = requests.get('http://34.217.21.120:8080/shop/')
    response = requests.get('http://34.217.21.120:8080/shop/customer/customLogon.html')
    response = requests.get('http://34.217.21.120:8080/shop/store/contactus.html')
    print (response.status_code)
