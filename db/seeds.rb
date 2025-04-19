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
User.destroy_all

puts "Cleaning OK"
puts "Creating User"
User.create(email: 'pe.abergel@gmail.com', password:'H2iwvr5C*')
puts "User created"
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
Category.create!(name: "Générateurs RX", parent: intra_orale)
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
  "#{base_url}/v1744964848/logo_airel_nsmcdj.png",
  "#{base_url}/v1744964849/logo_belmont_hqo6pk.png",
  "#{base_url}/v1744964853/logo_castellini_np1uim.png",
  "#{base_url}/v1744964847/logo_meunier_carus_wjhxfu.png",
  "#{base_url}/v1744964852/logo_tecnodent_rhpxdx.png"
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

puts "Creating additional brands..."
additional_brands = [ "Acteon", "Bien Air", "Carestream", "Cattani", "DBI", "Dental Art", "Dürr Dental", "EMS", "Euronda", "Faro", "Gamasonic", "Intercontidental", "Metasys", "Mocom", "Oudin", "NSK", "Owandy", "Oxypharm", "Zenium" ]
additional_brands_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964848/logo_acteon_azyl7b.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964850/logo_bien_air_ehkcbg.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964853/logo_carestream_pt5uyo.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964854/logo_cattani_i68jvf.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964856/logo_DBI_zj0ul8.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964851/logo_dental_art_uhaoju.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964848/logo_durr_dental_tncmb4.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964853/logo_EMS_mhddao.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964851/logo_euronda_ilhfhm.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964855/logo_faro_wacmem.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964848/logo_gamasonic_lxthux.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964854/logo_intercontidental_rt9csu.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964851/logo_metasys_aczont.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964847/logo_mocom_mvpwkb.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964850/logo_oudin_bjwlk3.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964852/logo_NSK_pzqzuk.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964854/logo_owandy_if5dup.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744972492/logo_oxypharm_dqazmb.png",
                                  "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964849/logo_zenium_vk6qag.png"
                                ]
additional_brands_website_url = [ "https://www.acteongroup.com/fr/products/equipement-de-precision/",
                                  "https://dental.bienair.com/fr_fr/products/",
                                  "https://www.carestream.com/fr/fr/",
                                  "https://www.cattani.it/en/",
                                  "https://dbigroupe.com/",
                                  "https://www.dental-art.it/fr/mobilier-dentaire-et-laboratoires/",
                                  "https://www.duerrdental.com/nl/BE/",
                                  "https://www.ems-dental.com/fr",
                                  "https://www.euronda.fr/",
                                  "https://faro.it/fr/",
                                  "https://gamasonic.eu/",
                                  "https://www.intercontidental.com/",
                                  "https://www.metasys.com/",
                                  "https://www.mocom.it/fr/",
                                  "https://oudindentaire.com/",
                                  "https://www.france.nsk-dental.com/",
                                  "https://www.owandy.fr/",
                                  "https://www.oxypharm.net/",
                                  "https://www.zenium.fr/"
]
  additional_brands.each_with_index do |brand, index|
    Brand.create!(
    name: brand,
    primary_color: "#000000",
    secondary_color: "#000000",
    website_url: additional_brands_website_url[index],
    image_url: additional_brands_images_url[index]
  )
end

puts "Success"
puts "Creating products..."

########################### FAUTEUIL UNIT ######################################

# ------------------------------ Airel Products -------------------------------

airel = Brand.find_by(name: "Airel Quetin")
airels = [ "PE9", "K2", "Pacific III", "Cart Evo", "Selle Harley" ]
airel_product_images_url = [ "#{base_url}/v1744964863/PE9_bwxxrv.webp",
                            "#{base_url}/v1744964863/K2_pdyd2w.webp",
                            "#{base_url}/v1744964862/pacific_zkcpou.webp",
                            "#{base_url}/v1744964863/cart_evo_ya20nj.webp",
                            "#{base_url}/v1744964864/harley_tdgufu.webp"
                           ]
