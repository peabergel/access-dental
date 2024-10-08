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

brands = [ "Airel Quetin", "Belmont", "Castellini", "Meunier Carus", "Tecnodent" ]
brands_images_url = [
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750916/Access%20dental/Images/logos/logo_airel_lfk6vc.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750919/Access%20dental/Images/logos/logo_belmont_llfcox.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750923/Access%20dental/Images/logos/logo_castellini_wv0noe.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750920/Access%20dental/Images/logos/logo_meunier_carus_iq7zov.png",
  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750921/Access%20dental/Images/logos/logo_tecnodent_rlin9j.png"
]
brands_colors = [ [ "#F3196A", "#F7679D", "#F5F6F9" ], [ "#076FBA", "#5CA0D2", "#E7F1F9" ], [ "#1B3362", "#697998", "#E1E2E3" ], [ "#168CA9", "#65B3C6", "#CCE6ED" ], [ "#0866B2", "#5C9ACC", "#CFE1F1" ] ]
brands_websites_urls = ["https://airel.com/", "https://belmont.fr/", "https://www.castellini.com/fr/", "https://meunier-carus.fr/", "https://www.tecnodent.com/" ]

fauteuil = Category.find_by_name("Fauteuils / units")
brands.each_with_index do |brand, index|
  Brand.create!(
    category: fauteuil,
    name: brand,
    position: index + 1,
    image_url: brands_images_url[index],
    primary_color: brands_colors[index][0],
    secondary_color: brands_colors[index][1],
    tertiary_color: brands_colors[index][2],
    website_url: brands_websites_urls[index]
  )
end

puts "Success"
puts "Creating Products............"

# ------------------------------ Airel Products -------------------------------

airel = Brand.find_by_name("Airel Quetin")
airels = [ "PE9", "K2", "Pacific III", "Cart Evo", "Selle Harley" ]
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
airel_product_descriptions = ["Le PE9 a été conçu afin de s’adapter à toutes les positions de travail. Ses fonctionnalités en font un unit ambidextre universel.",
                              "A la fois compact et adaptable, le K2 propose une hygiène irréprochable et un confort maximum.",
                              "La gamme ambidextre Pacific propose une assise monocoque assurant un grand confort au praticien et au patient.",
                              "Le cart Quetin mobile Evolution s'adapte au travail du praticien, entre 10h et 14h, en toute mobilité, dans tout type de cabinet.",
                              "Le siège opérateur Harley offre une assise ergonomique stable, notamment grâce à une excellente inclinaison des jambes."
                            ]
airels.each_with_index do |airel_name, index|
  airel.products.create!(
    name: airel_name,
    position: index + 1,
    image_url: airel_product_images_url[index],
    pdf_url: airel_product_pdfs_url[index],
    description: airel_product_descriptions[index]
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
belmont_product_descriptions = ["L'Eurus S1 propose une grande variété de fonctionnalités pour un encombrement minimum requis d’à peine 1m80 de large.",
                              "Le fauteuil Belmont Eurus S6 allie le côté ergonomique de la tablette praticien au confort patient amené par la position chaise",
                              "L’Eurus S8 est l’incarnation du luxe et du confort à la japonaise. Il offre une excellente stabilité et une sécurité maximale.",
                              "Le mécanisme hydraulique du fauteuil Eurus S4 assure souplesse et discrétion, offrant un confort optimal au patient.",
                              "Le cart mobile Eurus, proposé par Belmont, est idéal pour la chirurgie et adaptable à tout type de cabinet."
                            ]
belmonts.each_with_index do |belmont_name, index|
  belmont.products.create!(
    name: belmont_name,
    position: index + 1,
    image_url: belmont_product_images_url[index],
    pdf_url: belmont_product_pdfs_url[index],
    description: belmont_product_descriptions[index]
  )
end

# -----------------------Castellini Products -------------------------------

castellini = Brand.find_by_name("Castellini")
castellinis = [ "Puma Eli R", "Puma Eli Ambi", "Skema 5", "Skema 6", "Skema 8", "Cart chir" ]
castellini_product_images_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750972/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20R/pumaR_vhocci.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750978/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20ambidextre/pumaAmbi_rveyg1.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750968/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%205/skema5_qpwo6f.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750978/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%206/skema6_pmflr3.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750966/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%208/skema8_djxzk3.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750966/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Cart/cart_ejdart.png"
                                ]
castellini_product_pdfs_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750977/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20R/Castellini_Puma_Eli_15.5.24_FR_idikam.pdf",
                                 "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750982/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20ambidextre/CA_Puma_Eli_Ambidextrous_15.5.24_FR_npddzz.pdf",
                                 "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750972/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%205/Castellini_Skema_5_15.5.24_FR_ijd9vm.pdf",
                                 "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750982/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%206/Castellini_Skema_6_15.5.24_FR_xwsgvy.pdf",
                                 "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750971/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%208/Castellini_Skema_8_8.5.24_FR_mcuuvx.pdf",
                                 "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750968/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Cart/CA_Surgical_cart_8SETT2023_FR_jhbm9l.pdf"
                                ]
castellini_product_descriptions = [ "Grâce à ses caractéristiques, Puma ELI R accompagne le dentiste durant son travail quotidien, avec légèreté et facilité.",
                                "Puma ELI Ambidextre garde l’élan d’un style minimaliste et garantit des performances toujours en phase avec vos besoins.",
                                "Avec Skema 5, le praticien affronte la journée de travail en toute sérénité. Un style léger au service de l’excellence opérationnelle.",
                                "Conçu pour les praticiens les plus exigeants et polyvalents, Skema 6 offre une ample modularité de configurations.",
                                "Fidèle à la qualité sans compromis de Castellini, Skema 8 anticipe l’avenir de la clinique dentaire.",
                                "Le Cart Chirurgical autonome est idéal pour pratiquer l’implantologie et l’endodontie sans être lié à un fauteuil."
                              ]
castellinis.each_with_index do |castellini_name, index|
  castellini.products.create!(
    name: castellini_name,
    position: index + 1,
    image_url: castellini_product_images_url[index],
    pdf_url: castellini_product_pdfs_url[index],
    description: castellini_product_descriptions[index]
  )
end
puts "Success"
puts "Seeding done !"
