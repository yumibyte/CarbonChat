import googlemaps
import reverse_geocoder as rg
import os
from dotenv import load_dotenv

def reverseGeocode(coordinates):
    result = rg.search(coordinates)

    # result is a list containing ordered dictionary.
    return (result[0]['name'])

# Distance Matrix API
def decending(full_list):
        return sorted(full_list, key=lambda k: k['distance in kilometers'])

def distance(origins, destination):

    gmaps = googlemaps.Client(key=API_KEY)

    # call
    result = gmaps.distance_matrix(origins, destination, mode='driving')

    # result is in meters
    origin_result = result['origin_addresses']
    destination_result = result['destination_addresses']
    meters = result['rows'][0]['elements'][0]['distance']['value']
    distance_result = meters/1000
    list = {"origin" : origin_result, "destination" : destination_result, "distance in kilometers" : distance_result}
    return list

# Init keys
load_dotenv()
API_KEY = os.getenv('API_KEY')
