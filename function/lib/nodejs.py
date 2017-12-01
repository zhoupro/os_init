from bs4 import BeautifulSoup
from downhelper import download
from client import no_proxy


def getNodeURL():
    browser = no_proxy()
    browser.get('https://nodejs.org/en/')
    doc = BeautifulSoup(browser.page_source, 'lxml')
    downobj = doc.find_all(attrs={"class":"home-downloadbutton"})
    print(downobj[0]['href'])
    browser.close()
    return downobj[0]['href']

url = getNodeURL()

download(url,'nodejs.tar.xz')