airel_product_pdfs_url = [ "#{base_url}/v1744964910/PE9_o0u7bn.pdf",
                          "#{base_url}/v1744964903/K2_o9eupn.pdf",
                          "#{base_url}/v1744964909/pacific_pwpwl6.pdf",
                          "#{base_url}/v1744964874/cart_evolution_g9esmx.pdf",
                          "#{base_url}/v1744964876/harley_civfdr.pdf"
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
belmont_product_images_url = [ "#{base_url}/v1744964859/Eurus_S1_b7cjmf.webp",
                              "#{base_url}/v1744964859/Eurus_S6_pzwt4s.webp",
                              "#{base_url}/v1744964860/EurusS8_psfw5l.webp",
                              "#{base_url}/v1744964860/Eurus_S4_hxoskc.webp",
                              "#{base_url}/v1744964860/cart_eurus_fkxvr3.webp"
                            ]
belmont_product_pdfs_url = [ "#{base_url}/v1744964908/Eurus_S1_j4ia3b.pdf",
                            "#{base_url}/v1744964902/EURUS_S6_French_20211101_OL_pb6yue.pdf",
                            "#{base_url}/v1744964908/Eurus_S8_tscf0p.pdf",
                            "#{base_url}/v1744964908/eurus_S4_ut9wa2.pdf",
                            "#{base_url}/v1744964890/CART-EURUS_zqsypg.pdf"
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
castellini_product_images_url = [ "#{base_url}/v1744964857/pumaR_d9kf3y.webp",
                                  "#{base_url}/v1744964858/pumaAmbi_tltbtq.webp",
                                  "#{base_url}/v1744964857/skema5_fd336p.webp",
                                  "#{base_url}/v1744964858/skema6_ygtdvk.webp",
                                  "#{base_url}/v1744964859/skema8_othh6d.webp",
                                  "#{base_url}/v1744964858/cart_z8gt6a.webp"
                                ]
castellini_product_pdfs_url = [ "#{base_url}/v1744964901/Castellini_Puma_Eli_15.5.24_FR_ukns1a.pdf",
                                 "#{base_url}/v1744964907/CA_Puma_Eli_Ambidextrous_15.5.24_FR_z2zuy5.pdf",
                                 "#{base_url}/v1744964901/Castellini_Skema_5_15.5.24_FR_xncwdy.pdf",
                                 "#{base_url}/v1744964902/Castellini_Skema_6_15.5.24_FR_wbtw2o.pdf",
                                 "#{base_url}/v1744964902/Castellini_Skema_8_8.5.24_FR_coph2r.pdf",
                                 "#{base_url}/v1744964894/CA_Surgical_cart_8SETT2023_FR_cumvkc.pdf"
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

# -----------------------Meunier Carus Products -------------------------------


meunier = Brand.find_by_name("Meunier Carus")
meuniers = [ "Ibiza", "Table MC" ]
meunier_product_images_url = [ "#{base_url}/v1744964861/Ibiza_dm1lau.webp",
                              "#{base_url}/v1744964861/table_nmhksi.webp"
                            ]
meunier_product_descriptions = [ "Sans connexion électrique, vous le posez où vous le souhaitez. Vous ajustez la position avec des commandes mécaniques.",
                              "La table Meunier-Carus vous permet à vous, votre assistante et au patient de vivre une expérience de confort inégalable."
                            ]
meuniers.each_with_index do |meunier_name, index|
  meunier.products.create!(
    name: meunier_name,
    image_url: meunier_product_images_url[index],
    description: meunier_product_descriptions[index],
    category: fauteuil_unit
  )
end

# -----------------------Tecnodent Products -------------------------------

tecnodent = Brand.find_by_name("Tecnodent")
tecnodents = [ "Linda Next", "Sting", "Selle Pluto Le" ]
tecnodent_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964862/linda_lepuqo.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964862/sting_nuynwv.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964861/pluto_le_pduxoa.webp"
                            ]
tecnodent_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964896/Catalogo-Linda-next-24_hpxtrl.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964893/3_Dentaire_Sting_w8yopf.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964892/1_Siege_operateur_Pluto_Venus_gyes7z.pdf"
                                ]
tecnodent_product_descriptions = [ "Solide et flexible, ergonomique et fonctionnel, le Linda Next dispose d'une capacité de levage allant jusqu'à 300 kg.",
                              "Le fauteuil Sting est la combinaison parfaite entre savoir-faire fort, artisanat, matériaux raffinés et design futuriste.",
                              "Le siège-selle Pluto LE aide l'opérateur à travailler dans une posture idéale pour maintenir le dos."
                            ]
tecnodents.each_with_index do |tecnodent_name, index|
  tecnodent.products.create!(
    name: tecnodent_name,
    image_url: tecnodent_product_images_url[index],
    pdf_url: tecnodent_product_pdfs_url[index],
    description: tecnodent_product_descriptions[index],
    category: fauteuil_unit
  )
end

####################################IMAGERIE EXTRA ORALE########################

#-----------------------Radiographie panoramique--------------------------------

#----------------------Owandy products--------------------------------------------------

owandy = Brand.find_by_name("Owandy")
owandys = [ "I-MAX pro", "I-MAX pro 3D", "I-MAX CEPH 3D" ]
owandy_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964884/IMAX_wgnohy.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964885/IMAX_3D_oentnl.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964885/IMAX_ceph_z5uc0p.webp"
                            ]
owandy_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964899/IMAX_zze520.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964899/IMAX_3D_sj9t8v.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964899/IMAX_ceph_r4drna.pdf"
                                ]
owandy_product_descriptions = [ "Avec ses nombreux programmes, l’I-Max vous permet de réaliser tous les examens nécessaires à votre pratique (Enfant / Adulte).",
                              "Grâce à son système innovant automatiquement les meilleures coupes pour afficher une image parfaite.",
                              "L’I-Max CEPH 3D sélectionnera directement les meilleures coupes sans intervention de votre part."
                            ]
owandys.each_with_index do |owandy_name, index|
  owandy.products.create!(
    name: owandy_name,
    image_url: owandy_product_images_url[index],
    pdf_url: owandy_product_pdfs_url[index],
    description: owandy_product_descriptions[index],
    category: Category.find_by_name("Radiographie panoramique")
  )
end

#-----------------------CareStream--------------------------------

carestream_ieo = Brand.find_by_name("Carestream")
carestream_ieos = [ "CS 8100", "CS 8200", "CS 9600" ]
carestream_ieo_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964884/CS8100_V2_s9cze9.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964884/CS82003D_iujjr5.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964883/CS9600_y6pk3v.webp"
                            ]
carestream_ieo_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744965298/doc_carestream_cs_8100_uhymvf.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964899/Brochure_CS_8200_3D_Neo_Edition_FR_ih7a5o.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964898/CS_9600_Brochure_FR_uapjxg.pdf"
                                ]
carestream_ieo_product_descriptions = [ "Découvrez la solution d’imagerie panoramique et céphalométrique choisie par plus de 15 000 cabinets.",
                              "Le plus large éventail de champs d’examen de sa catégorie pour un contrôle total de la zone d'imagerie",
                              "CS9600 est conçu pour traiter un large éventail d'applications dentaires, maxillo-faciales, orthodontiques et ORL."
                            ]
