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
      style: "mapbox://styles/elendill/cm4r5fue100bl01r0fd3ge283", // Style noir et blanc
      center: [2, 47], // Position initiale plus centrée sur le globe
      zoom: 5, // Zoom très large pour voir le globe
      pitch: 0,
      bearing: 0
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

    // Configuration de l'animation de zoom
    const zoomTarget = {
      center: [marker.lat, marker.lng],
      zoom: 12,
      bearing: 0, // Ajout d'une rotation pour plus d'effet
      pitch: 0,
      duration: 2000 // Animation plus longue pour le zoom
    };

    const initialView = {
      center: [2, 47], // Même position initiale que dans le connect()
      zoom: 5,
      bearing: 0,
      pitch: 0,
      duration: 2000 // Animation plus longue pour le retour
    };

    // Application du filtre et zoom au survol
    this.element.addEventListener("mouseenter", () => {
      this.element.style.filter = "grayscale(0%)";
      this.map.flyTo(zoomTarget);
    });

    // Réappliquer le filtre et retour à la vue initiale
    this.element.addEventListener("mouseleave", () => {
      this.element.style.filter = "grayscale(100%)";
    });
  }
}
