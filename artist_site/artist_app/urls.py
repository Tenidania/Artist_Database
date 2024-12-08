from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="home"),
    path('songs', views.show_songs, name="songs"),
    path('most_played_concert', views.show_most_concert, name="most_played_concert"),
    path('most_played_song', views.show_most_played_song, name="most_played_song"),
    path('most_venues', views.show_most_venues, name="most_venues"),
    path('longest_songs', views.show_longest_songs, name="longest_songs"),
    path('longest_song_by_artist', views.show_longest_song_by_artist, name="longest_song_by_artist"),
    path('most_performances', views.show_artist_with_most_performances, name="most_performances"),
]
