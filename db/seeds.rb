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

Product.destroy_all
Brand.destroy_all
Offer.destroy_all
Article.destroy_all
Category.destroy_all

puts "Cleaning OK"
puts "Creating categories..."

categories = [
  "Fauteuils / Units",
  "Imagerie extra-orale",
  "Imagerie intra-orale",
  "Scialytiques et Luminaires",
  "Hygiène et Stérilisation",
  "Compresseurs et aspirations",
  "Instrumentations - Appareils de table",
  "Mobilier"
]

categories.each { |category| Category.create!(name: category) }

fauteuil_unit = Category.find_by(name: "Fauteuils / Units")
extra_orale = Category.find_by(name: "Imagerie extra-orale")
intra_orale = Category.find_by(name: "Imagerie intra-orale")
eclairages = Category.find_by(name: "Scialytiques et Luminaires")
hygiene = Category.find_by(name: "Hygiène et Stérilisation")
compresses = Category.find_by(name: "Compresseurs et aspirations")
instrumentations = Category.find_by(name: "Instrumentations - Appareils de table")
mobilier = Category.find_by(name: "Mobilier")

Category.create!(name: "Radiographie panoramique", parent: extra_orale)
Category.create!(name: "Générateurs X-Ray", parent: intra_orale)
Category.create!(name: "Capteurs numériques", parent: intra_orale)
Category.create!(name: "Lecteurs de plaques", parent: intra_orale)
Category.create!(name: "Scanners intra-oraux", parent: intra_orale)
Category.create!(name: "Caméras intra-orales", parent: intra_orale)
Category.create!(name: "Scialytiques", parent: eclairages)
Category.create!(name: "Plafonniers", parent: eclairages)
Category.create!(name: "Dalles lumière du jour", parent: eclairages)
Category.create!(name: "Appareils de désinfection", parent: hygiene)
Category.create!(name: "Thermosoudeuses", parent: hygiene)
Category.create!(name: "Aspirations", parent: compresses)
Category.create!(name: "Compresseurs", parent: compresses)
Category.create!(name: "Colonnes", parent: compresses)
Category.create!(name: "Récupérateurs d'amalgames", parent: compresses)
Category.create!(name: "Meubles dentaires", parent: mobilier)

puts "Categories created!"
puts "Creating brands..."

brands = [ "Airel Quetin", "Belmont", "Castellini", "Meunier Carus", "Tecnodent" ]
base_url = "https://res.cloudinary.com/dlrov9mea/image/upload"

brands_images_url = [
  "#{base_url}/v1739457872/logo_airel_t2d6vw.png",
  "#{base_url}/v1739457872/logo_belmont_hmi2xj.png",
  "#{base_url}/v1739457874/logo_castellini_eni7kw.png",
  "#{base_url}/v1739457871/logo_meunier_carus_kkwqd2.png",
  "#{base_url}/v1739457874/logo_tecnodent_mgpyww.png"
]
brands_colors = [ [ "#F3196A", "#F7679D" ], [ "#076FBA", "#5CA0D2" ], [ "#1B3362", "#697998" ], [ "#168CA9", "#65B3C6" ], [ "#0866B2", "#5C9ACC" ] ]
brands_websites_urls = [ "https://airel.com/", "https://belmont.fr/", "https://www.castellini.com/fr/", "https://meunier-carus.fr/", "https://www.tecnodent.com/" ]

brands.each_with_index do |brand, index|
  Brand.create!(
    name: brand,
    image_url: brands_images_url[index],
    primary_color: brands_colors[index][0],
    secondary_color: brands_colors[index][1],
    website_url: brands_websites_urls[index])
end

puts "Brands created!"
puts "Creating products..."

# ------------------------------ Airel Products -------------------------------

airel = Brand.find_by(name: "Airel Quetin")
airels = [ "PE9", "K2", "Pacific III", "Cart Evo", "Selle Harley" ]
airel_product_images_url = [ "#{base_url}/v1739457901/PE9_fy2fyw.png",
                            "#{base_url}/v1739457902/K2_iyqujg.png",
                            "#{base_url}/v1739457901/pacific_znziei.png",
                            "#{base_url}/v1739457902/cart_evo_b59b5a.png",
                            "#{base_url}/v1739457902/harley_rzebyk.png"
                           ]