carestream_ieos.each_with_index do |carestream_ieo_name, index|
  carestream_ieo.products.create!(
    name: carestream_ieo_name,
    image_url: carestream_ieo_product_images_url[index],
    pdf_url: carestream_ieo_product_pdfs_url[index],
    description: carestream_ieo_product_descriptions[index],
    category: Category.find_by_name("Radiographie panoramique")
  )
end

#-----------------------Dürr Dental--------------------------------

durrdental_ieo = Brand.find_by_name("Dürr Dental")
durrdental_ieo.products.create!(
  name: "VistaPano S",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964885/vistapano_uwzcqn.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964907/P007-772-03_VistaPanoSCeph2_M3_FR_screen_z3zeti.pdf",
  description: "Avec la VistaPano S 2.0, Dürr Dental définit une nouvelle norme en termes de netteté d’image des clichés extra-oraux.",
  category: Category.find_by_name("Radiographie panoramique")
)

########################### IMAGERIE INTRA ORALE#################################
#------------------------- Genrateurs X-Ray------------------------------------

#-------------------------Owandy iio-----------------------------------------------

owandy_iio = Brand.find_by_name("Owandy")
owandy_iios = [ "RX - DC", "RX portable" ]
owandy_iio_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964871/owandy_RX_hynlwm.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964872/Owandy_RX_portable_khpi9s.webp"
                            ]
owandy_iio_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964895/BR_OWANDYRX-ACDC_FR_REV02_oybxqk.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964903/BR_OWANDY-RX_PORTABLE_FR_Rev00_onymzx.pdf"
                                ]
owandy_iio_product_descriptions = [ "La RX DC a été étudiée pour résister à tout type de sollicitation. Elle est équipée d'un système garantissant leur stabilité.",
                              "Le générateur de rayons X portable Owandy ne pèse que 1,8kg et vous confère une totale autonomie dans vos mouvements."
                            ]
owandy_iios.each_with_index do |owandy_iio_name, index|
  owandy_iio.products.create!(
    name: owandy_iio_name,
    image_url: owandy_iio_product_images_url[index],
    pdf_url: owandy_iio_product_pdfs_url[index],
    description: owandy_iio_product_descriptions[index],
    category: Category.find_by_name("Générateurs RX")
  )
end

#-----------------------Belmont iio--------------------------------

belmont_iio = Brand.find_by_name("Belmont")
belmont_iio.products.create!(
  name: "PHOT-X II Touch",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964869/Phot_X_IIs_nwkpqw.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964889/Phot_X_IIs_hussxe.pdf",
  description: "La radio PHOT-X II Touch proposée par Belmont révolutionne l’imagerie dentaire par sa précision et sa simplicité d’utilisation.",
  category: Category.find_by_name("Générateurs RX")
)

# -------------------------CareStream iio------------------------------

carestream_iio = Brand.find_by_name("Carestream")
carestream_iio.products.create!(
  name: "CS2200",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964870/CS2200_cagmfe.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964891/CS_2200_ltuqb0.pdf",
  description: "La conception compacte et légère du système CS2200 lui permet une grande facilité d'intégration dans la majorité des cabinets.",
  category: Category.find_by_name("Générateurs RX")
)

# -----------------------Durr Dental iio--------------------------------

durrdental_iio = Brand.find_by_name("Dürr Dental")
durrdental_iio.products.create!(
  name: "Vista Intra",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964872/Vistaintra_jgzcne.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964880/web_P007-751_VistaIntra_FR_cnqw3q.pdf",
  description: "La technologie DC du VistaIntra, combinée à son design ergonomique, garantit une intégration fluide et des clichés de haute qualité avec une dose réduite de rayonnement.",
  category: Category.find_by_name("Générateurs RX")
)

# -------------------------------Capteurs numériques----------------------------
#---------------------CareStream-----------------------------------------------


carestream_cn = Brand.find_by_name("Carestream")
carestream_cn.products.create!(
  name: "CS6200",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964870/CS6200_aefpck.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964903/RVG_6200_Brochure_FR_dtqoan.pdf",
  description: "D'une procédure de travail simplifiée à des outils de traitement d'image définis par l'utilisateur, le RVG 6200 est conçu pour fonctionner pour vous (et non l'inverse).",
  category: Category.find_by_name("Capteurs numériques")
)

#----------------------Owandy-------------------------------------------------

owandy_cn = Brand.find_by_name("Owandy")
owandy_cn.products.create!(
  name: "Opteo",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964870/opteo_vhgfks.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964895/BR_OPTEO_FR_REV04_syhga8.pdf",
  description: "Optimisation du temps de visualisation de vos clichés : leur acquisition en haute résolution est instantanée (aucun temps imparti au développement de la plaque).",
  category: Category.find_by_name("Capteurs numériques")
)

#-----------------------------Lecteurs de plaques--------------------------------
#----------------------------Owandy--------------------------------------------

owandy_lp = Brand.find_by_name("Owandy")
owandy_lp.products.create!(
  name: "OWANDY-CR",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964871/Owandy-CR_jghsgk.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964895/CR2_wt7lhj.pdf",
  description: "L'Owandy-CR2 peut s'utiliser en endodontie, en chirurgie prothétique et implantaire, en parodontie, mais également pour vos diagnostics carieux.",
  category: Category.find_by_name("Lecteurs de plaques")
)
#----------------------------Durr Dental------------------------------------

durrdental_cn = Brand.find_by_name("Dürr Dental")
durrdental_cns = [ "Vistascan mini easy", "Vistascan mini view" ]
durrdental_cn_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964869/minieasy_ajqwow.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964870/miniview_fyiha0.webp"
                            ]
durrdental_cn_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964891/VistaScan_Mini_Easy_2_xkj6i0.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964896/P007100210L03_VistaScanMiniView2.0_M5a_FR_Screen_jfmfg6.pdf"
                                ]
