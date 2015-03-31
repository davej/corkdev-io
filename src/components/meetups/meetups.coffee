angular.module "corkdev"
  .classy.component
    selector: 'meetups'
    templateUrl: 'components/meetups/meetups.html'

    inject: ['$http', '$sce']

    init: ->
      this.getEventsUrl = "https://api.meetup.com/2/events?offset=0&format=json"+
      "&limited_events=False&group_id=12225002&photo-host=public&page=20&fields="+
      "&order=time&status=past%2Cupcoming&desc=false&sig_id=128666892&sig=0ac44cfbc40e282bd4209de8880da2a9ecfb3ea7"+
      "&callback=JSON_CALLBACK"

      this.$http.jsonp(this.getEventsUrl)
        .then(this.populateEvents)


    methods:
      populateEvents: (response) -> this.events = response.data.results
