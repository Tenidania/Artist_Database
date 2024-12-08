from django.db import models

# Create your models here.
class Song(models.Model):
    SongID = models.AutoField(primary_key=True)
    SongName = models.CharField(max_length=100)
    SongLength = models.IntegerField()

    def __str__(self):
        """String for representing the MyModelName object (in Admin site etc.)."""
        return self.SongName

class Artist(models.Model):
    ArtistID = models.AutoField(primary_key=True)
    ArtistName = models.CharField(max_length=100)
    Country = models.CharField(max_length=50)
    NoOfMembers = models.IntegerField()
    YearStarted = models.IntegerField()
    YearEnded = models.IntegerField()

    def __str__(self):
        return self.ArtistName


class Label(models.Model):
    LabelID = models.AutoField(primary_key=True)
    LabelName = models.CharField(max_length=50)
    Country = models.CharField(max_length=50)
    
    def __str__(self):
        return self.LabelName

class Album(models.Model):
    AlbumID = models.AutoField(primary_key=True)
    AlbumName = models.CharField(max_length=50)
    ReleaseDate = models.DateField()
    LabelID = models.ForeignKey(Label, on_delete=models.CASCADE, db_column='LabelID')

    def __str__(self):
        return self.AlbumName

class Venue(models.Model):
    VenueID = models.AutoField(primary_key=True)  # AutoField for primary key
    VenueName = models.CharField(max_length=255)
    VenueCapacity = models.IntegerField()
    Country = models.CharField(max_length=50)
    City = models.CharField(max_length=50)

    def __str__(self):
        return self.VenueName


class Concert(models.Model):
    ConcertID = models.AutoField(primary_key=True)  # AutoField for primary key
    ConcertName = models.CharField(max_length=200)
    ConcertDate = models.DateField()
    VenueID = models.ForeignKey(Venue, on_delete=models.CASCADE, db_column='VenueID')
    

    def __str__(self):
        return self.ConcertName

# Artist_Song (many-to-many relationship)
class ArtistSong(models.Model):
    ArtistSongID = models.AutoField(primary_key=True)
    SongID = models.ForeignKey(Song, on_delete=models.CASCADE, db_column='SongID')
    ArtistID = models.ForeignKey(Artist, on_delete=models.CASCADE, db_column='ArtistID')

    class Meta:
        unique_together = ('SongID', 'ArtistID')  # Unique constraint for the combination

    def __str__(self):
        return f'{self.ArtistID} - {self.SongID}'


# Album_Song (many-to-many relationship)
class AlbumSong(models.Model):
    AlbumSongID = models.AutoField(primary_key=True)
    SongID = models.ForeignKey(Song, on_delete=models.CASCADE, db_column='SongID')
    AlbumID = models.ForeignKey(Album, on_delete=models.CASCADE, db_column='AlbumID')

    class Meta:
        unique_together = ('SongID', 'AlbumID')  # Unique constraint for the combination

    def __str__(self):
        return f'{self.AlbumID} - {self.SongID}'


# Concert_Song_Artist (many-to-many relationship)
class ConcertSongArtist(models.Model):
    ConcertSongArtistID = models.AutoField(primary_key=True)
    SongID = models.ForeignKey(Song, on_delete=models.CASCADE, db_column='SongID')
    ConcertID = models.ForeignKey(Concert, on_delete=models.CASCADE, db_column='ConcertID')
    ArtistID = models.ForeignKey(Artist, on_delete=models.CASCADE, db_column='ArtistID')

    class Meta:
        unique_together = ('SongID', 'ConcertID', 'ArtistID')  # Unique constraint for the combination

    def __str__(self):
        return f'{self.ArtistID} - {self.SongID} at {self.ConcertID}'
