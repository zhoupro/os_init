from bs4 import BeautifulSoup
from downhelper import download
from client import no_proxy


def getGoURL():
    browser = no_proxy()
    browser.get('https://golang.org/dl/')
    doc = BeautifulSoup(browser.page_source, 'lxml')
    downobj = doc.find_all(attrs={"class":"downloadBox"})
    print(downobj[2]['href'])
    browser.close()
    return downobj[2]['href']

url = getGoURL()

download(url,'go.tar.gz')