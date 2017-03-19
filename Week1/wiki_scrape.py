# To try to scrape the website:
# https://en.wikipedia.org/wiki/List_of_United_States_cities_by_population
#
# and extract the City, State, 2015 Estimate, and Location into a CSV file

import re
import sys


def extract_lines():
    table = ['Rank, City, State, PopIn2015, Latitude, Longitude']
    LA = 'Los Angeles, California, 3971883, 34.6643, -73.9385'
    # f = open('dummy.html', 'r')
    f = open('List of United States cities by population - Wikipedia.htm','r')
    text = f.read()
    f.close()
    match = re.findall(r'<td>(\d+)</td>\n.*<a.*>([\w\s.\-]+)</a.*\n.*>(\w+).*\n.*>([\w,]+).*\n.*\n.*\n.*\n.*\n.*\n.*\n.*params=([\d.]*)\w\w\w([\d.]*)', text)
    #match = re.findall(r'<td>(\d+)</td>.*<a.*>([\w\s.\-]+)</a.*\n.*>(\w+).*\n.*>([\w,]+).*\n.*\n.*\n.*\n.*\n.*\n.*\n.*params=([\d.]*)\w\w\w([\d.]*)', text, re.DOTALL)
    #print match
    for city in match:
        s = city[0]+', '+city[1]+', '+city[2]+', '+city[3].replace(',','')+', '+city[4]+', -'+city[5]
        # print s
        table.append(s)
    return table

# assume previous function returns a list with each entry of the form:
# 'Los Angeles, California, 3971883, 34.6643, -73.9385'
# but with the first entry being:
# 'City, State, PopIn2015, Latitude, Longitude'

def main():
    # grab file to save to, or use default, or throw error
    if len(sys.argv) == 1:
        filename = "scraped_wiki_file.csv"
    elif len(sys.argv) == 2:
        filename = sys.argv[1]
    else:
        print 'usage: python wiki_scrape.py file_to_save_to.csv'
        sys.exit(1)

    # write CSV file
    f = open(filename, 'w')
    lst = extract_lines()
    text = '\n'.join(lst) + '\n'
    f.write(text)
    f.close()

if __name__ == '__main__':
    main()
