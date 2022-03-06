#Female scientists from India with no article in Urdu (not exist in Urdu Wikipedia)
#PREFIX schema: <http://schema.org/>

SELECT distinct ?item ?itemLabel ?birthDate  ?image 
WHERE {
    ?item wdt:P31 wd:Q5 .
    # Occupation Scientist Gender Female
    ?item wdt:P21 wd:Q6581072 .
    ?item wdt:P106 wd:Q901 .
    # country = India 
    ?item wdt:P27 wd:Q668 .
    ?item wdt:P569 ?birthDate .
    #?item wikibase:sitelinks ?linkcount .
    ?item wdt:P18 ?image .
  #FILTER (?linkcount >= 1) .       # only include items with 1 or more sitelinks
  FILTER NOT EXISTS {
    ?article schema:about ?item .
    ?article schema:inLanguage "ur" .
    ?article schema:isPartOf <https://ur.wikipedia.org/>
  }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en,ur" }
}
#GROUP BY ?item ?itemLabel ?linkcount
#ORDER BY DESC(?linkcount)
