# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Seeding DB"
puts "Cleaning"

Category.destroy_all
Offer.destroy_all
Article.destroy_all
Brand.destroy_all

puts "Cleaning OK"
puts "Creating Categories............"

categories = [
  "Fauteuils / units",
  "Imagerie extra-orale",
  "Imagerie intra-orale",
  "Éclairages",
  "Hygiène et Stérilisation",
  "Compresseurs et aspirations",
  "Mobilier",
  "Gabarits",
  "Instrumentations - Appareils de table"
]

categories.each { |category| Category.create!(name: category) }

puts "Success"
puts "Creating Brands..........."

brands = [ "Airel Quetin", "Belmont", "Tecnodent", "Meunier Carus", "Castellini" ]
brands_images_url = [
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750916/Access%20dental/Images/logos/logo_airel_lfk6vc.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750919/Access%20dental/Images/logos/logo_belmont_llfcox.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750921/Access%20dental/Images/logos/logo_tecnodent_rlin9j.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750920/Access%20dental/Images/logos/logo_meunier_carus_iq7zov.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750923/Access%20dental/Images/logos/logo_castellini_wv0noe.png"
]
brands_colors = [ [ "#F3196A", "#F7679D" ], [ "#076FBA", "#5CA0D2" ], [ "#0866B2", "#5C9ACC" ], [ "#168CA9", "#65B3C6" ], [ "#1B3362", "#697998" ] ]

fauteuil = Category.find_by_name("Fauteuils / units")
brands.each_with_index do |brand, index|
  Brand.create!(
    category: fauteuil,
    name: brand,
    position: index + 1,
    image_url: brands_images_url[index],
    primary_color: brands_colors[index][0],
    secondary_color: brands_colors[index][1]
  )
end

puts "Success"
puts "Creating Products............"

# ------------------------------ Airel Products -------------------------------

airel = Brand.find_by_name("Airel Quetin")
airels = [ "PE9", "K2", "Pacific", "Cart", "Harley" ]
airel_product_images_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750942/Access%20dental/Produits/Fauteuils%20:%20units/Airel/PE9/PE9_wyog7e.png",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750946/Access%20dental/Produits/Fauteuils%20:%20units/Airel/K2/K2_fmxlfb.png",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750940/Access%20dental/Produits/Fauteuils%20:%20units/Airel/Pacific/pacific_k1nhpi.png",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750940/Access%20dental/Produits/Fauteuils%20:%20units/Airel/Cart/cart_evo_jakzz8.png",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750945/Access%20dental/Produits/Fauteuils%20:%20units/Airel/Harley/harley_yvmqqs.png"
                           ]
airel_product_pdfs_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750950/Access%20dental/Produits/Fauteuils%20:%20units/Airel/PE9/PE9_tkpnox.pdf",
                          "https://res.cloudinary.com/dmlvtscck/image/upload/v1726756480/Access%20dental/Produits/Fauteuils%20:%20units/Airel/K2/K2_compressed_wdlq9g.pdf",
                          "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750949/Access%20dental/Produits/Fauteuils%20:%20units/Airel/Pacific/pacific_kab5ct.pdf",
                          "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750939/Access%20dental/Produits/Fauteuils%20:%20units/Airel/Cart/cart_evolution_xhfbh1.pdf",
                          "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750946/Access%20dental/Produits/Fauteuils%20:%20units/Airel/Harley/harley_wstczp.pdf"
                         ]
airels.each_with_index do |airel_name, index|
  airel.products.create!(
    name: airel_name,
    position: index + 1,
    image_url: airel_product_images_url[index],
    pdf_url: airel_product_pdfs_url[index]
  )
end

# ----------------------------- Belmont Products --------------------------------------------

belmont = Brand.find_by_name("Belmont")
belmonts = ["Eurus S1", "Eurus S6", "Eurus S8", "Eurus S4", "Cart Eurus"]
belmont_product_images_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750959/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S1/Eurus_S1_es54oz.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750964/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S6/Eurus-S6_z4iyzh.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750960/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S8/Eurus-S8_ttpzxv.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750957/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S4/Eurus_S4_vtioiv.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750961/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Cart%20Eurus/cart_eurus_z5pi05.png"
                            ]
belmont_product_pdfs_url = ["https://res.cloudinary.com/dmlvtscck/image/upload/v1726750961/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S1/Eurus_S1_rnybvk.pdf",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750965/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S6/EURUS_S6_French_20211101_OL_uoqnlx.pdf",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750963/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S8/Eurus_S8_lcrvqw.pdf",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750960/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S4/eurus_S4_n7ilfl.pdf",
                            "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750963/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Cart%20Eurus/CART-EURUS_rimgqy.pdf"
                           ]
belmonts.each_with_index do |belmont_name, index|
  belmont.products.create!(
    name: belmont_name,
    position: index + 1,
    image_url: belmont_product_images_url[index],
    pdf_url: belmont_product_pdfs_url[index]
  )
end
puts "Success"
puts "Seeding done !"
