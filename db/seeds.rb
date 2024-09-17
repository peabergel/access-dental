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
  "https://drive.google.com/file/d/1R2Zxl2AHRj3_tLCEL2oPRLQEd8B3sDTO/view?usp=drive_link",
  "https://drive.google.com/file/d/1ffyF7ukt3Jkpgun5v4kY8kLquP7nr0Eq/view?usp=drive_link",
  "https://drive.google.com/file/d/1sY9GgEOfbyG2BBNcp2quSntsukYnxECS/view?usp=drive_link",
  "https://drive.google.com/file/d/1rahDBflOk_ksZxZIJHBK0HxyNl0vMtm9/view?usp=drive_link",
  "https://drive.google.com/file/d/1BCQUaQ87zLHWXm7XW4zDO0_2w_6ek0Io/view?usp=drive_link"
]

fauteuil = Category.find_by_name("Fauteuils / units")
brands.each_with_index do |brand, index|
  Brand.create!(
    category: fauteuil,
    name: brand,
    position: index + 1,
    image_url: brands_images_url[index])
end

puts "Success"
puts "Creating Products............"

# ------------------------------ Airel Products -------------------------------

airel = Brand.find_by_name("Airel Quetin")
airels = [ "PE9", "K2", "Pacific", "Cart", "Harley" ]
airel_product_images_url = ["https://drive.google.com/file/d/1Zz7g7KnF55pi-VcuK1tYkpc0j3AmAQaW/view?usp=drive_link",
                            "https://drive.google.com/file/d/1elXXBSnjaiYxbYI5wm0dqydOE78L0bXD/view?usp=drive_link",
                            "https://drive.google.com/file/d/19XKnu1VxXzl7x7mJx9tblP6F4d53YKmP/view?usp=drive_link",
                            "https://drive.google.com/file/d/14QL-NQ6hwMLv2MrLLovTjGzZjWX54GYN/view?usp=drive_link",
                            "https://drive.google.com/file/d/1A4OofhfSozYzScEpemc5b9331V55M1jg/view?usp=drive_link"]
airels.each_with_index do |airel_name, index|
  airel.products.create!(
    name: airel_name,
    position: index + 1,
    image_url: airel_product_images_url[index]
  )
end

# ----------------------------- Belmont Products --------------------------------------------

belmont = Brand.find_by_name("Belmont")
belmonts = ["Eurus S1", "Eurus S6", "Eurus S8", "Eurus S4", "Cart Eurus"]
belmont_product_images_url = ["https://drive.google.com/file/d/1YP8Kbvytj4PAbOmqxg6fQkmeHcd7EIq_/view?usp=drive_link",
                              "https://drive.google.com/file/d/1ErTvUctqmNhVaSQeVbBebTDZ4k_0t_mv/view?usp=drive_link",
                              "https://drive.google.com/file/d/17l6M6F8Yq1Vbo08RRXSmtSerkZN7QRgz/view?usp=drive_link",
                              "https://drive.google.com/file/d/1tyj7MHi5iT4eyh3qyge-m340-QaW9Hju/view?usp=drive_link",
                              "https://drive.google.com/file/d/1y-ijGTkq6FxIjACdK8_piNDPIVOQLAsV/view?usp=drive_link"
                            ]
belmonts.each_with_index do |belmont_name, index|
  belmont.products.create!(
    name: belmont_name,
    position: index + 1,
    image_url: belmont_product_images_url[index]
  )
end
puts "Success"
puts "Seeding done !"
