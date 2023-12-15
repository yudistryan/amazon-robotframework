import math

def revertList(list):
    return list[::-1]

def sumAllPrice(list):
    total = 0
    for price in list:
        total += float(price.split('$')[1])
    return str(total)

def getTax(total_purchase):
    return str('{:.2f}'.format(float(total_purchase)*0.08,2))

def getCurrencyValue(string):
    return string.split('$')[1]