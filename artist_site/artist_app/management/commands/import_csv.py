import csv
from django.core.management.base import BaseCommand
from django.apps import apps
from artist_app.models import *

class Command(BaseCommand):
    help = 'Imports data from a CSV file into the specified model'

    def add_arguments(self, parser):
        parser.add_argument('model_name', type=str, help='The name of the model to insert data into')
        parser.add_argument('csv_file', type=str, help='The path to the CSV file')

    def handle(self, *args, **kwargs):
        model_name = kwargs['model_name']
        csv_file = kwargs['csv_file']

        # Dynamically get the model class
        try:
            model = apps.get_model('artist_app', model_name)  # Replace 'artist_app' with your app name
        except LookupError:
            self.stdout.write(self.style.ERROR(f'Model "{model_name}" not found in the app "artist_app".'))
            return

        # Open the CSV file and insert data
        try:
            with open(csv_file, 'r') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    if (kwargs['model_name']== 'Album'):
                        label = Label.objects.get(LabelID=row['LabelID'])
                        
                        Album.objects.create(
                            AlbumID=row['AlbumID'],
                            AlbumName=row['AlbumName'],
                            ReleaseDate=row['ReleaseDate'],
                            LabelID=label
                        )
                    elif(kwargs['model_name']== 'Concert'):
                        # Get the related Venue instance
                        venue = Venue.objects.get(VenueID=row['VenueID'])
                        
                        # Create the Concert instance
                        Concert.objects.create(
                            ConcertID=row['ConcertID'],
                            ConcertName=row['ConcertName'],
                            ConcertDate=row['ConcertDate'],
                            VenueID=venue  # Assign the foreign key object
                        )
                        
                    else:
                        # Prepare the data dictionary for the model
                        data = {field: row[field] for field in row if field in [field.name for field in model._meta.fields]}
                        model.objects.create(**data)

            self.stdout.write(self.style.SUCCESS(f'Successfully imported data into {model_name} from {csv_file}'))
        
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Error while processing the CSV file: {str(e)}'))