module ArticlesHelper
  def pdf_image_or_image(article)
    image = image_tag article.image_url,
      alt: "#{article.title} image",
      class: "w-full h-56 sm:h-64 object-cover transform transition duration-500 hover:scale-110 rounded-[2rem]"

    article.pdf_url.present? ? link_to(image, article.pdf_url, target: "_blank") : image
  end
end
