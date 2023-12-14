# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Unique Elements
${unq_appPage}    //div[@class='app_logo']

# Buttons and Redirections
${btn_cartTop}    //a[@class='shopping_cart_link']
${btn_bugerMenu}    //img[@alt='Open Menu']

# Sort Elements
${drd_sortProduct}    //select[@class='product_sort_container']
${opt_name_az}    //option[@value='az']
${opt_name_za}    //option[@value='za']
${opt_price_lohi}    //option[@value='lohi']
${opt_price_hilo}    //option[@value='hilo']

# Product Images
${img_sauceLabsBackpack}    //img[@alt='Sauce Labs Backpack']
${img_sauceLabsBike}    //img[@alt='Sauce Labs Bike Light']
${img_sauceLabsBoltTshirt}    //img[@alt='Sauce Labs Bolt T-Shirt']
${img_sauceLabsFleeceJacket}    //img[@alt='Sauce Labs Fleece Jacket']
${img_sauceLabsOnesie}    //img[@alt='Sauce Labs Onesie']
${img_sauceLabsRedTshirt}    //img[@alt='Test.allTheThings() T-Shirt (Red)']

# Product Titles
${txt_backpack_title}    //a[@id='item_4_title_link']/div
${txt_bikeLight_title}    //a[@id='item_0_title_link']/div
${txt_boltTshirt_title}    //a[@id='item_1_title_link']/div
${txt_fleeceJacket_title}    //a[@id='item_5_title_link']/div
${txt_onesie_title}    //a[@id='item_2_title_link']/div
${txt_redTshirt_title}    //a[@id='item_3_title_link']/div

# Product Description
${txt_backpack_desc}    //div[@class='inventory_list']/div[1]/div[2]/div[1]/div[1]
${txt_bikeLight_desc}    //div[@class='inventory_list']/div[2]/div[2]/div[1]/div[1]
${txt_boltTshirt_desc}    //div[@class='inventory_list']/div[3]/div[2]/div[1]/div[1]
${txt_fleeceJacket_desc}    //div[@class='inventory_list']/div[4]/div[2]/div[1]/div[1]
${txt_onesie_desc}    //div[@class='inventory_list']/div[5]/div[2]/div[1]/div[1]
${txt_redTshirt_desc}    //div[@class='inventory_list']/div[6]/div[2]/div[1]/div[1]

# Product Prices
${txt_backpack_price}    //div[@class='inventory_list']//div[1]//div[2]//div[2]//div[1]
${txt_bikeLight_price}    //div[@class='inventory_list']//div[2]//div[2]//div[2]//div[1]
${txt_boltTshirt_price}    //div[@class='inventory_list']//div[3]//div[2]//div[2]//div[1]
${txt_fleeceJacket_price}    //div[@class='inventory_list']//div[4]//div[2]//div[2]//div[1]
${txt_onesie_price}    //div[@class='inventory_list']//div[5]//div[2]//div[2]//div[1]
${txt_redTshirt_price}    //div[@class='inventory_list']//div[6]//div[2]//div[2]//div[1]

# Product Add to Cart Button
${btn_backpack_addToCart}    //button[@id='add-to-cart-sauce-labs-backpack']
${btn_bikeLight_addToCart}    //button[@id='add-to-cart-sauce-labs-bike-light']
${btn_boltTshirt_addToCart}    //button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
${btn_fleeceJacket_addToCart}    //button[@id='add-to-cart-sauce-labs-fleece-jacket']
${btn_onesie_addToCart}    //button[@id='add-to-cart-sauce-labs-onesie']
${btn_redTshirt_addToCart}    //button[@id='add-to-cart-test.allthethings()-t-shirt-(red)']
# ====================================================================================================




# ====================================================================================================
*** Keywords ***
App Page Setup
    Login Setup
    Login As Standard User
# ====================================================================================================