durrdental_cn_product_descriptions = [ "Doté d’un design futuriste, le nouveau VistaScan Mini Easy 2.0 abrite une technologie de pointe tout aussi sophistiquée.",
                              "Le scanner d’écrans à mémoire traite les écrans à mémoire IQ VistaScan les plus modernes, avec des fonctions d’IA de toute dernière génération."
                            ]
durrdental_cns.each_with_index do |durrdental_cn_name, index|
  durrdental_cn.products.create!(
    name: durrdental_cn_name,
    image_url: durrdental_cn_product_images_url[index],
    pdf_url: durrdental_cn_product_pdfs_url[index],
    description: durrdental_cn_product_descriptions[index],
    category: Category.find_by_name("Lecteurs de plaques")
  )
end

#---------------------------------------Scanners IO----------------------------
#--------------------------Owandy--------------------------------------------

owandy_sio = Brand.find_by_name("Owandy")
owandy_sio.products.create!(
  name: "OWANDY-IOS",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964869/IOS_n5volr.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964911/BROCHURES_IOS_FR_neqabo.pdf",
  description: "Scannez immédiatement, sans préchauffage, arcade complète, 60 secondes pour la bouche entière. Obtenez des images de Haute Fidélité et un transfert de données ultra rapide.",
  category: Category.find_by_name("Scanners intra-oraux")
)

#-------------------------Caméra intra-orale-----------------------------------
#------------------------Carestream--------------------------------------------

carestream_cio = Brand.find_by_name("Carestream")
carestream_cio.products.create!(
  name: "CS1200",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964868/CS1200_sltsj1.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964875/cameras_-cs1500_1200_trp8xy.pdf",
  description: "Les images HQ permettent à vos patients de mieux comprendre leur situation clinique et vous aident à clarifier les détails avec les compagnies d'assurance.",
  category: Category.find_by_name("Caméras intra-orales")
)
#------------------------Owandy-----------------------------------------------

owandy_cio = Brand.find_by_name("Owandy")
owandy_cio.products.create!(
  name: "Owandy-CAM HD",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964868/owandy_cam_v3l88m.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964890/BR_OWANDY-CAMHD_FR_Rev02_fixomb.pdf",
  description: "Cette nouvelle caméra Owandy-Cam HD continue de vous aidez au quotidien dans la communication avec vos patients, une image vaut mille mots.",
  category: Category.find_by_name("Caméras intra-orales")
)
#-------------------------Actéon-----------------------------------------------

acteon_cio = Brand.find_by_name("Acteon")
acteon_cio.products.create!(
  name: "Sopro 617",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964868/sopro_617_cmavcm.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964893/Acteon_FR_fqwule.pdf",
  description: "La caméra Sopro 617 est équipée d'une vision à 105° et d'une technologie anti-distorsion pour vous offrir une grande profondeur de champs.",
  category: Category.find_by_name("Caméras intra-orales")
)

########################### SCIALYTIQUES ET LUMINAIRES#################################
#----------------------------Scialytiques--------------------------------------------
#----------------------------Belmont SL---------------------------------------------
belmont_sci = Brand.find_by_name("Belmont")
belmont_sci.products.create!(
  name: "D-212",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964886/D212_oskawg.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964886/Comparaison-avec-AL-200-series_bq133a.pdf",
  description: "La conception compacte et légère de l'éclairage opératoire D-212 de Belmont permet une intégration aisée dans la majorité des cabinets, offrant une illumination précise et uniforme pour toutes les procédures dentaires.",
  category: Category.find_by_name("Scialytiques")
)
#----------------------------Faro SL------------------------------------------------
faro_sci = Brand.find_by_name("Faro")
faro_sci.products.create!(
  name: "EVA",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964886/eva_lntlry.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964907/B-EVA4k-FR-Rev001_FARO_gtgwzd.pdf",
  description: "EVA recrée une lumière parfaite ainsi qu’un équilibre visuel idéal, entre couleurs et profondeur.",
  category: Category.find_by_name("Scialytiques")
)
#------------------------------Plafonniers-------------------------------------------
#---------------------------Oudin SL--------------------------------------------------
oudin_pl = Brand.find_by_name("Oudin")
oudin_pls = [ "Dalle 65", "O'LEA", "O'MEDIA", "R'MEDIA" ]
oudin_pl_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964887/dalle_d60_or7nnk.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964887/olea_tmsiei.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964888/omedia_gysgvl.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964887/rmedia_g91pyp.webp"
                            ]
oudin_pl_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964893/OD-FP-OD-PANEL_yxapgf.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964900/OD-FP-olea-media_akb90g.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964901/OD-FP-Omedia_dfopx7.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964900/OD-FP-Rmedia-XL_clo955.pdf"
                                ]
oudin_pl_product_descriptions = [ "Grâce à sa conception compacte et intuitive, le panneau de commande OD-FP-OD-PANEL s’intègre facilement dans la plupart des cabinets, offrant une interface conviviale pour une gestion efficace des équipements dentaires.",
                              "La conception compacte et intuitive de l'interface OD-FP-Olea-Media permet une intégration aisée dans la majorité des cabinets, offrant une gestion centralisée et efficace des équipements multimédias pour une expérience patient améliorée.",
                              "Pensé pour les environnements connectés, le module OD-FP-Omedia facilite l’affichage et le partage de contenus multimédias au fauteuil, tout en s’intégrant discrètement dans les configurations existantes.",
                              "Avec son grand écran intégré et son design épuré, le OD-FP-Rmedia-XL valorise l’expérience patient en permettant la diffusion claire et immersive de contenus au fauteuil."
                            ]
