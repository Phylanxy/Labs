import config
import spotipy
import json
import requests
from spotipy.oauth2 import SpotifyClientCredentials
import pprint
import pandas as pd
import base64
import csv
import pickle

# Authenticate with Spotify API
client_credentials_manager = SpotifyClientCredentials(
    client_id=config.client_id,
    client_secret=config.client_secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)

# load tracks from csv into list
df_tracks = pd.read_csv("df_tracks.csv")
tracks = df_tracks.values.tolist()
def get_features(track_id):
    track_features = []
    track_features.extend(sp.audio_features(track_id))
    return track_features
def write_list_to_csv(my_list, filename):
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file)
        for item in my_list:
            writer.writerow([item])
def write_list_to_pickle_file(my_list, filename):
    with open(filename, 'wb') as file:
        pickle.dump(my_list, file)

for track in tracks[0:1000]:
    try:
        track_features_lst = []
        track_features_lst.extend(get_features(track))
        write_list_to_csv(track_features_lst, "track_features_lst_2.csv")
    except:
        pass