airel_product_pdfs_url = [ "#{base_url}/v1739457912/PE9_ofsz59.pdf",
                          "#{base_url}/v1739461697/K2_jvv8sr.pdf",
                          "#{base_url}/v1739457912/pacific_jh2ejc.pdf",
                          "#{base_url}/v1739457904/cart_evolution_dkra8h.pdf",
                          "#{base_url}/v1739457904/harley_wffkzq.pdf"
                         ]
airel_product_descriptions = [ "Le PE9 a été conçu afin de s’adapter à toutes les positions de travail. Ses fonctionnalités en font un unit ambidextre universel.",
                              "A la fois compact et adaptable, le K2 propose une hygiène irréprochable et un confort maximum.",
                              "La gamme ambidextre Pacific propose une assise monocoque assurant un grand confort au praticien et au patient.",
                              "Le cart Quetin mobile Evolution s'adapte au travail du praticien, entre 10h et 14h, en toute mobilité, dans tout type de cabinet.",
                              "Le siège opérateur Harley offre une assise ergonomique stable, notamment grâce à une excellente inclinaison des jambes."
                            ]
airels.each_with_index do |airel_name, index|
  airel.products.create!(
    name: airel_name,
    image_url: airel_product_images_url[index],
    pdf_url: airel_product_pdfs_url[index],
    description: airel_product_descriptions[index],
    category: fauteuil_unit
  )
end

# ----------------------------- Belmont Products --------------------------------------------

belmont = Brand.find_by_name("Belmont")
belmonts = [ "Eurus S1", "Eurus S6", "Eurus S8", "Eurus S4", "Cart Eurus" ]
belmont_product_images_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1734530521/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S1/Eurus-S1_h7sy7t.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1734530615/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S4/Eurus-S4_f55fyy.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1734530638/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S6/Eurus-S6_d99cw1.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1734530660/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S8/Eurus-S8_thke7i.png",
                              "https://res.cloudinary.com/dmlvtscck/image/upload/v1734530718/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Cart%20Eurus/Eurus-cart_pmrjft.png"
                            ]
belmont_product_pdfs_url = [ "#{base_url}/v1726750961/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S1/Eurus_S1_rnybvk.pdf",
                            "#{base_url}/v1726750965/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S6/EURUS_S6_French_20211101_OL_uoqnlx.pdf",
                            "#{base_url}/v1726750963/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S8/Eurus_S8_lcrvqw.pdf",
                            "#{base_url}/v1726750960/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Eurus%20S4/eurus_S4_n7ilfl.pdf",
                            "#{base_url}/v1726750963/Access%20dental/Produits/Fauteuils%20:%20units/Belmont/Cart%20Eurus/CART-EURUS_rimgqy.pdf"
                           ]
belmont_product_descriptions = [ "L'Eurus S1 propose une grande variété de fonctionnalités pour un encombrement minimum requis d’à peine 1m80 de large.",
                              "Le fauteuil Belmont Eurus S6 allie le côté ergonomique de la tablette praticien au confort patient amené par la position chaise",
                              "L’Eurus S8 est l’incarnation du luxe et du confort à la japonaise. Il offre une excellente stabilité et une sécurité maximale.",
                              "Le mécanisme hydraulique du fauteuil Eurus S4 assure souplesse et discrétion, offrant un confort optimal au patient.",
                              "Le cart mobile Eurus, proposé par Belmont, est idéal pour la chirurgie et adaptable à tout type de cabinet."
                            ]
belmonts.each_with_index do |belmont_name, index|
  belmont.products.create!(
    name: belmont_name,
    image_url: belmont_product_images_url[index],
    pdf_url: belmont_product_pdfs_url[index],
    description: belmont_product_descriptions[index],
    category: fauteuil_unit
  )
end

# -----------------------Castellini Products -------------------------------