oudin_pls.each_with_index do |oudin_pl_name, index|
  oudin_pl.products.create!(
    name: oudin_pl_name,
    image_url: oudin_pl_product_images_url[index],
    pdf_url: oudin_pl_product_pdfs_url[index],
    description: oudin_pl_product_descriptions[index],
    category: Category.find_by_name("Plafonniers")
  )
end
#----------------------------Zenium SL-----------------------------------------------

zenium_pl = Brand.find_by_name("Zenium")
zenium_pl.products.create!(
  name: "AVISIO Synchro",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964888/Avisio_vkml1r.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964894/zenium-avisio-620-synchro-43-pouces4k_mv74fq.ai",
  description: "Plus qu'un éclairage et plus qu'un écran, Avisio‑LED Synchro 4K.43 est un éclairage conforme à la chromaticité de l'illuminant D65 de la CIE qui communique. ",
  category: Category.find_by_name("Plafonniers")
)


############################# HYGIENE ET STERILISATION ##############################
#----------------------------APPAREILS DE DESINFECTION--------------------------
#----------------------------NSK ADS--------------------------
nsk_ads = Brand.find_by_name("NSK")
nsk_adss = [ "iClave plus", "iClave 24", "ICARE+" ]
nsk_ads_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964881/iclave_dwp5zc.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964882/iclave24_qtdijh.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964883/icare_yhymon.webp"
                            ]
nsk_ads_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964905/autoclave_oylgvu.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964892/NSK-iclave24_brochure_FRA_web_otusqf.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964906/Brochure-iCare_EN_130401_gevmb3.pdf"
                                ]
nsk_ads_product_descriptions = [ "NSK a choisi d'utiliser une chambre en cuivre hautement conductrice pour répondre aux normes de classe B, la norme la plus stricte d'Europe.",
                              "La chambre en acier inoxydable de 24 litres de l'iClave 24 maximise la capacité réelle avec 5 plateaux de 2 dimensions différentes",
                              "Lorsqu’un instrument est nettoyé manuellement et stérilisé, tous les dépôts et résidus ne sont pas supprimés. NSK propose désormais une réponse simple et efficace grâce à l’iCare+"
                            ]
nsk_adss.each_with_index do |nsk_ads_name, index|
  nsk_ads.products.create!(
    name: nsk_ads_name,
    image_url: nsk_ads_product_images_url[index],
    pdf_url: nsk_ads_product_pdfs_url[index],
    description: nsk_ads_product_descriptions[index],
    category: Category.find_by_name("Appareils de désinfection")
  )
end
#----------------------------EURONDA ADS--------------------------
euronda_ads = Brand.find_by_name("Euronda")
euronda_adss = [ "E9 Next", "E10", "Eurosafe 170" ]
euronda_ads_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964879/E9_g9nec2.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964880/E10_ocgiec.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964880/Eurosafe_170_hqgjn4.webp"
                            ]
euronda_ads_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964906/FR_E9_Catalogue_zwlkst.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964905/EUFR_E10_Catalogue_utdjyq.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744965327/FR_Eurosafe_170_Catalogue_hbkpka.pdf"
                                ]
euronda_ads_product_descriptions = [ "Immédiat, efficace et fiable : E9 permet une gestion complète et connectée des données de stérilisation, grâce aux meilleurs systèmes de traçabilité.",
                              "E10 offre la possibilité de sélectionner 5 cycles différents de type B. Il est aussi possible de programmer des tests pour optimiser le temps.",
                              "Grâce à sa chambre de lavage de 170 litres, il peut accueillir jusqu’à 4 charges complètes d’un autoclave de 24 litres, soit plus de 140 instruments."
                            ]
euronda_adss.each_with_index do |euronda_ads_name, index|
  euronda_ads.products.create!(
    name: euronda_ads_name,
    image_url: euronda_ads_product_images_url[index],
    pdf_url: euronda_ads_product_pdfs_url[index],
    description: euronda_ads_product_descriptions[index],
    category: Category.find_by_name("Appareils de désinfection")
  )
end
#----------------------------MOCOM ADS--------------------------
mocom_ads = Brand.find_by_name("Mocom")
mocom_adss = [ "Futura B", "Thetys T60" ]
mocom_ads_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964882/B_Futura_v6jetc.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964883/TETHYS_wzdeac.webp"
                            ]
mocom_ads_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964898/Mocom_BFUTURA_05.2022_FR_rgalta.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964889/161_41_0_m_termodisinfettore_tethys_2014_fr_qjlnpc.pdf"
                                ]
mocom_ads_product_descriptions = [ "Le système intégré permet d'accroître l'efficacité du cabinet en éliminant les problèmes de gestion de l'eau déminéralisée.",
                              "Les nouveaux thermo-désinfecteurs de la série Tethys assurent un très haut niveau de désinfection de manière automatique"
                            ]
mocom_adss.each_with_index do |mocom_ads_name, index|
  mocom_ads.products.create!(
    name: mocom_ads_name,
    image_url: mocom_ads_product_images_url[index],
    pdf_url: mocom_ads_product_pdfs_url[index],
    description: mocom_ads_product_descriptions[index],
    category: Category.find_by_name("Appareils de désinfection")
  )
end
#----------------------------GAMASONIC ADS----------------------------------------
gamasonic_ads = Brand.find_by_name("Gamasonic")
gamasonic_adss = [ "SNC17 - SNC30", "Sonocleaner" ]
gamasonic_ads_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964881/SNC_o1xk8e.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964881/sonocleaner_j2ejvz.webp"
                            ]
gamasonic_ads_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964898/FT-SNCD_V4_20231016-1_exdllj.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964897/PUB-SONOCLEANER_FTSONO_V1_ch5qas.pdf"
                                ]
