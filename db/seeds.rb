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

Category.create(name: "Fauteuils / units")
Category.create(name: "Imagerie extra-orale")
Category.create(name: "Imagerie intra-orale")
Category.create(name: "Éclairages")
Category.create(name: "Hygiène et Stérilisation")
Category.create(name: "Compresseurs et aspirations")
Category.create(name: "Mobilier")
Category.create(name: "Gabarits")
Category.create(name: "Instrumentations - Appareils de table")
Category.create(name: "Fauteuils / units")

puts "Success"
puts "Creating Brands..........."

Brand.create(name:"Airel Quetin", position: Category.first.id, image_url: "https://drive.google.com/file/d/1R2Zxl2AHRj3_tLCEL2oPRLQEd8B3sDTO/view?usp=drive_link")
Brand.create(name:"Belmont", position: Category.second.id, image_url: "https://drive.google.com/file/d/1ffyF7ukt3Jkpgun5v4kY8kLquP7nr0Eq/view?usp=drive_link")
Brand.create(name:"Tecnodent", position: Category.third.id, image_url: "https://drive.google.com/file/d/1sY9GgEOfbyG2BBNcp2quSntsukYnxECS/view?usp=drive_link")
Brand.create(name:"Meunier Carus", position: Category.fourth.id, image_url: "https://drive.google.com/file/d/1rahDBflOk_ksZxZIJHBK0HxyNl0vMtm9/view?usp=drive_link")
Brand.create(name:"Castellini", position: Category.fifth.id, image_url: "https://drive.google.com/file/d/1BCQUaQ87zLHWXm7XW4zDO0_2w_6ek0Io/view?usp=drive_link")

puts "Success"
puts "Creating Products............"


# ------------------------------ Airel Products -------------------------------

Product.create(name: "PE9",
               position: 1,
               category_id: Category.first.id,
               brand_id: Brand.first.id,
               image_url: "https://drive.google.com/file/d/1Zz7g7KnF55pi-VcuK1tYkpc0j3AmAQaW/view?usp=drive_link")
Product.create(name: "K2",
               position: 2,
               category_id: Category.first.id,
               brand_id: Brand.first.id,
               image_url: "https://drive.google.com/file/d/1elXXBSnjaiYxbYI5wm0dqydOE78L0bXD/view?usp=drive_link")
Product.create(name: "Pacific",
               position: 3,
               category_id: Category.first.id,
               brand_id: Brand.first.id,
               image_url: "https://drive.google.com/file/d/19XKnu1VxXzl7x7mJx9tblP6F4d53YKmP/view?usp=drive_link")
Product.create(name: "Cart",
               position: 4,
               category_id: Category.first.id,
               brand_id: Brand.first.id,
               image_url: "https://drive.google.com/file/d/14QL-NQ6hwMLv2MrLLovTjGzZjWX54GYN/view?usp=drive_link")
Product.create(name: "Harley",
               position: 5,
               category_id: Category.first.id,
               brand_id: Brand.first.id,
               image_url: "https://drive.google.com/file/d/1A4OofhfSozYzScEpemc5b9331V55M1jg/view?usp=drive_link")

# ----------------------------- Belmont Products --------------------------------------------

Product.create(name: "Eurus S1",
               position: 1,
               category_id: Category.first.id,
               brand_id: Brand.second.id,
               image_url: "https://drive.google.com/file/d/1YP8Kbvytj4PAbOmqxg6fQkmeHcd7EIq_/view?usp=drive_link")
Product.create(name: "Eurus S6",
               position: 2,
               category_id: Category.first.id,
               brand_id: Brand.second.id,
               image_url: "https://drive.google.com/file/d/1ErTvUctqmNhVaSQeVbBebTDZ4k_0t_mv/view?usp=drive_link")
Product.create(name: "Eurus S8",
               position: 3,
               category_id: Category.first.id,
               brand_id: Brand.second.id,
               image_url: "https://drive.google.com/file/d/17l6M6F8Yq1Vbo08RRXSmtSerkZN7QRgz/view?usp=drive_link")
Product.create(name: "Eurus S4",
               position: 4,
               category_id: Category.first.id,
               brand_id: Brand.second.id,
               image_url: "https://drive.google.com/file/d/1tyj7MHi5iT4eyh3qyge-m340-QaW9Hju/view?usp=drive_link")
Product.create(name: "Cart Eurus",
               position: 5,
               category_id: Category.first.id,
               brand_id: Brand.second.id,
               image_url: "https://drive.google.com/file/d/1y-ijGTkq6FxIjACdK8_piNDPIVOQLAsV/view?usp=drive_link")

puts "Success"
puts "Seeding done !"