castellini = Brand.find_by_name("Castellini")
castellinis = [ "Puma Eli R", "Puma Eli Ambi", "Skema 5", "Skema 6", "Skema 8", "Cart chir" ]
castellini_product_images_url = [ "#{base_url}/v1726750972/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20R/pumaR_vhocci.png",
                                  "#{base_url}/v1726750978/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20ambidextre/pumaAmbi_rveyg1.png",
                                  "#{base_url}/v1726750968/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%205/skema5_qpwo6f.png",
                                  "#{base_url}/v1726750978/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%206/skema6_pmflr3.png",
                                  "#{base_url}/v1726750966/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%208/skema8_djxzk3.png",
                                  "#{base_url}/v1726750966/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Cart/cart_ejdart.png"
                                ]
castellini_product_pdfs_url = [ "#{base_url}/v1726750977/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20R/Castellini_Puma_Eli_15.5.24_FR_idikam.pdf",
                                 "#{base_url}/v1726750982/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Puma%20Eli%20ambidextre/CA_Puma_Eli_Ambidextrous_15.5.24_FR_npddzz.pdf",
                                 "#{base_url}/v1726750972/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%205/Castellini_Skema_5_15.5.24_FR_ijd9vm.pdf",
                                 "#{base_url}/v1726750982/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%206/Castellini_Skema_6_15.5.24_FR_xwsgvy.pdf",
                                 "#{base_url}/v1726750971/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Skema%208/Castellini_Skema_8_8.5.24_FR_mcuuvx.pdf",
                                 "#{base_url}/v1726750968/Access%20dental/Produits/Fauteuils%20:%20units/Castellini/Cart/CA_Surgical_cart_8SETT2023_FR_jhbm9l.pdf"
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
    image_url: castellini_product_images_url[index],
    pdf_url: castellini_product_pdfs_url[index],
    description: castellini_product_descriptions[index],
    category: fauteuil_unit
  )
end
puts "Products created!"

puts "Creating articles..."

articles = [ "Changement de direction chez Access Dental", "Congrès International de l'association des Dentistes de France", "Nouveau scanner intra-oral OWANDY-IOS" ]
articles_pre_contents = [ "Thibault Paquet succèdera à Laurent Bergeron en tant que Directeur de la Société.",
                          "Le Congrès International ADF aura lieu du 26 au 30 Novembre 2024.",
                          "Scannez immédiatement, sans préchauffage. 60 secondes pour la bouche entière."
                        ]
articles_content = [  "Grosse année de changement chez Access Dental qui voit Laurent Bergeron laisser sa place à Thibault Paquet en tant que directeur. Fort de ces nombreuses années passées en tant que commercial pour le groupe blabla, il ne fait aucun doute que Thibault sera la personne idéale pour reprendre le flambeau.",
                      "Comme chaque année, le Congrès International de l'association des dentistes de France aura lieu à Paris du 26 au 30 Novembre 2024, vous aurez le plaisir d'y retrouver toute l'equipe d'access dental ainsi que la grande majorité de nos partenaires. Nous vous y attenderons avec impatience ! ",
                      "Scannez immédiatement, pas de temps de préchauffage. 20 secondes arcade complète, 60 secondes pour la bouche entière. Grâce à des images de Haute Fidélité et au transfert de données ultra rapide!, Meilleur rapport prix/précision. Aucun mouvement mécanique, elle reste précise!"
                  ]
articles_images_url = [ "#{base_url}/v1729849385/Access%20dental/Images/thibault_j6zzf1.jpg",
                        "#{base_url}/v1737061741/Access%20dental/Images/congres_im1lpq.jpg",
                        "#{base_url}/v1729849386/Access%20dental/Images/owandy_j636dt.png" ]

articles.each_with_index do |article, index|
  Article.create!(
    title: article,
    pre_content: articles_pre_contents[index],
    content: articles_content[index],
    image_url: articles_images_url[index],
    position: index + 1
  )
end
puts "...articles created!"