gamasonic_ads_product_descriptions = [ "Le laveur-désinfecteur SNC Digital 17-EDK7 (ISO 15883-1-5) permet le nettoyage par ultrasons des dispositifs médicaux réutilisables (D.M.R.).",
                              "La cuve de nettoyage par ultrasons Sonocleaner permet de nettoyer efficacement tous vos instruments pour la préparation à la stérilisation."
                            ]
gamasonic_adss.each_with_index do |gamasonic_ads_name, index|
  gamasonic_ads.products.create!(
    name: gamasonic_ads_name,
    image_url: gamasonic_ads_product_images_url[index],
    pdf_url: gamasonic_ads_product_pdfs_url[index],
    description: gamasonic_ads_product_descriptions[index],
    category: Category.find_by_name("Appareils de désinfection")
  )
end
#------------------------------OXYPHARM ADS-----------------------------------------

oxypharm_ads = Brand.find_by_name("Oxypharm")
oxypharm_ads.products.create!(
  name: "AlphaClean",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964882/69638-18913246_hy9i4h.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964906/Brochure_Alpha_Clean_vaidcb.pdf",
  description: "Grâce à sa conception compacte et automatisée, l'Alpha Clean s'intègre facilement dans la majorité des cabinets, assurant une pré-désinfection efficace et sécurisée des instruments médicaux.",
  category: Category.find_by_name("Appareils de désinfection")
)

#------------------------------THERMOSOUDEUSES--------------------------------
#-----------------------------DURR DENTALE TS--------------------------------
durrdental_ts = Brand.find_by_name("Dürr Dental")
durrdental_ts.products.create!(
  name: "Hygopac view",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964878/hygopac_hkdrx1.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964888/P007100138L03_HygopacView_FR_Screen_afcpxq.pdf",
  description: "La technologie de soudure à défilement automatisée facilite le soudage, vous fait gagner du temps et assure une qualité élevée et homogène de soudure.",
  category: Category.find_by_name("Thermosoudeuses")
)
#------------------------------EURONDA TS-----------------------------------
euronda_ts = Brand.find_by_name("Euronda")
euronda_ts.products.create!(
  name: "Euroseal",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964878/euroseal_bzksow.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964892/FR_Euroseal_Catalogue_emqvbo.pdf",
  description: "Euroseal est belle, ergonomique et facile à utiliser. Le couvercle transparent permet d’effectuer des opérations de soudage avec plus de précision.",
  category: Category.find_by_name("Thermosoudeuses")
)
#-------------------------------MOCOM TS----------------------------------------
mocom_ts = Brand.find_by_name("Mocom")
mocom_ts.products.create!(
  name: "MillSeal",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964878/Millseal_klf9po.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964897/Millseal_2018_GB_jufdpr.pdf",
  description: "Grâce à son système d'alimentation automatique et à sa bande de soudure de 15 mm, le thermoscelleur Millseal Rolling assure une stérilisation fiable et rapide, s'intégrant parfaitement dans la majorité des cabinets dentaires.​",
  category: Category.find_by_name("Thermosoudeuses")
)
#-----------------------------NSK TS-------------------------------------------
nsk_ts = Brand.find_by_name("NSK")
nsk_ts.products.create!(
  name: "New Seal",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964879/newseal_f38pjw.pdf",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964879/newseal_fepsbe.webp",
  description: "NewSeal est dotée d’une résistance à réglage automatique qui assure un scellage de 10 mm : la soudure est automatiquement entamée à l’abaissement du levier.",
  category: Category.find_by_name("Thermosoudeuses")
)

#######################################COMPRESSEURDS ET ASPIRATIONS##############################
# ----------------------------------Aspirations------------------------------------------
#-------------------------------------Cattani Asp---------------------------------------
cattani_asp = Brand.find_by_name("Cattani")
cattani_asps = [ "Turbo-Smart", "Turbo-Smart Cube" ]
cattani_asp_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964874/Turbosmart_ri5aew.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964873/turbosmart_cube_iqjyfy.webp"
                            ]
cattani_asp_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964874/Turbosmart_ri5aew.webp",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964904/1-Turbo-Smart-et-Micro-Smart-CUBEpdf_lm5jdd.pdf"
                                ]
cattani_asp_product_descriptions = [ "Turbo-Smart réagit automatiquement à tout problème fonctionnel ou à toute autre situation qui pourrait compromettre l’intégrité de la machine.",
                              "Le système d’aspiration Turbo-Smart Cube est plus compact et plus silencieux tout en étant beaucoup plus performant que les anciennes aspirations."
                            ]
cattani_asps.each_with_index do |cattani_asp_name, index|
  cattani_asp.products.create!(
    name: cattani_asp_name,
    image_url: cattani_asp_product_images_url[index],
    pdf_url: cattani_asp_product_pdfs_url[index],
    description: cattani_asp_product_descriptions[index],
    category: Category.find_by_name("Aspirations")
  )
end
#-------------------------------------Durr Dental Asp------------------------------------
durrdental_asp = Brand.find_by_name("Dürr Dental")
durrdental_asps = [ "Tyscor", "Systemes v et vs", "VC 65" ]
durrdental_asp_product_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964874/Tyscorwebp_e8vr0i.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964872/VS600_xtqcg9.webp",
                              "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964873/VC65_cwuojl.webp"
                            ]
durrdental_asp_product_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964904/DD_100170L03_Tyscor_Next_Gen_M5a_FR_Screen_agdnrq.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964895/DD_620L03_V-VS_Saugsysteme_M2_FR_240108_screen_q93hgf.pdf",
                                 "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964897/DD_100188L03_Flyer_VC_65_FR_Screen_amtzvw.pdf"
                                ]
