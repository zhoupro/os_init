from bs4 import BeautifulSoup
from downhelper import download
from client import have_proxy


def getGoURL(HOST,PORT):
    browser = have_proxy(HOST, PORT)
    browser.get('https://golang.org/dl/')
    doc = BeautifulSoup(browser.page_source, 'lxml')
    downobj = doc.find_all(attrs={"class":"downloadBox"})
    print(downobj[2]['href'])
    browser.close()
    return downobj[2]['href']

HOST = "127.0.0.1"
PORT = "8087"
url = getGoURL(HOST,PORT)

download(url,'go.tar.gz')