style = [
  {
    'featureType': 'administrative'
    'elementType': 'labels.text.fill'
    'stylers': [ { 'color': '#444444' } ]
  }
  {
    'featureType': 'administrative.country'
    'elementType': 'geometry.fill'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'landscape'
    'elementType': 'all'
    'stylers': [ { 'color': '#f2f2f2' } ]
  }
  {
    'featureType': 'poi'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'road'
    'elementType': 'all'
    'stylers': [
      { 'saturation': -100 }
      { 'lightness': 45 }
    ]
  }
  {
    'featureType': 'road.highway'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'simplified' } ]
  }
  {
    'featureType': 'road.arterial'
    'elementType': 'labels.icon'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'transit'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'water'
    'elementType': 'all'
    'stylers': [
      { 'color': '#CF0D19' }
      { 'visibility': 'on' }
    ]
  }
]

initialize = ->
  #51.895500,-8.474064
  location = new (google.maps.LatLng)(51.895500, -8.474064)
  mapOptions =
    center: location
    zoom: 18
    styles: style
  map = new (google.maps.Map)(document.getElementById('meetup-map'), mapOptions)
  marker = new (google.maps.Marker)(
    position: location
    title: 'Level 3, Sample Studios, Former Government Buildings, Sullivan\'s Quay')
  # Add the marker to the map
  marker.setMap map

  infowindow = new (google.maps.InfoWindow)(content: 'Level 3, Sample Studios, Former Government Buildings, Sullivan\'s Quay')
  google.maps.event.addListener marker, 'click', -> infowindow.open map, marker

google.maps.event.addDomListener window, 'load', initialize