durrdental_asp_product_descriptions = [ "Les moteurs d'aspiration de DÜRR DENTAL Tyscor sont très solides, fonctionnent sans peine, pendant sept à huit heures de d'activité en continu.",
                              "La gamme d'aspirations Dürr Dental couvre les besoins d’une à six salles de traitement et permet, selon le modèle, un travail simultané allant jusqu’à quatre praticiens.",
                              "Avec la VC 65, les dentistes implantologues et les chirurgiens disposent d’un système d’aspiration mobile et fiable qui garantit un fonctionnement durable sans dysfonctionnement."
                            ]
durrdental_asps.each_with_index do |durrdental_asp_name, index|
  durrdental_asp.products.create!(
    name: durrdental_asp_name,
    image_url: durrdental_asp_product_images_url[index],
    pdf_url: durrdental_asp_product_pdfs_url[index],
    description: durrdental_asp_product_descriptions[index],
    category: Category.find_by_name("Aspirations")
  )
end
#--------------------------------------Metasys Asp------------------------------------------
metasys_asp = Brand.find_by_name("Metasys")
metasys_asp.products.create!(
  name: "Excom Hybrid",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964872/excom_jnqaou.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964904/ZK-55-232-15_Brochure_-Suction-Systems_EN_vhufv2.pdf",
  description: "Grâce à sa conception compacte et modulable, le système d'aspiration central EXCOM hybrid s'intègre aisément dans la majorité des cabinets, offrant une aspiration puissante et constante pour un environnement de traitement optimal.​",
  category: Category.find_by_name("Aspirations")
)

#------------------------------------Compresseurs-----------------------------------------
#--------------------------------------Durr Dental comp-----------------------------------
durrdental_comp = Brand.find_by_name("Dürr Dental")
durrdental_comp.products.create!(
  name: "Silver airline",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964878/silver_t5fxm9.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964911/DD_158L03_SilverAirline_M10_FR_Screen_tynmlr.pdf",
  description: "Les compresseurs DÜRR DENTAL associent qualité supérieure avec robustesse et résistance – et cela presque sans maintenance.",
  category: Category.find_by_name("Compresseurs")
)
#--------------------------------------Cattani comp---------------------------------------
cattani_comp = Brand.find_by_name("Cattani")
cattani_comp.products.create!(
  name: "Oil-less",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964877/oil_less_kmkpzl.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964910/oil_less_knp8ok.pdf",
  description: "Les compresseur sans huile Cattani, équipés d’un dessiccateur et d’une série de filtres, sont en mesure de fournir de l’air sec d’un haut degré de pureté.",
  category: Category.find_by_name("Compresseurs")
)
#------------------------------------Colonnes------------------------------------------
#-------------------------------------Durr Dental col-------------------------------
durrdental_col = Brand.find_by_name("Dürr Dental")
durrdental_col.products.create!(
  name: "Power tower",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964876/Power_tower_dn0wu5.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964890/P100194L03_PowerTowerView_FR_screen_ld4njs.pdf",
  description: "Le Power Tower s’intègre facilement dans le cabinet et vous permet d'économiser de l'espace par rapport à l’installation d’appareils individuels",
  category: Category.find_by_name("Colonnes")
)
#-------------------------------------metasys col--------------------------------
metasys_col = Brand.find_by_name("Metasys")
metasys_col.products.create!(
  name: "META TOWER",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964876/metatower_uyn0zo.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964891/metatower_yiljgl.pdf",
  description: "Un système d'aspiration, un compresseur et un séparateur d'amalgame combinés dans un boîtier compact et élégant : telle est la solution META Tower.",
  category: Category.find_by_name("Colonnes")
)
#--------------------------------------Cattani col------------------------------------
cattani_col = Brand.find_by_name("Cattani")
cattani_col.products.create!(
  name: "Blok-Jet",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964877/blok-jet_tv09lv.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964876/doc_12_180509-folder-blok-jet-silent-1010pdf_aepuej.pdf",
  description: "Le système est silencieux, ventilé et compact. Les deux panneaux de porte donnent un accès facile au compresseur et à l’aspiration pour un entretien régulier.",
  category: Category.find_by_name("Colonnes")
)
#---------------------------------------Recupérateurs d'amalgames----------------------
#---------------------------------------Durr dental ra--------------------------------
durrdental_ra = Brand.find_by_name("Dürr Dental")
durrdental_ra.products.create!(
  name: "Gamme CA",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964875/gamme_CA_akdj6m.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964910/S2419003_DD_619L03_Separiersysteme_M3_FR_Screen_zqsixe.pdf",
  description: "Les systèmes de séparation de Dürr Dental constituent de véritables références dans le secteur dentaire. Ils séparent les sécrétions et les particules solides en toute fiabilité.",
  category: Category.find_by_name("Récupérateurs d'amalgames")
)
#---------------------------------------metasys ra--------------------------------------
metasys_ra = Brand.find_by_name("Metasys")
metasys_ra.products.create!(
  name: "MST 1",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964874/MST1_tdqhcw.webp",
  pdf_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964905/ZK-55-209-12_Brochure_Amalgam-Separation_EN_lkclhd.pdf",
  description: "Avec sa construction modulaire et son taux de séparation de 98,6 %, le MULTI SYSTEM TYP 1 est une étape importante de la technologie dentaire moderne au service de l'environnement.",
  category: Category.find_by_name("Récupérateurs d'amalgames")
)

###################################INSTRUMENTATIONS ET APPAREILS DE TABLES#########################
#--------------------------Actéon----------------------------------------