offers = [ "Owandy", "NSK", "Durr Dental", "Gamasonic", "Bien Air", "Acteon" ]
offers_images_url = [ "https://www.access-dental.fr/wp-content/uploads/2024/10/Owandy_ADF_24.png",
                      "https://www.access-dental.fr/wp-content/uploads/2025/01/NSK_S1_25.png",
                      "https://www.access-dental.fr/wp-content/uploads/2024/10/Durr_Dental_ADF_2024.png",
                      "https://www.access-dental.fr/wp-content/uploads/2024/10/Gamasonic_ADF_24.png",
                      "https://www.access-dental.fr/wp-content/uploads/2024/10/Bien_Air_S2.png",
                      "https://www.access-dental.fr/wp-content/uploads/2024/10/acteon_ADF_24.png" ]
offers_pdfs_url = [ "https://www.access-dental.fr/wp-content/uploads/2024/10/Owandy_ADF_24.pdf",
                    "https://www.access-dental.fr/wp-content/uploads/2024/10/NSK_S2.pdf",
                    "https://www.access-dental.fr/wp-content/uploads/2024/10/Durr_Dental_ADF_2024.pdf",
                    "https://www.access-dental.fr/wp-content/uploads/2024/10/Gamasonic_ADF_24.pdf",
                    "https://www.access-dental.fr/wp-content/uploads/2024/10/Bien_Air_S2.pdf",
                    "https://www.access-dental.fr/wp-content/uploads/2024/10/acteon_ADF_24.pdf" ]

puts "Creating offers..."

offers.each_with_index do |offer, index|
  Offer.create!(
    name: offer,
    image_url: offers_images_url[index],
    position: index + 1,
    pdf_url: offers_pdfs_url[index]
  )
end
puts "Success"
puts "Creating additional brands..."
additional_brands = [ "Acteon", "Bien Air", "Carestream", "Cattani", "DBI", "Dental Art", "Dürr Dental", "Ekom", "EMS", "Euronda", "Faro", "Gamain", "Gamasonic", "Gcomm", "Intercontidental", "Itero", "Metasys", "Mocom", "NSK", "Owandy", "Zenium" ]
additional_brands_images_url = [ "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750922/Access%20dental/Images/logos/logo_acteon_ygrz3c.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750920/Access%20dental/Images/logos/logo_bien_air_nm1eog.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750923/Access%20dental/Images/logos/logo_carestream_nw4slr.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750922/Access%20dental/Images/logos/logo_cattani_zxx5h3.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750924/Access%20dental/Images/logos/logo_DBI_h2phoo.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750917/Access%20dental/Images/logos/logo_dental_art_kuavt4.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750918/Access%20dental/Images/logos/logo_durr_dental_g2u57c.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750923/Access%20dental/Images/logos/logo_EMS_ztzwpg.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1734457747/Access%20dental/Images/logos/logo_ekom_dq69f7.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750916/Access%20dental/Images/logos/logo_euronda_ypplbr.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750922/Access%20dental/Images/logos/logo_faro_tnsh4e.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750919/Access%20dental/Images/logos/logo_Gamain_dahuca.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750919/Access%20dental/Images/logos/logo_gamasonic_t5hsrh.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750917/Access%20dental/Images/logos/logo_gcomm_wwg8pr.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750919/Access%20dental/Images/logos/logo_intercontidental_vfhysm.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1734459015/Access%20dental/Images/logos/logo_itero_ymsdpd.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1734458340/Access%20dental/Images/logos/logo_mocom_rudeec.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750916/Access%20dental/Images/logos/logo_metasys_x4mxax.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750915/Access%20dental/Images/logos/logo_NSK_i328eh.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750924/Access%20dental/Images/logos/logo_owandy_hyiiq8.png",
                                  "https://res.cloudinary.com/dmlvtscck/image/upload/v1726750918/Access%20dental/Images/logos/logo_zenium_ucg5fb.png"
                                ]
  additional_brands.each_with_index do |brand, index|
    Brand.create!(
    name: brand,
    primary_color: "#000000",
    secondary_color: "#000000",
    website_url: "https://www.access-dental.fr/",
    image_url: additional_brands_images_url[index]
  )
end

puts "Success"
puts "Seeding done!"
