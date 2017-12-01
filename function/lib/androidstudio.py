from bs4 import BeautifulSoup
from downhelper import download
from client import have_proxy


def getAndroidStudioURL(HOST,PORT):
    browser = have_proxy(HOST, PORT)
    browser.get('https://developer.android.com/studio/index.html')
    doc = BeautifulSoup(browser.page_source, 'lxml')
    downobj = doc.find(attrs={"id":"linux-bundle"})
    print(downobj['href'])
    browser.close()
    return downobj['href']

HOST = "127.0.0.1"
PORT = "8087"

url = getAndroidStudioURL(HOST,PORT)
download(url,'android.zip')