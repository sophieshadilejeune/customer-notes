import mapboxgl from 'mapbox-gl/dist/mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';




const addMarkers = (map, markers) => {

markers.forEach((marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.infowindow);
  new mapboxgl.Marker({color: '#71DB98'})
  .setLngLat([ marker.lng, marker.lat ])
  .setPopup(popup)
  .addTo(map);

});
};

const fitMapToMarkers = (map, markers) => {

  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {

mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

const markers = JSON.parse(mapElement.dataset.markers);

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11'
  });


addMarkers(map, markers);
fitMapToMarkers(map, markers);

};
};


export { initMapbox };
