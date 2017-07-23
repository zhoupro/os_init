from selenium import webdriver
from bs4 import BeautifulSoup
from downhelper import download


def getAndroidStudioVersion():
    proxy = "127.0.0.1:8087" # IP:PORT or HOST:PORT
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--proxy-server=%s' % proxy)
    browser = webdriver.Chrome(executable_path='/opt/soft/dev/selenium/chromedriver',chrome_options=chrome_options)
    browser.get('https://developer.android.com/studio/index.html')
    doc = BeautifulSoup(browser.page_source, 'lxml')
    downobj = doc.find(attrs={"id":"linux-bundle"})
    print(downobj['href'])
    browser.close()
    return downobj['href']


url = getAndroidStudioVersion()
download(url,'android.zip')