"""
Script to download all the .nc files present at https://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/Monthly/9km/sst
Author: Celien Nanson
"""

import requests
from bs4 import BeautifulSoup

BASE_URL = "https://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/Monthly/9km/sst"

def get_dl_links(): 
	"""
	return all the links that contains a .nc presents on the page pointed by :url
	"""
	links = []
	html = requests.get(BASE_URL)
	soup = BeautifulSoup(html.content, "html.parser") 
	for link in soup.find_all('a'):
		if ".nc" in link.text:
			links.append(link['href'])
	return links

def dl_files(links): 
	"""
	Download all the files within links
	"""
	for link in links:
		file_name = link[link.rindex('/')+1:] # Get the filename from the URL 
		with open(file_name, "wb") as file:
			response = requests.get(link)
			file.write(response.content)

links = get_dl_links()
# Just DL the 2 first links
dl_files(links[:2])
