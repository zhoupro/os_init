from selenium import webdriver
def have_proxy(PROXY_HOST,PROXY_PORT):
    fp = webdriver.FirefoxProfile()
    # Direct = 0, Manual = 1, PAC = 2, AUTODETECT = 4, SYSTEM = 5
    fp.set_preference("network.proxy.type", 1)
    fp.set_preference("network.proxy.http",PROXY_HOST)
    fp.set_preference("network.proxy.http_port",int(PROXY_PORT))
    fp.set_preference("network.proxy.ssl",PROXY_HOST)
    fp.set_preference("network.proxy.ssl_port",int(PROXY_PORT))
    fp.set_preference("general.useragent.override","whater_useragent")
    fp.update_preferences()
    return webdriver.Firefox(firefox_profile=fp)

def no_proxy():
    fp = webdriver.FirefoxProfile()
    fp.set_preference("general.useragent.override", "whater_useragent")
    fp.update_preferences()
    return webdriver.Firefox(firefox_profile=fp)