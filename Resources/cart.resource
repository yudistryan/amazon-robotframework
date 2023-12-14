# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Page Unique Elements
${unq_yourCartPage}    //span[@class='title'][contains(.,'Your Cart')]

# Product Titles
# Not an exact product, it's precisely to address the first until sixth row of product's name in 'Your Cart' page.
${txt_first_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[3]/div[2]/a[1]/div[1]
${txt_second_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[4]/div[2]/a[1]/div[1]
${txt_third_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[5]/div[2]/a[1]/div[1]
${txt_fourth_name_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[6]/div[2]/a[1]/div[1]
${txt_fifth_name_cart}        //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[7]/div[2]/a[1]/div[1]
${txt_sixth_name_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[8]/div[2]/a[1]/div[1] 
    
# Product Prices
# Not an exact product, it's precisely to address the first until sixth row of product's price in 'Your Cart' page.
${txt_first_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[3]/div[2]/div[2]/div[1]
${txt_second_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[4]/div[2]/div[2]/div[1]
${txt_third_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[5]/div[2]/div[2]/div[1]
${txt_fourth_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[6]/div[2]/div[2]/div[1]
${txt_fifth_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[7]/div[2]/div[2]/div[1]
${txt_sixth_price_cart}    //body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[8]/div[2]/div[2]/div[1]
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
# ====================================================================================================
