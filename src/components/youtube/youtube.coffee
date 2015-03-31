angular.module "corkdev"
  .classy.component
    selector: 'youtube-playlist'
    templateUrl: 'components/youtube/youtube.html'

    inject: ['$http']

    init: ->
      apiKey = 'AIzaSyB3ceb6zzls1m5HWl9WGieHwjQCarYCsGs'
      this.getVideosUrl = 'https://www.googleapis.com/youtube/v3/playlistItems?'+
        'part=snippet&maxResults=6&playlistId=PLWPNy8uJbLcvoWF58a2lB-WODsIpr5f99&key='+apiKey

      this.$http.get(this.getVideosUrl)
        .then(this.populatePlaylist)


    methods:
      populatePlaylist: (response) ->
        this.videos = response.data.items.map (item) ->
          item.snippet.descriptionHtml = item.snippet.description.replace('\n','<br><br>')
          item.snippet
        console.log(this.videos)
