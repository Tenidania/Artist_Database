from django.shortcuts import render
import mysql.connector
from .models import *

connection = mysql.connector.connect(
    host="localhost",
    user="teni",
    password="password",
    database="artist_database"
)
cursor = connection.cursor()




def to_mins(x):
    return f"{x//60}:{x%60:02}"





# Create your views here.
def home(request):
    return render(request, 'home.html', {})


def show_songs(request):
    query='''
        SELECT s.SongName, s.SongLength, a.ArtistName
        FROM artist_app_artistsong AS asg
        JOIN artist_app_song AS s ON asg.SongID = s.SongID
        JOIN artist_app_artist AS a ON asg.ArtistID = a.ArtistID;
    '''
    cursor.execute(query)
    rows = cursor.fetchall()
    print(rows)
    newrows = [(row[0], f"{row[1]//60}:{row[1]%60}", row[2]) for row in rows]

    return render(request, 'songs.html',{'songs': newrows})

def show_songs_by_artist(request):
    query='''
        SELECT a.ArtistName, s.SongName
        FROM artist_app_artistsong AS asg
        JOIN artist_app_song AS s ON asg.SongID = s.SongID
        JOIN artist_app_artist AS a ON asg.ArtistID = a.ArtistID;
    '''
    cursor.execute(query)
    rows = cursor.fetchall()
    # newrows = [(row[0], row[1], f"{row[2]//60}:{row[2]%60}") for row in rows]

    return render(request, 'songs.html',{'songs': rows})


# This shows the longest song played at each concert
def show_longest_songs(request):
    query='''
        SELECT ConcertName
        FROM artist_app_concert;
    '''
    cursor.execute(query)
    concerts = cursor.fetchall()
    concerts = [concert[0] for concert in concerts]
    songs = []
    for concert in concerts:
        query=f'''
            SELECT s.SongName, s.SongLength, a.ArtistName
            FROM artist_app_concert c
            JOIN artist_app_concertsongartist csa ON c.ConcertID = csa.ConcertID
            JOIN artist_app_song s ON csa.SongID = s.SongID
            JOIN artist_app_artist a on a.ArtistID = csa.ArtistID
            WHERE c.ConcertName = '{concert}'
            ORDER BY s.SongLength DESC
            LIMIT 1;
        '''
        cursor.execute(query)
        song = cursor.fetchone()
        newsong = "0"
        try:
            length = to_mins(song[1])
            newsong = (song[0], length, song[2])
        except:
            pass
        songs.append(newsong)
    
        # print(concert, song)

    concert_songs = tuple(zip(concerts, songs))
    return render(request, 'longest_songs.html',{'concert_songs':concert_songs})

def show_most_concert(request):
    query='''
        SELECT c.ConcertName, COUNT(DISTINCT csa.ArtistID) AS ArtistCount
        FROM artist_app_concert c
        JOIN artist_app_concertsongartist csa ON c.ConcertID = csa.ConcertID
        GROUP BY c.ConcertID
        ORDER BY ArtistCount DESC
        LIMIT 1;
    '''
    cursor.execute(query)
    concert = cursor.fetchone()
    query2=f"""
        SELECT DISTINCT ArtistName
        FROM artist_app_concert c
        JOIN artist_app_concertsongartist csa ON c.ConcertID = csa.ConcertID
        JOIN artist_app_artist a ON a.ArtistID = csa.ArtistID
        WHERE c.ConcertName = '{concert[0]}';
    """
    cursor.execute(query2)
    artists = cursor.fetchall()

    artists = [Artist.objects.get(ArtistName=artist[0]) for artist in artists]
    return render(request, "most_played_concert.html", {'concert': concert, 'artists': artists})


def show_most_played_song(request):
    query='''
        SELECT s.SongID, s.SongName, count(SongName) as SongCount
        FROM artist_app_concertsongartist csa
        JOIN artist_app_song s on s.SongID = csa.SongID
        Group BY SongName, SongID
        ORDER BY SongCount DESC
        LIMIT 1;
    '''
    cursor.execute(query)
    song=cursor.fetchone()

    query2=f'''
        SELECT ArtistName
        FROM artist_app_artistsong aso
        JOIN artist_app_artist a ON a.ArtistID = aso.ArtistID
        WHERE aso.SongID ='{song[0]}';
    '''
    cursor.execute(query2)
    artist=cursor.fetchone()
    song_artist = song + artist


    query3=f'''
        SELECT ArtistName, COUNT(ArtistName)
        FROM artist_app_concertsongartist csa
        JOIN artist_app_song s on s.SongID = csa.SongID
        JOIN artist_app_artist a on a.ArtistID = csa.ArtistID
        Where SongName = '{song_artist[1]}'
        GROUP BY ArtistName;
    '''
    cursor.execute(query3)
    artists=cursor.fetchall()

    return render(request, 'most_played_song.html', {'song_artist': song_artist, 'artists':artists})


def show_most_venues(request):
    query='''
        SELECT Country, COUNT(country) as VenueCount
        FROM artist_app_venue
        GROUP BY Country
        ORDER BY VenueCount DESC
        LIMIT 1;
    '''
    cursor.execute(query)
    country = cursor.fetchone()

    query2='''
        SELECT VenueName, VenueCapacity, City, VenueID
        FROM artist_app_venue
        WHERE Country = 'United States'
        ORDER BY VenueCapacity DESC;
    '''
    cursor.execute(query2)
    venues = cursor.fetchall()

    artistsList =[]

    for venue in venues:
        query=f'''
            SELECT DISTINCT a.ArtistName
            FROM artist_app_concertsongartist csa
            JOIN artist_app_concert c on c.ConcertID = csa.ConcertID
            JOIN artist_app_venue v on v.VenueID = c.VenueID
            JOIN artist_app_artist a on a.ArtistID = csa.ArtistID
            WHERE v.VenueID = '{venue[3]}';
        '''
        cursor.execute(query)
        artists = cursor.fetchall()
        artistsList.append(artists)


    # print(country[0])
    # print(tuple(zip(venues,artistsList)))
    venues = zip(venues,artistsList)

    return render(request, 'most_venues.html', {'country':country, 'venues': venues})



def show_longest_song_by_artist(request):

    query='''
        SELECT ArtistName, ArtistID
        FROM artist_app_artist;
    '''
    cursor.execute(query)
    artists = cursor.fetchall()
    songs =[]

    for artist in artists:
        query=f'''
            SELECT a.ArtistName, s.SongName, s.SongLength
            FROM artist_app_song s
            JOIN artist_app_artistsong aso on s.SongID = aso.SongID
            JOIN artist_app_artist a on a.ArtistID = aso.ArtistID
            WHERE a.ArtistID = '{artist[1]}'
            ORDER BY s.SongLength DESC
            LIMIT 1;
        '''
        cursor.execute(query)
        song = cursor.fetchone()
        songs.append(song)

    songs = [(song[0], song[1], to_mins(song[2])) for song in songs]
    print(songs)
    return render(request, 'longest_song_by_artist.html', {'songs':songs})