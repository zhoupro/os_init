from selenium import webdriver
from bs4 import BeautifulSoup


def getOnlineVersion(name='phpstorm'):
    proxy = "127.0.0.1:8087" # IP:PORT or HOST:PORT
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--proxy-server=%s' % proxy)
    browser = webdriver.Chrome(executable_path='/usr/local/bin/chromedriver',chrome_options=chrome_options)
    browser.get('https://www.jetbrains.com/'+name+'/download')
    doc = BeautifulSoup(browser.page_source, 'lxml')
    print(  doc.findAll(attrs={"class":"download__list-details"})  )
    browser.close()

