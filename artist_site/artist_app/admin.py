from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Song)
admin.site.register(Artist)
admin.site.register(Label)
admin.site.register(Album)
admin.site.register(Venue)
admin.site.register(Concert)
admin.site.register(AlbumSong)
admin.site.register(ArtistSong)
admin.site.register(ConcertSongArtist)