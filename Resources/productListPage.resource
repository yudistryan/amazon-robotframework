# ====================================================================================================
*** Settings ***
Resource    general.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# Page Unique Elements
${unq_appPage}    //div[@class='app_logo']

# Shopping Cart
${btn_cartTop}    //a[@class='shopping_cart_link']

# Sidebar Menu
${btn_burger_sidebar}    //img[@alt='Open Menu']
${btn_allItems_sidebar}    //a[@id='inventory_sidebar_link']
${btn_about_sidebar}    //a[@id='about_sidebar_link']
${btn_logout_sidebar}    //a[@id='logout_sidebar_link']
${btn_resetAppState_sidebar}    //a[@id='reset_sidebar_link']
${btn_close_sidebar}    //button[@id='react-burger-cross-btn']

# Sort Feature Elements
${drd_sortProduct}    //select[@class='product_sort_container']
${opt_name_az}    //option[@value='az']
${opt_name_za}    //option[@value='za']
${opt_price_lohi}    //option[@value='lohi']
${opt_price_hilo}    //option[@value='hilo']

# Products Image
${img_sauceLabsBackpack}    //img[@alt='Sauce Labs Backpack']
${img_sauceLabsBike}    //img[@alt='Sauce Labs Bike Light']
${img_sauceLabsBoltTshirt}    //img[@alt='Sauce Labs Bolt T-Shirt']
${img_sauceLabsFleeceJacket}    //img[@alt='Sauce Labs Fleece Jacket']
${img_sauceLabsOnesie}    //img[@alt='Sauce Labs Onesie']
${img_sauceLabsRedTshirt}    //img[@alt='Test.allTheThings() T-Shirt (Red)']

# Products Title
${txt_backpack_title}    //a[@id='item_4_title_link']/div
${txt_bikeLight_title}    //a[@id='item_0_title_link']/div
${txt_boltTshirt_title}    //a[@id='item_1_title_link']/div
${txt_fleeceJacket_title}    //a[@id='item_5_title_link']/div
${txt_onesie_title}    //a[@id='item_2_title_link']/div
${txt_redTshirt_title}    //a[@id='item_3_title_link']/div

# Products Description
${txt_backpack_desc}    //div[@class='inventory_list']/div[1]/div[2]/div[1]/div[1]
${txt_bikeLight_desc}    //div[@class='inventory_list']/div[2]/div[2]/div[1]/div[1]
${txt_boltTshirt_desc}    //div[@class='inventory_list']/div[3]/div[2]/div[1]/div[1]
${txt_fleeceJacket_desc}    //div[@class='inventory_list']/div[4]/div[2]/div[1]/div[1]
${txt_onesie_desc}    //div[@class='inventory_list']/div[5]/div[2]/div[1]/div[1]
${txt_redTshirt_desc}    //div[@class='inventory_list']/div[6]/div[2]/div[1]/div[1]

# Products Price
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

# Social Media
${btn_twitter}    //a[normalize-space()='Twitter']
${btn_facebook}    //a[normalize-space()='Facebook']
${btn_linkedin}    //a[normalize-space()='LinkedIn']
# ====================================================================================================




# ====================================================================================================
*** Keywords ***
App Page Setup
    Login Setup
    Login As Standard User
# ====================================================================================================