acteon_iat = Brand.find_by_name("Acteon")
acteon_iat.products.create!(
  name: "Acteon",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964865/acteon_pxwhvr.webp",
  pdf_url: "",
  description: "Reconnue pour son innovation en imagerie et en chirurgie dentaire, Actéon conçoit des équipements de précision qui s’intègrent naturellement dans les cabinets modernes.",
  category: Category.find_by_name("Instrumentations - Appareils de table")
)
#---------------------------Bien Air-----------------------------------

bienair_iat = Brand.find_by_name("Bien Air")
bienair_iat.products.create!(
  name: "Bien Air",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964866/Bien_air_dq2dsy.webp",
  pdf_url: "",
  description: "Alliant ingénierie suisse et performance, Bien-Air propose des instruments rotatifs fiables et ergonomiques, taillés pour un usage intensif au quotidien.",
  category: Category.find_by_name("Instrumentations - Appareils de table")
)
#---------------------------EMS---------------------------------------

ems_iat = Brand.find_by_name("EMS")
ems_iat.products.create!(
  name: "EMS (Electro Medical Systems)",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964866/EMS_nx5tt4.webp",
  pdf_url: "",
  description: "Pionnier en prophylaxie, EMS s’impose comme la référence dans le traitement non invasif du biofilm grâce à ses solutions innovantes de détartrage et d’implant maintenance.",
  category: Category.find_by_name("Instrumentations - Appareils de table")
)
#---------------------------NSK-----------------------------------------

nsk_iat = Brand.find_by_name("NSK")
nsk_iat.products.create!(
  name: "NSK",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964867/NSK_qwpbzj.webp",
  pdf_url: "",
  description: "Avec un savoir-faire japonais centré sur la précision et la longévité, NSK offre une gamme complète d’instruments rotatifs et chirurgicaux reconnus dans le monde entier.",
  category: Category.find_by_name("Instrumentations - Appareils de table")
)

################################# MOBILIER #################################
#------------------------------Meubles dentaires-----------------------------
#-------------------------------Dental Art----------------------------------
dentalart_md = Brand.find_by_name("Dental Art")
dentalart_md.products.create!(
  name: "Dental Art",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964865/dentalart_z764ck.webp",
  pdf_url: "",
  description: "Spécialiste du mobilier dentaire design et fonctionnel, Dental Art allie esthétisme italien et ergonomie pour optimiser chaque espace de soin.",
  category: Category.find_by_name("Meubles dentaires")
)
#------------------------------Intercontidental-------------------------------
intercont_md = Brand.find_by_name("Intercontidental")
intercont_md.products.create!(
  name: "Intercontidental",
  image_url: "https://res.cloudinary.com/dlrov9mea/image/upload/v1744964864/intercontidental_bxk7av.webp",
  pdf_url: "",
  description: "Connue pour ses équipements fiables et accessibles, Intercontinental propose des solutions dentaires pensées pour s’adapter aux besoins quotidiens des praticiens.",
  category: Category.find_by_name("Meubles dentaires")
)


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
articles_images_url = [ "#{base_url}/v1744973342/thibault_j6zzf1_y4gqfu.jpg",
                        "#{base_url}/v1744973342/congres_im1lpq_t63auj.jpg",
                        "#{base_url}/v1744973342/owandy_j636dt_iclpfo.png" ]

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
offers_images_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744973868/Owandy_ADF_24_vtkp09.png",
                      "https://res.cloudinary.com/dlrov9mea/image/upload/v1744973869/NSK_S1_25_k5oans.png",
                      "https://res.cloudinary.com/dlrov9mea/image/upload/v1744973868/Durr_Dental_ADF_2024_i7dknj.png",
                      "https://res.cloudinary.com/dlrov9mea/image/upload/v1744973867/Gamasonic_ADF_24_flm0be.png",
                      "https://res.cloudinary.com/dlrov9mea/image/upload/v1744973867/Bien_Air_S2_jdzjvg.png",
                      "https://res.cloudinary.com/dlrov9mea/image/upload/v1744973868/acteon_ADF_24_pdm83q.png" ]
offers_pdfs_url = [ "https://res.cloudinary.com/dlrov9mea/image/upload/v1744974071/Owandy_ADF_24_auxbcm.pdf",
                    "https://res.cloudinary.com/dlrov9mea/image/upload/v1744974072/BROCHURE-NSK-S1-2025_hyjey6.pdf",
                    "https://res.cloudinary.com/dlrov9mea/image/upload/v1744974071/Durr_Dental_ADF_2024_thwkkm.pdf",
                    "https://res.cloudinary.com/dlrov9mea/image/upload/v1744974070/Gamasonic_ADF_24_ayudax.pdf",
                    "https://res.cloudinary.com/dlrov9mea/image/upload/v1744974070/Bien_Air_S2_xwgfnk.pdf",
                    "https://res.cloudinary.com/dlrov9mea/image/upload/v1744974130/acteon_ADF_24_zzc1kb.pdf" ]

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

puts "Seeding done!"









########################PATRON#############################

# marque = Brand.find_by_name("")
# marques = [ "", "", "" ]
# marque_product_images_url = [ "",
#                               "",
#                               ""
#                             ]
# marque_product_pdfs_url = [ "",
#                                  "",
#                                  ""
#                                 ]
# marque_product_descriptions = [ "",
#                               "",
#                               ""
#                             ]
# marques.each_with_index do |marque_name, index|
#   marque.products.create!(
#     name: marque_name,
#     image_url: marque_product_images_url[index],
#     pdf_url: marque_product_pdfs_url[index],
#     description: marque_product_descriptions[index],
#     category: Category.find_by_name("")
#   )
# end




# marque_ieo = Brand.find_by_name("")
# marque_ieo.products.create!(
#   name: "",
#   image_url: "",
#   pdf_url: "",
#   description: "",
#   category: Category.find_by_name("")
# )
