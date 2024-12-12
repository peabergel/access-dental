import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    // Initialiser la carte
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/elendill/cm4l82r58012201qtfj5bfzzp", // Style noir et blanc
      center: [0.35384, 46.56725], // Coordonnées de la carte
      zoom: 12,
      config: {
        // Initial configuration for the Mapbox Standard style set above. By default, its ID is `basemap`.
        basemap: {
          // Here, we're setting the light preset to `night`.
          lightPreset: 'night'
        }
      }
    });
    console.log(this.map)
    // Ajouter un marqueur
    this.#addMarkersToMap();

    // S'assurer que le filtre est bien appliqué dès le départ
    this.element.style.filter = "grayscale(100%)";
    this.element.style.transition = "filter 0.6s ease"; // Transition fluide
  }

  #addMarkersToMap() {
    const marker = this.markersValue[0];
    new mapboxgl.Marker({ color: "#1c75bc" })
      .setLngLat([marker.lat, marker.lng])
      .setPopup(new mapboxgl.Popup().setText("Access Dental"))
      .addTo(this.map);

    // Application du filtre au survol
    this.element.addEventListener("mouseenter", () => {
      this.element.style.filter = "grayscale(0%)"; // Enlever le filtre (couleurs)
    });

    // Réappliquer le filtre au départ
    this.element.addEventListener("mouseleave", () => {
      this.element.style.filter = "grayscale(100%)"; // Repasser en noir et blanc
    });
  }
}
